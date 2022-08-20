import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:witt/witt.dart';
import 'package:http/http.dart' as http;
import 'package:path/path.dart' as p;

import '../../constant/api_path.dart';
import '../../services/mysql_service.dart';
import '../../utils/messenger_util.dart';

class RegisterPageController {
  final namaLengkapC = TextEditingController();
  final emailC = TextEditingController();
  final noTelponC = TextEditingController();
  final passwordC = TextEditingController();
  final imgFile = ValueNotifier<File?>(null);

  Future<void> register() async {
    if (namaLengkapC.text.isEmpty ||
        emailC.text.isEmpty ||
        noTelponC.text.isEmpty ||
        passwordC.text.isEmpty ||
        imgFile.value == null) {
      MessengerUtil.showAlertDialog(
        title: "Gagal",
        message: "Silahkan Isi semua form",
      );
      return;
    }

    MessengerUtil.showLoadingDialog();

    final img = base64Encode(imgFile.value!.readAsBytesSync());
    final extension = p.extension(imgFile.value!.path);
    final currentDateTime = DateTime.now();
    final name = currentDateTime.toString() + extension;
    final nameFinal = name.replaceAll(" ", "-");
    final upload = await http.post(
      Uri.parse(ApiPath.uploadImage),
      body: {
        "image": img,
        "name": nameFinal,
      },
    );
    print(upload.statusCode);
    print(upload.body);

    await MysqlService.connect();
    final res = await MysqlService.conn.query(
      'INSERT INTO m_user VALUES (null,"${namaLengkapC.text}","${emailC.text}","${passwordC.text}","${noTelponC.text}","$nameFinal","${currentDateTime.toString()}","${currentDateTime.toString()}",null)',
    );

    final affectedRows = res.affectedRows;
    print("Affected: ${res.affectedRows}");

    if (affectedRows == 1) {
      WRouter.pop();
      WRouter.pop();
    } else {
      WRouter.pop();
      MessengerUtil.showAlertDialog(
        title: "Error",
        message: "Database Bermasalah",
      );
      clearForm();
    }
  }

  void clearForm() {
    namaLengkapC.clear();
    emailC.clear();
    noTelponC.clear();
    passwordC.clear();
    imgFile.value = null;
  }

  Future<void> pickImage() async {
    final img = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (img == null) {
      return;
    }
    imgFile.value = File(img.path);
  }
}

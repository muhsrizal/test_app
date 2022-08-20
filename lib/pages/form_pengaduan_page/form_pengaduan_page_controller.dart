import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:image_picker/image_picker.dart';
import '../../constant/api_path.dart';
import 'package:witt/witt.dart';

import '../../route_path.dart';
import 'package:path/path.dart' as p;
import '../../services/mysql_service.dart';
import '../../services/user_services.dart';
import '../../utils/messenger_util.dart';
import '../beranda_page/beranda_page_controller.dart';
import '../pengaduan_page/pengaduan_page_controller.dart';
import 'package:http/http.dart' as http;

class FormPengaduanPageController {
  final judulC = TextEditingController();
  final penjelasanC = TextEditingController();
  final location = ValueNotifier<LatLng?>(null);
  final imgFile = ValueNotifier<File?>(null);

  Future<void> kirim() async {
    if (imgFile.value == null) {
      MessengerUtil.showAlertDialog(
        title: "Gagal",
        message: "Photo Belum Dipilih",
      );
      return;
    }

    if (location.value == null) {
      MessengerUtil.showAlertDialog(
        title: "Tentukan Lokasi",
        message: "Lokasi Belum ditentukan",
      );
      return;
    }

    MessengerUtil.showLoadingDialog();

    final img = base64Encode(imgFile.value!.readAsBytesSync());
    final extension = p.extension(imgFile.value!.path);
    final name = DateTime.now().toString() + extension;
    final nameFinal = name.replaceAll(" ", "-");
    final upload = await http.post(
      Uri.parse(ApiPath.uploadImage),
      body: {
        "image": img,
        "name": nameFinal,
      },
    );

    print(upload.statusCode);
    print(nameFinal);

    if (upload.statusCode != 200) {
      WRouter.pop();
      MessengerUtil.showAlertDialog(
        title: "Gagal",
        message: "Upload Image Gagal",
      );
      return;
    }

    final latitude = location.value!.latitude;
    final longtitude = location.value!.longitude;
    final currentDate = DateTime.now();
    print("ID: ${UserServices.userModel.id}");

    await MysqlService.connect();
    final res = await MysqlService.conn.query(
        "INSERT INTO t_laporan VALUES (null,${UserServices.userModel.id},'${judulC.text}','${penjelasanC.text}','$nameFinal',0,'$latitude','$longtitude',0,0,'${currentDate.toString()}','${currentDate.toString()}')");

    final affected = res.affectedRows;
    print("Affected: $affected");

    if (affected == 1) {
      final berandaPC = WService.get<BerandaPageController>();
      final pengaduanPC = WService.get<PengaduanPageController>();
      pengaduanPC.fetchAllLaporan();
      berandaPC.fetchLaporan();
      clearField();
      WRouter.pop();
      MessengerUtil.showAlertDialog(
        title: "Berhasil",
        message:
            "Pengaduan anda berhasil diajukan, silahkan tunggu respond dari pihak admin",
      );

      return;
    } else {
      WRouter.pop();
      MessengerUtil.showAlertDialog(
        title: "Error",
        message: "Error",
      );
    }
  }

  void clearField() {
    imgFile.value = null;
    judulC.clear();
    penjelasanC.clear();
    location.value = null;
  }

  Future<void> getCoordinate() async {
    final lokasi = await WRouter.pushNamed(RoutePath.lokasiPath);
    location.value = lokasi;
    print(lokasi);
  }

  Future<void> pickImg() async {
    final img = await ImagePicker().pickImage(
      source: ImageSource.gallery,
    );

    if (img == null) {
      return;
    }
    imgFile.value = File(img.path);
  }
}

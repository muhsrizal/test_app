import 'package:flutter/material.dart';
import 'package:witt/witt.dart';

import '../../models/user_model.dart';
import '../../route_path.dart';
import '../../services/local_storage.dart';
import '../../services/mysql_service.dart';
import '../../services/user_services.dart';
import '../../utils/messenger_util.dart';

class LoginPageController {
  final emailC = TextEditingController();
  final passwordC = TextEditingController();

  Future<void> signIn() async {
    if (emailC.text.isEmpty) {
      return;
    }

    await MysqlService.connect();
    final res = await MysqlService.conn.query(
        'SELECT * FROM m_user WHERE email = "${emailC.text}" AND password = "${passwordC.text}"');

    if (res.length == 1) {
      print(res.first.asMap());
      UserServices.userModel = UserModel.fromMap(res.first.fields);
      await LocalStorage.userStorage
          .write("user", UserServices.userModel.toMap());
      WRouter.pushReplacementNamed(RoutePath.homePath);
      return;
    }

    MessengerUtil.showAlertDialog(
      title: "Error",
      message: "Tidak ditemukan atau jaringan error",
    );
  }
}

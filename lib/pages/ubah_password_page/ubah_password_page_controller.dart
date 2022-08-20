import 'package:flutter/material.dart';
import 'package:witt/witt.dart';

import '../../route_path.dart';
import '../../services/mysql_service.dart';
import '../../services/user_services.dart';
import '../../utils/messenger_util.dart';

class UbahPasswordPageController {
  final passC = TextEditingController();
  final passConfirmC = TextEditingController();

  Future<void> changePassword() async {
    if (passC.text != passConfirmC.text) {
      MessengerUtil.showAlertDialog(
          title: "Error", message: "Passsowrd Konfirmasi Tidak Sama");
      return;
    }

    if (passC.text.isEmpty) {
      return;
    }

    await MysqlService.connect();
    final query = await MysqlService.conn.query(
        "UPDATE m_user SET password = '${passC.text}' WHERE id = ${UserServices.userModel.id} ");
    print("Affected: ${query.affectedRows}");
    MessengerUtil.showAlertDialog(
      title: "Berhasil",
      message: "Password Berhasil Diubah",
    ).then((value) {
      WRouter.pushNamedAndRemoveAll(RoutePath.loginPath);
    });
  }
}

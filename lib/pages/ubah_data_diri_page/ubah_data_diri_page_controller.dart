import 'package:flutter/material.dart';
import 'package:witt/witt.dart';

import '../../route_path.dart';
import '../../services/mysql_service.dart';
import '../../services/user_services.dart';
import '../../utils/messenger_util.dart';

class UbahDataDiriPageController extends WDisposable {
  final namaLengkapC = TextEditingController();
  final emailC = TextEditingController();
  final noTelpC = TextEditingController();

  @override
  void initialize() {
    final userModel = UserServices.userModel;
    namaLengkapC.text = userModel.fullName;
    emailC.text = userModel.email;
    noTelpC.text = userModel.phone;
    super.initialize();
  }

  Future<void> editProfile() async {
    await MysqlService.connect();
    final query = await MysqlService.conn.query(
        "UPDATE m_user set fullname = '${namaLengkapC.text}', email = '${emailC.text}', phone = '${noTelpC.text}' WHERE id = ${UserServices.userModel.id} ");
    print("Affeced" + query.affectedRows.toString());

    UserServices.userModel = UserServices.userModel.copyWith(
      fullName: namaLengkapC.text,
      phone: noTelpC.text,
      email: emailC.text,
    );

    MessengerUtil.showAlertDialog(title: "Berhasil", message: "Berhasil Diubah")
        .then(
      (value) {
        WRouter.pushNamedAndRemoveAll(RoutePath.loginPath);
      },
    );
  }
}

import 'package:flutter/material.dart';
import 'package:witt/witt.dart';

import '../../constant/asset_path.dart';
import '../../models/user_model.dart';
import '../../route_path.dart';
import '../../services/local_storage.dart';
import '../../services/mysql_service.dart';
import '../../services/user_services.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    Future.delayed(const Duration(seconds: 3)).then(
      (value) async {
        try {
          await MysqlService.connect();
          final userMap = LocalStorage.userStorage.read("user");
          print(userMap);
          if (userMap == null) {
            WRouter.pushReplacementNamed(RoutePath.loginPath);
            return;
          }
          final userModel = UserModel.fromMap(userMap);
          UserServices.userModel = userModel;
          WRouter.pushReplacementNamed(RoutePath.homePath);
        } catch (e) {
          print(e);
          WRouter.pushReplacementNamed(RoutePath.loginPath);
        }
      },
    );

    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.all(32),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                AssetPath.lambangKabupatenPasuruan,
                width: 150,
              ),
              const SizedBox(height: 32),
              Text(
                "Aplikasi Pengaduan Masyarakat",
                style:
                    textTheme.headline5?.copyWith(fontWeight: FontWeight.bold),
              ),
              Text(
                "Pemerintah Kecamatan Rejoso",
                style: textTheme.bodyText1,
              ),
              Text(
                "Kabupaten Pasuruan",
                style: textTheme.bodyText1,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

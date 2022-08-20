import 'package:flutter/material.dart';
import 'package:witt/witt.dart';

import '../../constant/asset_path.dart';
import '../../route_path.dart';
import '../../theme/palette.dart';
import '../../widgets/input/big_button.dart';
import '../../widgets/input/primary_textfield.dart';
import 'login_page_controller.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final palette = Palette.of(context);
    final loginPC = WService.get<LoginPageController>();

    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(32),
        child: Column(
          children: [
            const SizedBox(height: 64),
            Image.asset(
              AssetPath.lambangKabupatenPasuruan,
              width: 100,
            ),
            const SizedBox(height: 32),
            Text(
              "Selamat Datang",
              style: textTheme.headline5?.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 32),
            PrimaryTextfield(
              label: "Email",
              filled: true,
              controller: loginPC.emailC,
            ),
            const SizedBox(height: 16),
            PrimaryTextfield(
              label: "Password",
              filled: true,
              controller: loginPC.passwordC,
              obscureText: true,
            ),
            const SizedBox(height: 16),
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () {
                  // MysqlService.connect();
                },
                child: Text(
                  "Lupa Password",
                  style: textTheme.bodyText1?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: palette.onPrimary,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16),
            BigButton(
              label: "Masuk",
              primary: palette.primary,
              onPrimary: palette.onSecondary,
              width: double.infinity,
              textStyle:
                  textTheme.headline5?.copyWith(fontWeight: FontWeight.bold),
              onPressed: () async {
                loginPC.signIn();
              },
            ),
            const SizedBox(height: 16),
            BigButton(
              label: "Daftar",
              primary: palette.secondary,
              onPrimary: palette.onSecondary,
              width: double.infinity,
              textStyle:
                  textTheme.headline5?.copyWith(fontWeight: FontWeight.bold),
              onPressed: () => WRouter.pushNamed(RoutePath.registerPath),
            ),
          ],
        ),
      ),
    );
  }
}

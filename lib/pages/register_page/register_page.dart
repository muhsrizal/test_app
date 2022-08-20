import 'package:flutter/material.dart';
import 'package:witt/witt.dart';

import '../../constant/asset_path.dart';
import '../../theme/palette.dart';
import '../../widgets/input/big_button.dart';
import 'widgets/register_forms.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final palette = Palette.of(context);
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(32),
        child: Column(
          children: [
            const SizedBox(height: 32),
            Image.asset(
              AssetPath.lambangKabupatenPasuruan,
              width: 100,
            ),
            const SizedBox(height: 16),
            Text(
              "Buat Akun Anda",
              style: textTheme.headline5?.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            const RegisterForms(),
            const SizedBox(height: 16),
            BigButton(
              label: "Masuk",
              primary: palette.secondary,
              onPrimary: palette.onSecondary,
              width: double.infinity,
              textStyle: textTheme.headline5?.copyWith(
                fontWeight: FontWeight.bold,
              ),
              onPressed: () => WRouter.pop(),
            ),
          ],
        ),
      ),
    );
  }
}

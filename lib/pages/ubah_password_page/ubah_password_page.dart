import 'package:flutter/material.dart';
import 'ubah_password_page_controller.dart';
import '../../theme/palette.dart';
import '../../widgets/input/big_button.dart';
import '../../widgets/input/primary_textfield.dart';
import 'package:witt/witt.dart';

class UbahPasswordPage extends StatelessWidget {
  const UbahPasswordPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final palette = Palette.of(context);
    final ubahPasswordPC = WService.get<UbahPasswordPageController>();

    return Scaffold(
      appBar: AppBar(
        title: const Text("Ubah Password"),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            const SizedBox(height: 16),
            PrimaryTextfield(
              hint: "Password Baru",
              controller: ubahPasswordPC.passC,
              obscureText: true,
            ),
            const SizedBox(height: 16),
            PrimaryTextfield(
              hint: "Konfirmasi Password",
              controller: ubahPasswordPC.passConfirmC,
              obscureText: true,
            ),
            const SizedBox(height: 16),
            BigButton(
              label: "Simpan",
              onPrimary: palette.onSecondary,
              width: double.infinity,
              onPressed: () => ubahPasswordPC.changePassword(),
            ),
            const SizedBox(height: 16),
            BigButton(
              label: "Batal",
              width: double.infinity,
              onPressed: () => WRouter.pop(),
            ),
          ],
        ),
      ),
    );
  }
}

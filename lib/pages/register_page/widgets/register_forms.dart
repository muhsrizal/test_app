import 'package:flutter/material.dart';
import 'package:witt/witt.dart';

import '../../../theme/palette.dart';
import '../../../widgets/input/big_button.dart';
import '../../../widgets/input/primary_textfield.dart';
import '../register_page_controller.dart';

class RegisterForms extends StatelessWidget {
  const RegisterForms({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final palette = Palette.of(context);
    final textTheme = Theme.of(context).textTheme;
    final registerPC = WService.get<RegisterPageController>();

    return Column(
      children: [
        PrimaryTextfield(
          label: "Nama Lengkap",
          filled: true,
          controller: registerPC.namaLengkapC,
        ),
        const SizedBox(height: 16),
        PrimaryTextfield(
          label: "Email",
          filled: true,
          controller: registerPC.emailC,
        ),
        const SizedBox(height: 16),
        PrimaryTextfield(
          label: "No Telepon",
          filled: true,
          controller: registerPC.noTelponC,
        ),
        const SizedBox(height: 16),
        PrimaryTextfield(
          label: "Password",
          filled: true,
          obscureText: true,
          controller: registerPC.passwordC,
        ),
        const SizedBox(height: 16),
        Align(
          alignment: Alignment.centerLeft,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Foto KTP",
                style: textTheme.headline6?.copyWith(
                  color: palette.onPrimary,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              WListener(
                notifier: registerPC.imgFile,
                builder: (context) {
                  final imgFile = registerPC.imgFile.value;

                  return Material(
                    elevation: 2,
                    borderRadius: BorderRadius.circular(8),
                    child: ElevatedButton(
                      onPressed: () => registerPC.pickImage(),
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        primary: palette.lightGrey,
                      ),
                      child: Text(
                        imgFile == null
                            ? "Choose File"
                            : "Gambar Sudah Dipilih",
                      ),
                    ),
                  );
                },
              ),
              const SizedBox(height: 16),
              BigButton(
                label: "Daftar",
                primary: palette.primary,
                onPrimary: palette.onSecondary,
                width: double.infinity,
                textStyle:
                    textTheme.headline5?.copyWith(fontWeight: FontWeight.bold),
                onPressed: () {
                  registerPC.register();
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'ubah_data_diri_page_controller.dart';
import '../../theme/palette.dart';
import '../../widgets/input/big_button.dart';
import '../../widgets/input/primary_textfield.dart';
import 'package:witt/witt.dart';

class UbahDataDiriPage extends StatelessWidget {
  const UbahDataDiriPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final palette = Palette.of(context);
    final textTheme = Theme.of(context).textTheme;
    final ubahDataDiriPC = WService.get<UbahDataDiriPageController>();

    return Scaffold(
      appBar: AppBar(
        title: const Text("Edit Akun"),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Align(
              alignment: Alignment.center,
              child: Stack(
                children: [
                  const Padding(
                    padding: EdgeInsets.only(bottom: 16),
                    child: CircleAvatar(
                      radius: 62,
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: palette.onBackground,
                      ),
                      child: Icon(
                        Icons.edit,
                        color: palette.background,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            Text(
              "Identitas Diri",
              style: textTheme.bodyText1,
            ),
            const SizedBox(height: 16),
            PrimaryTextfield(
              label: "Nama Lengkap",
              controller: ubahDataDiriPC.namaLengkapC,
            ),
            const SizedBox(height: 8),
            PrimaryTextfield(
              label: "Email",
              controller: ubahDataDiriPC.emailC,
            ),
            const SizedBox(height: 8),
            PrimaryTextfield(
              label: "Nomor Telepon",
              controller: ubahDataDiriPC.noTelpC,
            ),
            const SizedBox(height: 32),
            BigButton(
              label: "Simpan",
              width: double.infinity,
              onPrimary: palette.onSecondary,
              onPressed: () => ubahDataDiriPC.editProfile(),
            ),
            const SizedBox(height: 16),
            BigButton(
              label: "Batal",
              width: double.infinity,
              onPrimary: palette.onSecondary,
              primary: palette.error,
              onPressed: () => WRouter.pop(),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:witt/witt.dart';

import '../../theme/palette.dart';
import '../../widgets/input/big_button.dart';
import '../../widgets/input/primary_textfield.dart';
import 'form_pengaduan_page_controller.dart';

class FormPengaduanPage extends StatelessWidget {
  const FormPengaduanPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final palette = Palette.of(context);
    final textTheme = Theme.of(context).textTheme;
    final formPengaduanPC = WService.get<FormPengaduanPageController>();

    return Scaffold(
      appBar: AppBar(
        title: const Text("Form Pengaduan"),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(32),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: () => formPengaduanPC.pickImg(),
              child: WListener(
                notifier: formPengaduanPC.imgFile,
                builder: (context) {
                  final img = formPengaduanPC.imgFile.value;

                  return Container(
                    decoration: BoxDecoration(
                      color: palette.lightGrey,
                      image: img != null
                          ? DecorationImage(
                              image: FileImage(img),
                              fit: BoxFit.cover,
                            )
                          : null,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 1,
                          blurRadius: 7,
                          offset: const Offset(0, 3),
                        ),
                      ],
                    ),
                    width: double.infinity,
                    height: 250,
                    alignment: Alignment.center,
                    child: img == null
                        ? Text(
                            "Tambah Foto +",
                            style: textTheme.headline5
                                ?.copyWith(fontWeight: FontWeight.bold),
                          )
                        : null,
                  );
                },
              ),
            ),
            const SizedBox(height: 16),
            PrimaryTextfield(
              label: "Judul Pengaduan",
              controller: formPengaduanPC.judulC,
            ),
            const SizedBox(height: 16),
            PrimaryTextfield(
              label: "Penjelasan",
              maxLines: 4,
              controller: formPengaduanPC.penjelasanC,
            ),
            const SizedBox(height: 16),
            Text(
              "Tentukan Lokasi",
              style: textTheme.headline6?.copyWith(
                color: palette.onPrimary,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            WListener(
              notifier: formPengaduanPC.location,
              builder: (context) => Material(
                elevation: 2,
                borderRadius: BorderRadius.circular(8),
                child: ElevatedButton(
                  onPressed: () => formPengaduanPC.getCoordinate(),
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    primary: palette.lightGrey,
                  ),
                  child: Text(
                    formPengaduanPC.location.value == null
                        ? "Get Current Cordinate"
                        : "Lokasi Sudah ditentukan",
                  ),
                ),
              ),
            ),
            const SizedBox(height: 32),
            BigButton(
              label: "Kirim",
              width: double.infinity,
              textStyle:
                  textTheme.headline6?.copyWith(fontWeight: FontWeight.bold),
              onPrimary: palette.onSecondary,
              onPressed: () => formPengaduanPC.kirim(),
            )
          ],
        ),
      ),
    );
  }
}

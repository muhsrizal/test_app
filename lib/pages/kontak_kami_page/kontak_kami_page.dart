import 'package:flutter/material.dart';

import 'widgets/kontak_kami_item.dart';

class KontakKamiPage extends StatelessWidget {
  const KontakKamiPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Kontak Kami"),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Kantor Kecamatan Rejoso Kabupaten Pasuruan",
              style: textTheme.headline5
                  ?.copyWith(decoration: TextDecoration.underline),
            ),
            const SizedBox(height: 16),
            const KontakKamiItem(
              title: "Alamat: ",
              subtitle: "Jl.Rejoso No.01 Kecamatan Rejoso Kabupaten Pasuruan",
            ),
            const SizedBox(height: 8),
            const KontakKamiItem(
              title: "Email: ",
              subtitle: "Kec.rejoso@yahoo.co.id",
            ),
            const SizedBox(height: 8),
            const KontakKamiItem(
              title: "Fax: ",
              subtitle: "(0343484345)",
            ),
            const SizedBox(height: 24),
            Text(
              "Jam Pelayanan",
              style: textTheme.headline5
                  ?.copyWith(decoration: TextDecoration.underline),
            ),
            const SizedBox(height: 16),
            const KontakKamiItem(
              title: "Hari",
              subtitle: "Senin-Jum`at",
            ),
            const SizedBox(height: 8),
            const KontakKamiItem(
              title: "Jam Kerja ",
              subtitle: "8am to 4pm",
            ),
          ],
        ),
      ),
    );
  }
}

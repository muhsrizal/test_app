import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:witt/witt.dart';

import '../../theme/palette.dart';
import 'beranda_page_controller.dart';
import 'widgets/beranda_page.dart';

class BerandaPage extends StatelessWidget {
  const BerandaPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final palette = Palette.of(context);
    final textTheme = Theme.of(context).textTheme;
    final berandaPC = WService.get<BerandaPageController>();

    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const BerandaAvatar(),
          const SizedBox(height: 32),
          Text(
            "Menu Utama",
            style: textTheme.bodyText1?.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          WListener(
            notifier: berandaPC.listLaporan,
            builder: (context) {
              final listLaporan = berandaPC.listLaporan;
              final diajukan =
                  listLaporan.where((p0) => p0.status == 0).toList();
              final diproses =
                  listLaporan.where((p0) => p0.status == 1).toList();
              final selesai =
                  listLaporan.where((p0) => p0.status == 2).toList();
              final ditolak =
                  listLaporan.where((p0) => p0.status == 3).toList();
              return Column(
                children: [
                  Row(
                    children: [
                      _BigButton(
                        number: diajukan.length.toString(),
                        title: "Pengaduan Diajukan",
                        primary: palette.primary,
                      ),
                      const SizedBox(width: 16),
                      _BigButton(
                        number: diproses.length.toString(),
                        title: "Pengaduan Diproses",
                        primary: palette.tersiary,
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      _BigButton(
                        number: selesai.length.toString(),
                        title: "Pengaduan Selesai",
                        primary: palette.secondary,
                      ),
                      const SizedBox(width: 16),
                      _BigButton(
                        number: ditolak.length.toString(),
                        title: "Pengaduan Ditolak",
                        primary: palette.surface,
                      ),
                    ],
                  ),
                ],
              );
            },
          ),
          const SizedBox(height: 32),
          Text(
            "Riwayat Pengaduan",
            style: textTheme.bodyText1?.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16),
          WListener(
              notifier: berandaPC.listLaporan,
              builder: (context) {
                final listLaporan = berandaPC.listLaporan.value;
                listLaporan.sort(
                  (a, b) => a.updatedAt.compareTo(b.updatedAt),
                );

                return Column(
                  children: listLaporan.map(
                    (model) {
                      final date =
                          DateFormat.MMMMEEEEd().format(model.updatedAt);

                      return Container(
                        margin: const EdgeInsets.only(bottom: 16),
                        decoration: BoxDecoration(
                          border: Border.all(),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: ListTile(
                          title: Text(model.title!),
                          subtitle: Text(date),
                        ),
                      );
                    },
                  ).toList(),
                );
              }),
        ],
      ),
    );
  }
}

class _BigButton extends StatelessWidget {
  const _BigButton({
    Key? key,
    required this.title,
    required this.primary,
    required this.number,
    this.onTap,
  }) : super(key: key);

  final String title;
  final String number;
  final Color primary;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final palette = Palette.of(context);

    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: primary,
            borderRadius: BorderRadius.circular(8),
            // boxShadow: [
            //   BoxShadow(
            //     color: Colors.grey.withOpacity(0.5),
            //     spreadRadius: 1,
            //     // blurRadius: ,
            //     offset: const Offset(0, 6),
            //   ),
            // ],
          ),
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: palette.grey.withOpacity(.3),
                ),
                child: Text(
                  number,
                  style: textTheme.headline6?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: palette.onSecondary,
                  ),
                ),
              ),
              Text(
                title,
                style: textTheme.bodyText1?.copyWith(
                  color: palette.onSecondary,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

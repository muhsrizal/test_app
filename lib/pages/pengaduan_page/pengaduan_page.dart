import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../constant/api_path.dart';
import 'package:witt/witt.dart';

import '../../models/laporan_beranda_model.dart';
import '../../theme/palette.dart';
import 'pengaduan_page_controller.dart';

class PengaduanPage extends StatelessWidget {
  const PengaduanPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final pengaduanPC = WService.get<PengaduanPageController>();

    return Scaffold(
      appBar: AppBar(
        title: const Text("Beranda"),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: WListener(
          notifier: pengaduanPC.listLaporan,
          builder: (context) => Column(
            children: pengaduanPC.listLaporan.value
                .map(
                  (e) => _PengaduanItem(laporanModel: e),
                )
                .toList(),
          ),
        ),
      ),
    );
  }
}

class _PengaduanItem extends StatelessWidget {
  const _PengaduanItem({
    Key? key,
    required this.laporanModel,
  }) : super(key: key);

  final LaporanBerandaModel laporanModel;

  @override
  Widget build(BuildContext context) {
    final palette = Palette.of(context);
    final textTheme = Theme.of(context).textTheme;

    return GestureDetector(
      onTap: () async {},
      child: Column(
        children: [
          Row(
            children: [
              const CircleAvatar(),
              const SizedBox(width: 8),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    laporanModel.userModel!.fullName,
                    style: textTheme.headline6
                        ?.copyWith(fontWeight: FontWeight.bold),
                  ),
                  Text(
                    laporanModel.userModel!.email,
                    style: textTheme.bodyText2,
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 16),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: palette.background,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 2,
                  blurRadius: 7,
                  offset: const Offset(0, 3),
                ),
              ],
            ),
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: palette.primary,
                    borderRadius: const BorderRadius.vertical(
                      top: Radius.circular(10),
                    ),
                  ),
                  height: 200,
                  width: double.infinity,
                  child: Image.network(
                    ApiPath.baseUrl + "/" + laporanModel.image!,
                    errorBuilder: (context, error, stackTrace) => const Center(
                      child: Text("Img Error"),
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    children: [
                      Text(
                        laporanModel.desc.toString(),
                      ),
                      const SizedBox(height: 16),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            DateFormat.MMMMEEEEd()
                                .format(laporanModel.updatedAt),
                            style: textTheme.bodyText1?.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: const [
                              Icon(Icons.thumb_up),
                              SizedBox(width: 8),
                              Icon(Icons.thumb_down),
                            ],
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }
}

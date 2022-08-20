import 'package:flutter/material.dart';
import 'package:witt/witt.dart';

import '../../models/laporan_beranda_model.dart';
import '../../services/mysql_service.dart';

class PengaduanPageController extends WDisposable {
  final listLaporan = ValueNotifier<List<LaporanBerandaModel>>([]);

  @override
  void initialize() {
    fetchAllLaporan();
    super.initialize();
  }

  Future<void> fetchAllLaporan() async {
    await MysqlService.connect();
    final query = await MysqlService.conn.query(
      "SELECT * FROM t_laporan INNER JOIN m_user ON t_laporan.user_id = m_user.id WHERE t_laporan.`status` = 2",
    );
    List<LaporanBerandaModel> listLaporan = [];
    print(query.first.fields);
    for (var item in query) {
      final laporan = LaporanBerandaModel.fromMap(item.fields);
      listLaporan.add(laporan);
    }
    this.listLaporan.value = listLaporan;

    print("Length: " + listLaporan.length.toString());
  }
}

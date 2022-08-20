import 'package:flutter/material.dart';
import 'package:witt/witt.dart';

import '../../models/laporan_model.dart';
import '../../services/mysql_service.dart';
import '../../services/user_services.dart';

class BerandaPageController extends WDisposable {
  final listLaporan = ValueNotifier<List<LaporanModel>>([]);

  @override
  void initialize() async {
    fetchLaporan();
    super.initialize();
  }

  Future<void> fetchLaporan() async {
    await MysqlService.connect();
    final query = await MysqlService.conn.query(
        "SELECT * FROM t_laporan WHERE user_id = ${UserServices.userModel.id}");
    List<LaporanModel> listLaporan = [];
    for (var item in query) {
      final laporan = LaporanModel.fromMap(item.fields);
      listLaporan.add(laporan);
    }
    this.listLaporan.value = listLaporan;

    print("Length: " + listLaporan.length.toString());
  }
}

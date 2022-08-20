import 'package:mysql1/mysql1.dart';

class MysqlService {
  static late MySqlConnection conn;

  static Future<void> connect() async {
    final settings = ConnectionSettings(
      host: '46.17.173.217',
      port: 3306,
      user: 'u1093549_rejoso',
      password: 'rejoso123#@!',
      db: 'u1093549_rejoso',
    );

    conn = await MySqlConnection.connect(settings);
    print(conn);
  }
}

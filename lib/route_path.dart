import 'package:witt/witt.dart';

import 'pages/beranda_page/beranda_page.dart';
import 'pages/beranda_page/beranda_page_controller.dart';
import 'pages/form_pengaduan_page/form_pengaduan_page.dart';
import 'pages/form_pengaduan_page/form_pengaduan_page_controller.dart';
import 'pages/home_page/home_page.dart';
import 'pages/home_page/home_page_controller.dart';
import 'pages/kontak_kami_page/kontak_kami_page.dart';
import 'pages/login_page/login_page.dart';
import 'pages/login_page/login_page_controller.dart';
import 'pages/lokasi_page/lokasi_page.dart';
import 'pages/lokasi_page/lokasi_page_controller.dart';
import 'pages/pengaduan_page/pengaduan_page.dart';
import 'pages/pengaduan_page/pengaduan_page_controller.dart';
import 'pages/profile_page/profile_page.dart';
import 'pages/register_page/register_page.dart';
import 'pages/register_page/register_page_controller.dart';
import 'pages/splash_page/splash_page.dart';
import 'pages/ubah_data_diri_page/ubah_data_diri_page.dart';
import 'pages/ubah_data_diri_page/ubah_data_diri_page_controller.dart';
import 'pages/ubah_password_page/ubah_password_page.dart';
import 'pages/ubah_password_page/ubah_password_page_controller.dart';

class RoutePath {
  static const berandaPath = "/beranda";
  static const formPengaduanPath = "/form-pengaduan";
  static const homePath = "/home";
  static const loginPath = "/login";
  static const lokasiPath = "/lokasi";
  static const pengaduanPath = "/pengaduan";
  static const profilePath = "/profile";
  static const registerPath = "/register";
  static const splashPath = "/splash";
  static const ubahDataDiriPath = "/ubah-data-diri";
  static const ubahPasswordPath = "/ubah-password";
  static const kontakKamiPath = "/kontak-kami";

  static final listPage = [
    WPage(
      path: berandaPath,
      builder: (context, args) => const BerandaPage(),
    ),
    WPage(
      path: formPengaduanPath,
      builder: (context, args) => const FormPengaduanPage(),
      serviceBuilder: (context, args) {
        WService.addSingleton(() => FormPengaduanPageController());
      },
    ),
    WPage(
      path: homePath,
      builder: (context, args) => const HomePage(),
      serviceBuilder: (context, args) {
        WService.addSingleton(() => HomePageController());
        WService.addSingleton(() => PengaduanPageController());
        WService.addSingleton(() => FormPengaduanPageController());
        WService.addSingleton(() => BerandaPageController());
      },
    ),
    WPage(
      path: loginPath,
      builder: (context, args) => const LoginPage(),
      serviceBuilder: (context, args) {
        WService.addSingleton(() => LoginPageController());
      },
    ),
    WPage(
      path: lokasiPath,
      builder: (context, args) => const LokasiPage(),
      serviceBuilder: (context, args) {
        WService.addSingleton(() => LokasiPageController());
      },
    ),
    WPage(
      path: pengaduanPath,
      builder: (context, args) => const PengaduanPage(),
    ),
    WPage(
      path: profilePath,
      builder: (context, args) => const ProfilePage(),
    ),
    WPage(
      path: registerPath,
      builder: (context, args) => const RegisterPage(),
      serviceBuilder: (context, args) {
        WService.addSingleton(() => RegisterPageController());
      },
    ),
    WPage(
      path: splashPath,
      builder: (context, args) => const SplashPage(),
    ),
    WPage(
      path: ubahDataDiriPath,
      builder: (context, args) => const UbahDataDiriPage(),
      serviceBuilder: (context, args) =>
          WService.addSingleton(() => UbahDataDiriPageController()),
    ),
    WPage(
      path: ubahPasswordPath,
      builder: (context, args) => const UbahPasswordPage(),
      serviceBuilder: (context, args) =>
          WService.addSingleton(() => UbahPasswordPageController()),
    ),
    WPage(
      path: kontakKamiPath,
      builder: (context, args) => const KontakKamiPage(),
    ),
  ];
}

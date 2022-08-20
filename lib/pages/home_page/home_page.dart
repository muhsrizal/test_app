import 'package:flutter/material.dart';
import 'package:witt/witt.dart';

import '../../theme/palette.dart';
import '../beranda_page/beranda_page.dart';
import '../form_pengaduan_page/form_pengaduan_page.dart';
import '../pengaduan_page/pengaduan_page.dart';
import '../profile_page/profile_page.dart';
import 'home_page_controller.dart';
import 'widgets/home_bottom_navbar.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final palette = Palette.of(context);
    final textTheme = Theme.of(context).textTheme;
    final homePC = WService.get<HomePageController>();

    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 16),
          Expanded(
            child: PageView(
              controller: homePC.pageController,
              onPageChanged: (index) {
                homePC.currentIndex.value = index;
              },
              children: const [
                BerandaPage(),
                PengaduanPage(),
                FormPengaduanPage(),
                ProfilePage(),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: const HomeBottomNavbar(),
    );
  }
}

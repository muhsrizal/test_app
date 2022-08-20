import 'package:flutter/material.dart';
import 'package:witt/witt.dart';

import '../../../constant/asset_path.dart';
import '../../../theme/palette.dart';
import '../home_page_controller.dart';

class HomeBottomNavbar extends StatelessWidget {
  const HomeBottomNavbar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final palette = Palette.of(context);
    final homePC = WService.get<HomePageController>();

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: palette.background,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 5,
            blurRadius: 7,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: WListener(
        notifier: homePC.currentIndex,
        builder: (context) => Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _BottomBarItem(
              assetPath: AssetPath.house,
              currentIndex: homePC.currentIndex.value,
              index: 0,
            ),
            _BottomBarItem(
              assetPath: AssetPath.like,
              currentIndex: homePC.currentIndex.value,
              index: 1,
            ),
            _BottomBarItem(
              assetPath: AssetPath.telephone,
              currentIndex: homePC.currentIndex.value,
              index: 2,
            ),
            _BottomBarItem(
              assetPath: AssetPath.discord,
              currentIndex: homePC.currentIndex.value,
              index: 3,
            ),
          ],
        ),
      ),
    );
  }
}

class _BottomBarItem extends StatelessWidget {
  const _BottomBarItem({
    Key? key,
    required this.assetPath,
    required this.index,
    required this.currentIndex,
  }) : super(key: key);

  final String assetPath;
  final int index;
  final int currentIndex;

  @override
  Widget build(BuildContext context) {
    final palette = Palette.of(context);
    final homePC = WService.get<HomePageController>();

    return GestureDetector(
      onTap: () {
        homePC.pageController.jumpToPage(index);
        homePC.currentIndex.value = index;
      },
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: index == currentIndex ? palette.primary : null,
        ),
        child: Image.asset(
          assetPath,
          width: 32,
        ),
      ),
    );
  }
}

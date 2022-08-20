import 'package:flutter/material.dart';
import 'package:witt/witt.dart';

class HomePageController extends WDisposable {
  final pageController = PageController();
  final currentIndex = ValueNotifier(0);
}

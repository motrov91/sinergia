import 'package:flutter/material.dart';

class MenuHomeProvider with ChangeNotifier {
  int _currentItem = 0;
  PageController _controller = new PageController();

  int get currentItem => _currentItem;
  set currentItem(int value) {
    _currentItem = value;

    _controller.animateToPage(value,
        duration: const Duration(milliseconds: 50), curve: Curves.easeOut);

    notifyListeners();
  }

  PageController get pageController => _controller;
}

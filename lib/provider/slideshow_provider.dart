import 'package:flutter/material.dart';

class SlideshowProvider with ChangeNotifier {
  double _currentPage = 0;
  double _sizeItemActive = 20;
  double _sizeItemInactive = 10;
  Color _primaryColor = Colors.blueGrey;
  Color _secondaryColor = Colors.grey;
  int _initialPage = 0;

  double get currentPage => _currentPage;
  set currentPage(double value) {
    _currentPage = value;
    notifyListeners();
  }

  Color get primaryColor => _primaryColor;
  set primaryColor(Color value) {
    _primaryColor = value;
  }

  Color get secondaryColor => _secondaryColor;
  set secondaryColor(Color value) {
    _secondaryColor = value;
  }

  double get sizeItemActive => _sizeItemActive;
  set sizeItemActive(double value) {
    _sizeItemActive = value;
  }

  double get sizeItemInactive => _sizeItemInactive;
  set sizeItemInactive(double value) {
    _sizeItemInactive = value;
  }

  int get initialPage => _initialPage;
  set initialPage(int value) {
    _initialPage = value;
  }
}

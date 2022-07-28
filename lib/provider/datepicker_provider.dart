import 'package:flutter/material.dart';

class DatePickerProvider with ChangeNotifier {
  DateTime _dateSelected = DateTime.now();

  DateTime get dateSelected => _dateSelected;
  set dateSelected(DateTime value) {
    _dateSelected = value;
    notifyListeners();
  }
}

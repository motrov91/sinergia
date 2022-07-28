import 'package:flutter/material.dart';

class FormLoginProvider with ChangeNotifier {
  bool _errorId = false;
  bool _errorPass = false;

  bool get errorId => _errorId;
  set errorId(bool value) {
    print('valueId $value');
    _errorId = value;
  }

  bool get errorPass => _errorPass;
  set errorPass(bool value) {
    print('valuePass $value');
    _errorPass = value;
  }
}

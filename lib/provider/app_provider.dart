import 'package:flutter/material.dart';

class AppProvider extends ChangeNotifier {
  int _appIndex = 1;
  int get appIndex => _appIndex;

  void setAppIndex(int index) {
    _appIndex = index;
    notifyListeners();
  }
}

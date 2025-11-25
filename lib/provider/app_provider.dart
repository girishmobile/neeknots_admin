import 'package:flutter/material.dart';

class AppProvider extends ChangeNotifier {
  bool _isManager = false;
  bool get isManager => _isManager;

  int _pageIndex = 2;

  int get pageIndex => _pageIndex;

  void setPageIndex(int index) {
    _pageIndex = index;
    notifyListeners();
  }

  void setIsManagerOrSelf(bool value) {
    _isManager = value;
    notifyListeners();
  }
}

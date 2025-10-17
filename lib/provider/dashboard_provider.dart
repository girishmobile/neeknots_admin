import 'package:flutter/material.dart';

class DashboardProvider extends ChangeNotifier {
  int _pageIndex = 2;

  int get pageIndex => _pageIndex;

  void setPageIndex(int index) {
    _pageIndex = index;
    notifyListeners();
  }
}

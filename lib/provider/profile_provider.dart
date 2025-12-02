import 'package:flutter/material.dart';

class ProfileProvider extends ChangeNotifier {
  bool _isLoading = false;
  bool get isLoading => _isLoading;

  String? _profileImage;
  String? get profileImage => _profileImage;

  Map<String, dynamic>? _role;
  Map<String, dynamic>? get role => _role;

  void setLoading(bool val) {
    _isLoading = val;
    notifyListeners();
  }

  void setNetworkImage(String url) {
    _profileImage = url;
    notifyListeners();
  }
}

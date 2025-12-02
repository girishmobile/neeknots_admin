import 'package:flutter/material.dart';
import 'package:neeknots_admin/models/user_model.dart';
import 'package:neeknots_admin/utility/secure_storage.dart';

class ProfileProvider extends ChangeNotifier {
  bool _isLoading = false;
  bool get isLoading => _isLoading;

  String? _profileImage;
  String? get profileImage => _profileImage;

  Map<String, dynamic>? _role;
  Map<String, dynamic>? get role => _role;
  bool _isManager = true;
  bool get isManager => _isManager;

  void setLoading(bool val) {
    _isLoading = val;
    notifyListeners();
  }

  void setNetworkImage(String url) {
    _profileImage = url;
    notifyListeners();
  }
}

import 'package:flutter/material.dart';
import 'package:neeknots_admin/models/user_model.dart';
import 'package:neeknots_admin/utility/secure_storage.dart';

class ProfileProvider extends ChangeNotifier {
  String? _profileImage;
  String? get profileImage => _profileImage;

  Map<String, dynamic>? _role;
  Map<String, dynamic>? get role => _role;
  bool _isManager = true;
  bool get isManager => _isManager;

  void setNetworkImage(String url) {
    _profileImage = url;
    notifyListeners();
  }

  Future<void> loadProfileFromStorage() async {
    UserModel? user = await SecureStorage.getUser();
    if (user != null) {
      _profileImage = user.profile;
      _role = user.role;
      final roleStr = (user.role["name"] ?? "").toString().toLowerCase();
      print("roleStr:- $roleStr");
      if (roleStr == "employee") {
        _isManager = false;
      } else {
        _isManager = true;
      }
      notifyListeners();
    }
  }
}

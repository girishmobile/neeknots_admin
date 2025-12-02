import 'package:flutter/material.dart';
import 'package:neeknots_admin/models/user_model.dart';
import 'package:neeknots_admin/utility/secure_storage.dart';

class LeaveProvider extends ChangeNotifier {
  bool _isLoading = false;
  bool get isLoading => _isLoading;
  void _setLoading(bool val) {
    _isLoading = val;
    notifyListeners();
  }

  String? _employeeId;
  String? get employeeId => _employeeId;

  Future<void> loadUserdataFromstorage() async {
    _isLoading = true;
    notifyListeners();
    UserModel? user = await SecureStorage.getUser();
    if (user != null) {
      _employeeId = user.employeeId;

      _isLoading = false;
      notifyListeners();
    }
  }
}

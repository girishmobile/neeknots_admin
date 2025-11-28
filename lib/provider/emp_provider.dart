import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:neeknots_admin/api/api_config.dart';
import 'package:neeknots_admin/api/network_repository.dart';
import 'package:neeknots_admin/models/attendance_model.dart';

class EmpProvider extends ChangeNotifier {
  bool _isLoading = false;
  bool get isLoading => _isLoading;
  void _setLoading(bool val) {
    _isLoading = val;
    notifyListeners();
  }

  AttendanceModel? _attendanceModel;
  AttendanceModel? get attendanceModel => _attendanceModel;

  Future<void> getCurrentAttendance() async {
    _setLoading(true);
    try {
      final response = await callApi(
        url: ApiConfig.attendanceUrl,
        method: HttpMethod.get,
        headers: null,
      );
      if (globalStatusCode == 200) {
        final decoded = jsonDecode(response);
        _attendanceModel = AttendanceModel.fromApiJson(decoded);
        _setLoading(false);
      } else {
        _setLoading(false);
      }
    } catch (e) {
      _setLoading(false);
    }
  }
}

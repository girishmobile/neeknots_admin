import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:neeknots_admin/api/api_config.dart';
import 'package:neeknots_admin/api/network_repository.dart';
import 'package:neeknots_admin/models/apply_leave_model.dart';
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

  bool _applySuccess = false;
  bool get applySuccess => _applySuccess; // getters

  ApplyLeaveModel? _applyleaveModel;

  ApplyLeaveModel? get applyleaveModel => _applyleaveModel;

  //for data bindig to apply leave page
  List<LeaveTypes> leaveTypes = [];
  LeaveByEmp? leaveByEmp;

  String? errorMessage;

  Future<void> loadUserdataFromstorage() async {
    _setLoading(true);
    UserModel? user = await SecureStorage.getUser();
    if (user != null) {
      _employeeId = "${user.id}";
      _setLoading(false);
    }
  }

  void _setApplyLeaveSuccess(bool val) {
    _isLoading = false;
    _applySuccess = val;
    notifyListeners();
  }

  Future<void> getLeaveTypes({required Map<String, dynamic> body}) async {
    _setLoading(true);
    try {
      final response = await callApi(
        url: ApiConfig.getLeaveDataUrl,
        method: HttpMethod.post,
        body: body,
        headers: null,
      );

      if (globalStatusCode == 200) {
        final decoded = jsonDecode(response);
        // _applyleaveModel = ApplyLeaveModel.fromJson(decoded);
        _applyleaveModel = ApplyLeaveModel.fromApiJson(json.decode(response));
        if (decoded['leaveByEmp'] != null) {
          leaveByEmp = LeaveByEmp.fromJson(decoded['leaveByEmp']);
        }
        if (decoded["leaveTypes"] != null) {
          leaveTypes = (decoded["leaveTypes"] as List<dynamic>)
              .map((e) => LeaveTypes.fromApiJson(e))
              .toList();
        }

        _setLoading(false);
      } else {
        _setLoading(false);
        notifyListeners();
      }
    } catch (e) {
      _setLoading(false);
      print("somethinf - $e");
    }
  }

  Future<void> applyLeave(
    BuildContext context, {
    required Map<String, dynamic> body,
  }) async {
    _setLoading(true);

    try {
      final response = await callApi(
        url: ApiConfig.applyLeave,
        method: HttpMethod.post,
        body: body,
        headers: null,
      );
      if (globalStatusCode == 200) {
        final decoded = jsonDecode(response);
        if (decoded['response'] == "success") {
          _setApplyLeaveSuccess(true);
        } else if (decoded['response'] == "error") {
          errorMessage = decoded['message'] ?? "Leave request failed";
          _setApplyLeaveSuccess(false);
        } else {
          errorMessage = "Leave request failed.";
          _setApplyLeaveSuccess(false);
        }
      } else {
        errorMessage = "Something went wrong. Try again.";
        _setApplyLeaveSuccess(false);
      }
    } catch (e) {
      print("error:- $e");
      errorMessage = "Something went wrong. Try again.";
      _setApplyLeaveSuccess(false);
    }
  }

  List<LeaveDropdownItem> getLeaveTypeDropdownItems() {
    final items = <LeaveDropdownItem>[];

    for (final type in leaveTypes) {
      final code = type.leavetype ?? '';
      String balance = "0.00";

      switch (code.toUpperCase()) {
        case 'CL':
          balance = leaveByEmp?.cl ?? "0.00";
          break;
        case 'PL':
          balance = leaveByEmp?.pl ?? "0.00";
          break;
        case 'SL':
          balance = leaveByEmp?.sl ?? "0.00";
          break;
        case 'UPL':
          balance = leaveByEmp?.usedUpl ?? "0.00";
          break;
      }
      // 👇 Skip if balance == 0 or 0.0
      if (code.toUpperCase() != 'UPL' && (double.tryParse(balance) ?? 0) <= 0) {
        continue;
      }
      final label = code.toUpperCase() == 'UPL'
          ? code
          : "$code - $balance Left";
      items.add(
        LeaveDropdownItem(
          code: code,
          label: label,
          type: type, // keep the full object
        ),
      );
    }

    return items;
  }
}

class LeaveDropdownItem {
  final String code;
  final String label;
  final LeaveTypes type; // full leave type object

  LeaveDropdownItem({
    required this.code,
    required this.label,
    required this.type,
  });
}

/**
 * if (!context.mounted) return;
      if (provider.applySuccess) {
        showSnackBar(
          context,
          message: "Login Sccussful",
          bgColor: Colors.green,
        );
        Navigator.pop(context);
      } else {
        showSnackBar(
          context,
          message: provider.errorMessage ?? "Leave request failed",
          bgColor: Colors.redAccent,
        );
      }
 */

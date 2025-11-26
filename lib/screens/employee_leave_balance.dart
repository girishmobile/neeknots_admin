import 'package:flutter/material.dart';
import 'package:neeknots_admin/common/app_scaffold.dart';
import 'package:neeknots_admin/components/components.dart';

class EmployeeLeaveBalance extends StatelessWidget {
  const EmployeeLeaveBalance({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      child: Stack(
        children: [
          ListView(
            padding: EdgeInsets.only(
              left: 24,
              right: 24,
              top: appTopPadding(context),
              bottom: appBottomPadding(context),
            ),
            children: [Text("comming soon...")],
          ),
          appNavigationBar(
            title: "EMPLOYEES LEAVE BALANCE",
            onTap: () => Navigator.pop(context),
          ),
        ],
      ),
    );
  }
}

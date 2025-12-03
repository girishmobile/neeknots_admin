import 'package:flutter/material.dart';
import 'package:neeknots_admin/common/app_scaffold.dart';
import 'package:neeknots_admin/components/components.dart';

class EditLeavePage extends StatefulWidget {
  final String leaveId;
  const EditLeavePage({super.key, required this.leaveId});

  @override
  State<EditLeavePage> createState() => _EditLeavePageState();
}

class _EditLeavePageState extends State<EditLeavePage> {
  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      child: Stack(
        children: [
          ListView(children: [

        ],
      ),
          appNavigationBar(
            title: "EDIT LEAVE ${widget.leaveId}",
            onTap: () => Navigator.pop(context),
          ),
        ],
      ),
    );
  }
}

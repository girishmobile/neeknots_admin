import 'package:flutter/material.dart';
import 'package:neeknots_admin/common/app_scaffold.dart';
import 'package:neeknots_admin/components/components.dart';
import 'package:neeknots_admin/core/constants/colors.dart';
import 'package:neeknots_admin/core/constants/string_constant.dart';

class EmployeeLeaveBalance extends StatelessWidget {
  const EmployeeLeaveBalance({super.key});

  @override
  Widget build(BuildContext context) {
    final safeTop = MediaQuery.of(context).padding.top;
    final topBarHeight = 48.0; // from Dashboard SafeArea Row
    return AppScaffold(
      child: Stack(
        children: [
          _listOfEmployee(context),
          Positioned(
            top: safeTop + topBarHeight + 8,
            left: 24,
            right: 24,
            child: _searchBar(context),
          ),
          appNavigationBar(
            title: "EMPLOYEES LEAVE BALANCE",
            onTap: () => Navigator.pop(context),
          ),
        ],
      ),
    );
  }

  Widget _searchBar(BuildContext context) {
    return appOrangeTextField(
      hintText: "search by employee name",
      icon: Icons.search,
    );
  }

  Widget _listOfEmployee(BuildContext context) {
    return ListView.separated(
      padding: EdgeInsets.only(
        left: 24,
        right: 24,
        top: listTop(context),
        bottom: appBottomPadding(context),
      ),
      itemBuilder: (context, index) => _leaveBalanceItem(),
      separatorBuilder: (_, _) => SizedBox(height: 8),
      itemCount: 80,
    );
  }

  Widget _leaveBalanceItem() {
    return appViewEffect(
      child: Column(
        spacing: 16,
        children: [
          Row(
            children: [
              appCircleImage(imageUrl: hostImage, radius: 24),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  spacing: 4,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            "Girish Chauhan",
                            style: const TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 14,
                            ),
                          ),
                        ),
                        Text(
                          "Total Leave: 08",
                          style: const TextStyle(
                            fontSize: 12,
                            color: Colors.black54,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                    Text(
                      "Depart: Mobile",
                      style: const TextStyle(
                        fontSize: 12,
                        color: Colors.black54,
                      ),
                    ),
                    Text(
                      "Desig: iOS Developer",
                      style: const TextStyle(
                        fontSize: 12,
                        color: Colors.black54,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Row(
            spacing: 8,
            children: [
              _buildRowItem(type: "CL", value: "4.5"),
              _buildRowItem(type: "SL", value: "3.5"),
              _buildRowItem(type: "PL", value: "0"),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildRowItem({required String type, required String value}) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.all(2),
        decoration: BoxDecoration(
          color: color1,
          border: Border.all(color: color2, width: 1),
          borderRadius: BorderRadius.circular(4),
        ),
        child: Column(
          children: [
            Center(child: loadSubText(title: type, fontSize: 12)),
            Center(child: loadTitleText(title: value, fontSize: 12)),
          ],
        ),
      ),
    );
  }
}

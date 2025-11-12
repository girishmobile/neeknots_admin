import 'package:flutter/material.dart';
import 'package:neeknots_admin/common/app_scaffold.dart';
import 'package:neeknots_admin/components/components.dart';
import 'package:neeknots_admin/core/constants/string_constant.dart';

class CustomerDetailPage extends StatelessWidget {
  const CustomerDetailPage({super.key});

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
            ),
            children: [
              appProfileImage(imaheUrl: hostImage, radius: 60),
              SizedBox(height: 16),
              loadTitleText(title: "John Smith", textAlign: TextAlign.center),
              SizedBox(height: 4),
              loadSubText(
                title: "Joined: 25-oct-2024",
                textAlign: TextAlign.center,
                fontSize: 12,
              ),
              loadSubText(
                title: "Status: Active",
                textAlign: TextAlign.center,
                fontSize: 14,
              ),
            ],
          ),
          appNavigationBar(
            title: "CUSTOMER DETAILS",
            onTap: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}

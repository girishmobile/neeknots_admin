import 'package:flutter/material.dart';
import 'package:neeknots_admin/common/app_scaffold.dart';
import 'package:neeknots_admin/components/components.dart';
import 'package:neeknots_admin/core/constants/colors.dart';

class LeaveSummaryPage extends StatelessWidget {
  final String pageTitle;

  const LeaveSummaryPage({super.key, required this.pageTitle});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      child: Stack(
        children: [
          ListView.separated(
            padding: EdgeInsets.only(
              left: 24,
              right: 24,
              top: appTopPadding(context),
            ),
            itemBuilder: (context, index) => _buildLeaveItem(status: "pending"),
            separatorBuilder: (_, _) => SizedBox(height: 8),
            itemCount: 3,
          ),
          appNavigationBar(
            title: pageTitle,
            onTap: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }

  Widget _buildLeaveItem({required String status}) {
    return appViewEffect(
      child: Column(
        spacing: 4,
        children: [
          rowItem(title: "Leave type:", subTitle: "Casual leave"),
          rowItem(title: "Leave On:", subTitle: "01-Dec-2025"),
          rowItem(title: "Days:", subTitle: "01"),
          rowItem(
            title: "Reason:",
            subTitle: "Going to my native place Bhavnagar",
          ),
          rowItem(title: "Status:", subTitle: "Pending"),
          SizedBox(height: 8),
          Container(
            height: 36,
            decoration: BoxDecoration(
              border: BoxBorder.all(color: color2, width: 1),
            ),
            child: Center(
              child: appGradientText(
                text: "Leave: 02-Dec-2025",
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 14,
                  color: Colors.black54,
                ),
                gradient: appGradient(),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget rowItem({required String title, required String subTitle}) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 12,
      children: [
        loadTitleText(title: title, fontWight: FontWeight.w600, fontSize: 12),
        Expanded(child: loadSubText(title: subTitle, fontSize: 12)),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:neeknots_admin/components/components.dart';
import 'package:neeknots_admin/core/constants/colors.dart';
import 'package:neeknots_admin/core/router/route_name.dart';
import 'package:neeknots_admin/provider/profile_provider.dart';
import 'package:neeknots_admin/utility/utils.dart';
import 'package:provider/provider.dart';

class EmployeeScreen extends StatelessWidget {
  const EmployeeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final profile = context.watch<ProfileProvider>();
    final isManager = profile.isManager;

    return Stack(
      children: [
        ListView(
          padding: EdgeInsets.only(
            left: 24,
            right: 24,
            top: isManager
                ? listTop(context)
                : appTopPadding(context, extra: 8),
            bottom: listBottom(context, extra: 44),
          ),
          children: [
            appGradientText(
              text: "Your Attendance",
              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
              gradient: appGradient(),
            ),

            SizedBox(height: 8),
            appViewEffect(
              padding: const EdgeInsets.all(16),

              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 16,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: _buildItem(title: "Attendance", value: "1 Days"),
                      ),
                      Expanded(
                        child: _buildItem(title: "Late", value: "0 Days"),
                      ),
                      Expanded(
                        child: _buildItem(title: "Absent", value: "0 Days"),
                      ),
                    ],
                  ),

                  Row(
                    children: [
                      Expanded(
                        child: _buildItem(title: "Half Days", value: "0 Days"),
                      ),
                      Expanded(
                        child: _buildItem(
                          title: "Worked hours",
                          value: "0 Days",
                        ),
                      ),
                      const Expanded(
                        child: SizedBox(),
                      ), // empty to maintain alignment
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            appGradientText(
              text: "Leave summary",
              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
              gradient: appGradient(),
            ),
            const SizedBox(height: 16),

            _buildRowItem(
              title: "Pending leave (1)",
              icon: Icons.pending_actions_outlined,
              onTap: () => Navigator.pushNamed(
                context,
                RouteName.leaveSummaryPage,
                arguments: "PENDING LEAVES",
              ),
            ),
            const SizedBox(height: 12),

            _buildRowItem(
              title: "Approval leave (2)",
              icon: Icons.approval_outlined,
              onTap: () => Navigator.pushNamed(
                context,
                RouteName.leaveSummaryPage,
                arguments: "APROVAL LEAVES",
              ),
            ),

            const SizedBox(height: 12),

            _buildRowItem(
              title: "Cancel leave (1)",
              icon: Icons.cancel_presentation_outlined,
              onTap: () => Navigator.pushNamed(
                context,
                RouteName.leaveSummaryPage,
                arguments: "CANCEL LEAVES",
              ),
            ),
            const SizedBox(height: 12),

            _buildRowItem(
              title: "Reject leave (0)",
              icon: Icons.close_outlined,
              onTap: () => Navigator.pushNamed(
                context,
                RouteName.leaveSummaryPage,
                arguments: "REJECT LEAVES",
              ),
            ),
            const SizedBox(height: 12),
            _buildRowItem(
              title: "All leave (4)",
              icon: Icons.calendar_month_outlined,
              onTap: () => Navigator.pushNamed(context, RouteName.allLeavePage),
            ),

            const SizedBox(height: 16),
            appGradientText(
              text: "Leave Balance",
              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
              gradient: appGradient(),
            ),
            const SizedBox(height: 16),

            _buildRowItem(
              title: "Casual Leaves (9)",
              icon: Icons.pending_actions_outlined,
              onTap: () {},
              //Navigator.pushNamed(context, RouteName.leaveSummaryPage),
            ),
            const SizedBox(height: 12),

            _buildRowItem(
              title: "Sick Leaves (2)",
              icon: Icons.sick_outlined,
              onTap: () {},
              //Navigator.pushNamed(context, RouteName.leaveSummaryPage),
            ),
            const SizedBox(height: 12),

            _buildRowItem(
              title: "Paid Leaves (0)",
              icon: Icons.paid_outlined,
              onTap: () {},
              // Navigator.pushNamed(context, RouteName.leaveSummaryPage),
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                appGradientText(
                  text: "Upcoming Birthday",
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
                  gradient: appGradient(),
                ),
                TextButton(
                  onPressed: () =>
                      Navigator.pushNamed(context, RouteName.birthdayList),
                  child: loadSubText(title: "See All"),
                ),
              ],
            ),
            SizedBox(height: 4),
            SizedBox(
              height: 100,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) => _birthDayCard(),
                separatorBuilder: (_, _) => SizedBox(width: 12),
                itemCount: 4,
              ),
            ),
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                appGradientText(
                  text: "Upcoming Holidays",
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
                  gradient: appGradient(),
                ),
                TextButton(
                  onPressed: () =>
                      Navigator.pushNamed(context, RouteName.holidayPage),
                  child: loadSubText(title: "See All"),
                ),
              ],
            ),
            SizedBox(height: 4),
            SizedBox(
              height: 110,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) => holidayCard(),
                separatorBuilder: (_, _) => SizedBox(width: 12),
                itemCount: 4,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _birthDayCard() {
    return SizedBox(
      width: 300,
      child: appViewEffect(
        padding: const EdgeInsets.only(left: 16, right: 8, bottom: 8, top: 8),
        child: Row(
          spacing: 8,
          children: [
            appCircleImage(
              iconColor: btnColor2,
              borderColor: btnColor2,

              radius: 32,
              iconSize: 36,
              imageUrl: "",
              icon: Icons.cake_outlined,
            ),
            Column(
              spacing: 2,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                loadTitleText(title: "Girish Chauhan", fontSize: 14),
                loadSubText(title: "iOS Developer"),
                loadSubText(title: "01-Feb-1990", fontSize: 12),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRowItem({
    required String title,
    required IconData icon,
    VoidCallback? onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: appViewEffect(
        padding: const EdgeInsets.all(16),
        child: Row(
          spacing: 4,

          children: [
            Icon(icon, color: Colors.black54),
            loadSubText(title: title, fontColor: Colors.black54),
            Spacer(),
            appForwardIcon(),
          ],
        ),
      ),
    );
  }

  Widget _buildItem({required String title, required String value}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 12,
            color: Colors.black87,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          value,
          style: const TextStyle(
            fontSize: 12,
            color: Colors.black54,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}

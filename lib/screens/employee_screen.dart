import 'package:flutter/material.dart';
import 'package:neeknots_admin/components/components.dart';

class EmployeeScreen extends StatelessWidget {
  const EmployeeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ListView(
          padding: EdgeInsets.only(
            left: 24,
            right: 24,
            top: listTop(context),
            bottom: listBottom(context),
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
              onTap: () {},
            ),
            const SizedBox(height: 12),

            _buildRowItem(
              title: "Approval leave (2)",
              icon: Icons.approval_outlined,
              onTap: () {},
            ),

            const SizedBox(height: 12),

            _buildRowItem(
              title: "Cancel leave (1)",
              icon: Icons.cancel_presentation_outlined,
              onTap: () {},
            ),
            const SizedBox(height: 12),

            _buildRowItem(
              title: "Reject leave (0)",
              icon: Icons.close_outlined,
              onTap: () {},
            ),
            const SizedBox(height: 12),
            _buildRowItem(
              title: "All leave (4)",
              icon: Icons.calendar_month_outlined,
              onTap: () {},
            ),

            const SizedBox(height: 16),
            appGradientText(
              text: "Upcoming Birthday",
              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
              gradient: appGradient(),
            ),
            const SizedBox(height: 16),
            appViewEffect(
              child: SizedBox(
                height: 230,
                child: loadSubText(title: "Upcoming Birthday"),
              ),
            ),
            SizedBox(height: 16),
            appGradientText(
              text: "Upcoming Holidays",
              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
              gradient: appGradient(),
            ),
            SizedBox(height: 16),
            appViewEffect(
              child: SizedBox(
                height: 230,
                child: loadTitleText(title: "Upcoming Holidays"),
              ),
            ),
          ],
        ),
      ],
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

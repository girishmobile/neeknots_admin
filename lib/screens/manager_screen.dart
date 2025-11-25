import 'package:flutter/material.dart';
import 'package:neeknots_admin/components/components.dart';

class ManagerScreen extends StatelessWidget {
  const ManagerScreen({super.key});

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
              text: "HR Department",
              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
              gradient: appGradient(),
            ),
            const SizedBox(height: 8),
            _buildRowItem(icon: Icons.people_outline, title: "Total Employees"),
            const SizedBox(height: 12),
            _buildRowItem(
              title: "Today's leave (1)",
              icon: Icons.pending_actions_outlined,
              onTap: () {},
            ),
            const SizedBox(height: 12),
            _buildRowItem(
              icon: Icons.workspaces_outlined,
              title: "Work from home Employee",
            ),
            const SizedBox(height: 12),
            _buildRowItem(
              icon: Icons.people_outline,
              title: "Online Employees",
            ),
            const SizedBox(height: 16),
            appGradientText(
              text: "Pending Approvals",
              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
              gradient: appGradient(),
            ),
            const SizedBox(height: 8),
            SizedBox(
              height: 340,
              child: appViewEffect(
                child: Center(child: Text("comming soon...")),
              ),
            ),
            const SizedBox(height: 16),
            appGradientText(
              text: "Upcoming Holidays",
              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
              gradient: appGradient(),
            ),
            const SizedBox(height: 8),
            SizedBox(
              height: 340,
              child: appViewEffect(
                child: Center(child: Text("comming soon...")),
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
            Expanded(
              child: loadSubText(title: title, fontColor: Colors.black54),
            ),

            appForwardIcon(),
          ],
        ),
      ),
    );
  }

  Widget _kpiGridView(BuildContext context) {
    return GridView.builder(
      padding: EdgeInsets.only(
        left: 24,
        right: 24,
        top: listTop(context),
        bottom: listBottom(context),
      ),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 8,
        crossAxisSpacing: 8,
        childAspectRatio: 1.2,
      ),
      itemBuilder: (context, index) {
        return GestureDetector(onTap: () {}, child: _buildGridItem());
      },
      itemCount: 4,
    );
  }

  Widget _buildGridItem() {
    return appViewEffect(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        spacing: 8,
        children: [
          // Flexible details section
          appCircleIcon(
            icon: Icons.line_axis_outlined,
            gradient: appGradient(),
            iconSize: 36,
          ),
          Text(
            "January",
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 14,
              color: Colors.black87,
            ),
          ),

          Text(
            "50%",
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 18,
              color: Colors.black54,
            ),
          ),
        ],
      ),
    );
  }
}

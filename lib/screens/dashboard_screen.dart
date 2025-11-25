import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:neeknots_admin/common/app_scaffold.dart';
import 'package:neeknots_admin/components/components.dart';
import 'package:neeknots_admin/core/constants/colors.dart';
import 'package:neeknots_admin/core/constants/string_constant.dart';
import 'package:neeknots_admin/core/router/route_name.dart';
import 'package:neeknots_admin/pages/setting_page.dart';
import 'package:neeknots_admin/provider/app_provider.dart';
import 'package:neeknots_admin/provider/dashboard_provider.dart';
import 'package:neeknots_admin/screens/calendar_screen.dart';
import 'package:neeknots_admin/screens/home_screen.dart';
import 'package:neeknots_admin/screens/leave_screen.dart';
import 'package:neeknots_admin/screens/my_kpi_screen.dart';
import 'package:provider/provider.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<AppProvider>();

    final hrmsScreens = [
      CalendarScreen(),
      LeaveScreen(),
      HomeScreen(),
      MyKpiScreen(),
      SettingPage(),
    ];
    final titles = [
      "CALENDAR",
      "LEAVES",
      "", // Home has logo
      "ATTENDANCE",
      "SETTINGS",
    ];
    return AppScaffold(
      isTopSafeArea: true,
      child: Stack(
        children: [
          hrmsScreens[provider.pageIndex],
          topBar(
            context,
            provider: provider,
            title: titles[provider.pageIndex],
          ),
          bottomBar(context),
          if (provider.pageIndex == 2 && !provider.isManager)
            _leaveRequest(context),
        ],
      ),
    );
  }

  Widget topBar(
    BuildContext context, {
    required AppProvider provider,
    required String title,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          appCircleImage(
            imageUrl: hostImage,
            radius: 18,
            onTap: () {
              Navigator.pushNamed(context, RouteName.profilePage);
            },
          ),

          // ✅ Show logo only for Home, otherwise show title
          provider.pageIndex == 2
              ? appGradientText(
                  text: "KAUSHALAM",
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
                  gradient: appGradient(),
                ) //loadAssetImage(name: headerlogo, height: 26)
              : appGradientText(
                  text: title,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                  gradient: appGradient(),
                ), //loadAssetImage(name: headerlogo, height: 26)

          appCircleIcon(
            icon: Icons.notifications_outlined,

            gradient: appGradient(),
            iconSize: 24,
            onTap: () {
              Navigator.pushNamed(context, RouteName.notificationPage);
            },
          ),
        ],
      ),
    );
  }

  Widget bottomBar(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: SafeArea(
        bottom: true,
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 24),
          child: _buildGlassEffect(
            borderRadius: 45,
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildBottomIcon(
                  context,
                  index: 0,
                  icon: Icons.calendar_month_outlined,
                  title: "Calendar",
                  size: 24,
                ),
                _buildBottomIcon(
                  context,
                  index: 1,
                  icon: Icons.rocket_launch_outlined,
                  title: "Leaves",
                  size: 28,
                ),
                _buildBottomIcon(
                  context,
                  index: 2,
                  icon: Icons.home_outlined,
                  title: "Home",
                  size: 28,
                ),
                _buildBottomIcon(
                  context,
                  index: 3,
                  icon: Icons.grade_outlined,
                  title: "Attendance",
                  size: 28,
                ),
                _buildBottomIcon(
                  context,
                  index: 4,
                  icon: Icons.settings_outlined,
                  title: "Setting",
                  size: 28,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildGlassEffect({
    required Widget child,
    double borderRadius = 12,
    EdgeInsetsGeometry? padding,
    double blurSigma = 10,
    Color overlayColor = Colors.white,
    double opacity = 0.15,
    Color borderColor = Colors.white,
    double borderWidth = 1.0,
  }) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(borderRadius),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: blurSigma, sigmaY: blurSigma),
        child: Container(
          padding: padding ?? const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: overlayColor.withOpacity(opacity),
            borderRadius: BorderRadius.circular(borderRadius),
            border: Border.all(
              color: borderColor.withOpacity(0.4),
              width: borderWidth,
            ),
          ),
          child: child,
        ),
      ),
    );
  }

  Widget _buildBottomIcon(
    BuildContext context, {
    required int index,
    required IconData icon,
    required String title,
    double? size,
  }) {
    final provider = context.watch<DashboardProvider>();
    final isSelected = provider.pageIndex == index;

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        appCircleIcon(
          icon: icon,
          iconSize: size, // ✅ selected = gradient, unselected = grey
          gradient: isSelected ? appGradient() : appOrangeOffGradient(),

          onTap: () => context.read<AppProvider>().setPageIndex(index),
        ),
        loadSubText(
          title: title,
          fontSize: 10,
          fontWight: isSelected ? FontWeight.w600 : FontWeight.w400,
          fontColor: isSelected ? btnColor2 : Colors.black54,
        ),
      ],
    );
  }

  Widget _leaveRequest(BuildContext context) {
    final safeBottom = MediaQuery.of(context).padding.bottom;
    const bottomBarHeight = 60.0; // your Dashboard bottom bar height

    return Positioned.fill(
      // bottom: safeBottom + bottomBarHeight + 8,
      //left: 48,
      //right: 48,
      child: Align(
        alignment: Alignment.bottomCenter,
        child: Padding(
          padding: EdgeInsets.only(bottom: safeBottom + bottomBarHeight + 4),
          child: Container(
            //margin: const EdgeInsets.symmetric(horizontal: 24),
            height: 48,
            decoration: BoxDecoration(
              gradient: appGradient(colors: [btnColor1, btnColor2]),
              borderRadius: BorderRadius.circular(30),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: TextButton.icon(
              onPressed: () {},

              label: const Text(
                "Apply Leave",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

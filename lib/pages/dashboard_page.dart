import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:neeknots_admin/core/constants/colors.dart';
import 'package:neeknots_admin/core/router/route_name.dart';
import 'package:neeknots_admin/screens/home_screen.dart';
import 'package:neeknots_admin/screens/leave_screen.dart';
import 'package:neeknots_admin/screens/my_kpi_screen.dart';
import 'package:provider/provider.dart';
import 'package:neeknots_admin/common/app_scaffold.dart';
import 'package:neeknots_admin/components/components.dart';
import 'package:neeknots_admin/core/constants/string_constant.dart';
import 'package:neeknots_admin/pages/customer_page.dart';
import 'package:neeknots_admin/pages/home_page.dart';
import 'package:neeknots_admin/pages/order_page.dart';
import 'package:neeknots_admin/pages/product_page.dart';
import 'package:neeknots_admin/pages/setting_page.dart';
import 'package:neeknots_admin/provider/dashboard_provider.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<DashboardProvider>();

    final screens = [
      ProductPage(),
      //OrderPage(),
      // HomePage(),
      LeaveScreen(),
      HomeScreen(),
      MyKpiScreen(),
      //CustomerPage(),
      SettingPage(),
    ];
    final titles = [
      "CALENDAR",
      "LEAVES",
      "", // Home has logo
      "KRA KPI",
      "SETTINGS",
    ];

    return AppScaffold(
      isTopSafeArea: true,
      child: Stack(
        children: [
          screens[provider.pageIndex],
          // IndexedStack(index: provider.pageIndex, children: screens),
          //Top bar
          topBar(
            context,
            provider: provider,
            title: titles[provider.pageIndex],
          ),
          //Bottom bar
          bottomBar(context),
        ],
      ),
    );
  }

  Widget topBar(
    BuildContext context, {
    required DashboardProvider provider,
    required String title,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
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
              ? loadAssetImage(name: headerlogo, height: 28)
              : Text(
                  title,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
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

  Widget bottomBar(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: SafeArea(
        bottom: true,
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 24),
          child: _buildGlassEffect(
            borderRadius: 55,
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildBottomIcon(
                  context,
                  index: 0,
                  icon: Icons.calendar_month_outlined,
                  title: "Calendar",
                  size: 20,
                ),
                _buildBottomIcon(
                  context,
                  index: 1,
                  icon: Icons.rocket_launch_outlined,
                  title: "Leave",
                  size: 24,
                ),
                _buildBottomIcon(
                  context,
                  index: 2,
                  icon: Icons.home_outlined,
                  title: "Home",
                  size: 24,
                ),
                _buildBottomIcon(
                  context,
                  index: 3,
                  icon: Icons.leaderboard_outlined,
                  title: "KRA KPI",
                  size: 24,
                ),
                _buildBottomIcon(
                  context,
                  index: 4,
                  icon: Icons.settings_outlined,
                  title: "Setting",
                  size: 24,
                ),
              ],
            ),
          ),
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
          gradient: isSelected
              ? appGradient()
              : LinearGradient(colors: [Colors.grey, Colors.black54]),
          onTap: () => context.read<DashboardProvider>().setPageIndex(index),
        ),
        Text(
          title,
          style: TextStyle(
            fontSize: 10,
            fontWeight: FontWeight.w600,
            color: isSelected
                ? btnColor2.withValues(alpha: 0.7)
                : Colors.black54,
          ),
        ),
      ],
    );
  }
}

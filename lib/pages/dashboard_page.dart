import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:neeknots_admin/core/router/route_name.dart';
import 'package:neeknots_admin/pages/customer/customer_page.dart';
import 'package:neeknots_admin/pages/order/order_page.dart';

import 'package:provider/provider.dart';
import 'package:neeknots_admin/common/app_scaffold.dart';
import 'package:neeknots_admin/components/components.dart';
import 'package:neeknots_admin/core/constants/string_constant.dart';
import 'package:neeknots_admin/pages/home_page.dart';
import 'package:neeknots_admin/pages/product/product_page.dart';
import 'package:neeknots_admin/pages/setting_page.dart';
import 'package:neeknots_admin/provider/dashboard_provider.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<DashboardProvider>();

    final screens = [
      ProductPage(),
      OrderPage(),
      HomePage(),
      //LeaveScreen(),
      //HomeScreen(),
      //MyKpiScreen(),
      CustomerPage(),
      SettingPage(),
    ];
    final titles = [
      "LIST OF PRODUCT",
      "LIST OF ORDER",
      "", // Home has logo
      "CUSTOMERS",
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
              ? loadAssetImage(name: headerlogo, height: 26)
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
            borderRadius: 45,
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildBottomIcon(
                  context,
                  index: 0,
                  icon: Icons.inventory_2_outlined,
                  title: "Product",
                  size: 24,
                ),
                _buildBottomIcon(
                  context,
                  index: 1,
                  icon: Icons.shopping_bag_outlined,
                  title: "Order",
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
                  icon: Icons.people_alt_outlined,
                  title: "Customer",
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
            color: isSelected ? Colors.deepPurple : Colors.black54,
          ),
        ),
      ],
    );
  }
}

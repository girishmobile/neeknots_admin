import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:neeknots_admin/common/app_scaffold.dart';
import 'package:neeknots_admin/components/components.dart';
import 'package:neeknots_admin/constants/string_constant.dart';
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
      OrderPage(),
      HomePage(),
      CustomerPage(),
      SettingPage(),
    ];
    final titles = [
      "LIST OF PRODUCTS",
      "LIST OF ORDERS",
      "", // Home has logo
      "LIST OF CUSTOMERS",
      "SETTINGS",
    ];

    return AppScaffold(
      isTopSafeArea: true,
      child: Stack(
        children: [
          screens[provider.pageIndex],
          // IndexedStack(index: provider.pageIndex, children: screens),
          //Top bar
          topBar(provider, titles[provider.pageIndex]),
          //Bottom bar
          bottomBar(context),
        ],
      ),
    );
  }

  Widget topBar(DashboardProvider provider, String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          appCircleImage(
            imageUrl: "https://picsum.photos/200",
            radius: 18,
            onTap: () {},
          ),

          // ✅ Show logo only for Home, otherwise show title
          provider.pageIndex == 2
              ? loadAssetImage(name: applogo, height: 36)
              : Text(
                  title,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
          appCircleIcon(
            icon: Icons.notifications_outlined,
            iconColor: Colors.black54,
            iconSize: 20,
            onTap: () {},
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
            borderRadius: 30,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildBottomIcon(
                  context,
                  index: 0,
                  icon: Icons.inventory_2_outlined,
                  size: 24,
                ),
                _buildBottomIcon(
                  context,
                  index: 1,
                  icon: Icons.shopping_bag_outlined,
                  size: 28,
                ),
                _buildBottomIcon(
                  context,
                  index: 2,
                  icon: Icons.home_outlined,
                  size: 28,
                ),
                _buildBottomIcon(
                  context,
                  index: 3,
                  icon: Icons.group_outlined,
                  size: 28,
                ),
                _buildBottomIcon(
                  context,
                  index: 4,
                  icon: Icons.settings_outlined,
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
    double? size,
  }) {
    final provider = context.watch<DashboardProvider>();
    final isSelected = provider.pageIndex == index;
    return appCircleIcon(
      icon: icon,
      iconSize: size, // ✅ selected = gradient, unselected = grey
      gradient: isSelected
          ? appGradient()
          : LinearGradient(colors: [Colors.grey, Colors.black54]),
      onTap: () => context.read<DashboardProvider>().setPageIndex(index),
    );
  }
}

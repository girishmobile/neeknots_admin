import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:neeknots_admin/components/components.dart';
import 'package:neeknots_admin/core/constants/colors.dart';
import 'package:neeknots_admin/provider/app_provider.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ListView(
          padding: EdgeInsets.only(
            left: 24,
            right: 24,
            top: listTop(context, extra: 8),
            bottom: listBottom(context),
          ),
          children: [
            appGlassEffect(
              child: SizedBox(
                height: 230,
                child: loadTitleText(title: "Record Your Attendance"),
              ),
            ),
            SizedBox(height: 16),
            appGlassEffect(
              child: SizedBox(
                height: 230,
                child: loadTitleText(title: "Hubstaff Logs"),
              ),
            ),
            SizedBox(height: 16),
            appGlassEffect(
              child: SizedBox(
                height: 230,
                child: loadTitleText(title: "Upcoming Birthday"),
              ),
            ),
            SizedBox(height: 16),
            appGlassEffect(
              child: SizedBox(
                height: 230,
                child: loadTitleText(title: "Upcoming Holidays"),
              ),
            ),
            SizedBox(height: 16),
            appGlassEffect(
              child: SizedBox(
                height: 230,
                child: loadTitleText(title: "Dashboard"),
              ),
            ),
            SizedBox(height: 16),
            appGlassEffect(
              child: SizedBox(
                height: 230,
                child: loadTitleText(title: "Dashboard"),
              ),
            ),
            SizedBox(height: 16),
            appGlassEffect(
              child: SizedBox(
                height: 230,
                child: loadTitleText(title: "Dashboard"),
              ),
            ),
            SizedBox(height: 16),
            appGlassEffect(
              child: SizedBox(
                height: 230,
                child: loadTitleText(title: "Dashboard"),
              ),
            ),
          ],
        ),
        topBar(context),
      ],
    );
  }

  Widget topBar(BuildContext context) {
    final safeTop = MediaQuery.of(context).padding.top;
    const topBarHeight = 56.0; // your Dashboard SafeArea Row
    final listTop = safeTop + topBarHeight + 8; // search bar height + spacing

    return Container(
      padding: EdgeInsets.only(top: listTop),
      margin: const EdgeInsets.symmetric(horizontal: 24),
      child: _buildGlassEffect(
        borderRadius: 30,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          spacing: 32,
          children: [
            _buildBottomIcon(
              context,
              index: 1,
              icon: Icons.person_outline,
              title: "SELF",
            ),
            _buildBottomIcon(
              context,
              index: 2,
              icon: Icons.people_outline,
              title: "MANAGER",
            ),
          ],
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
          padding:
              padding ??
              const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
          decoration: BoxDecoration(
            color: overlayColor.withValues(alpha: opacity),
            borderRadius: BorderRadius.circular(borderRadius),
            border: Border.all(
              color: borderColor.withValues(alpha: 0.4),
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
    final provider = context.watch<AppProvider>();
    final isSelected = provider.appIndex == index;
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () => context.read<AppProvider>().setAppIndex(index),
        child: Row(
          spacing: 4,
          children: [
            appCircleIcon(
              icon: icon,
              iconSize: size, // ✅ selected = gradient, unselected = grey
              gradient: isSelected
                  ? appGradient()
                  : LinearGradient(colors: [Colors.grey, Colors.black54]),
              // onTap: () => context.read<AppProvider>().setAppIndex(index),
            ),
            Text(
              title,
              style: TextStyle(
                fontSize: isSelected ? 14 : 14,
                fontWeight: isSelected ? FontWeight.w500 : FontWeight.w500,
                color: isSelected
                    ? btnColor2.withValues(alpha: 0.7)
                    : Colors.black54,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

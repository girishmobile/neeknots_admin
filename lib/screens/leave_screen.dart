import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:neeknots_admin/components/components.dart';
import 'package:neeknots_admin/core/constants/colors.dart';

class LeaveScreen extends StatelessWidget {
  const LeaveScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        _listOfLeaves(context),
        _searchBar(context),
        _buildFilter(context),
        _leaveRequest(context),
      ],
    );
  }

  Widget _listOfLeaves(BuildContext context) {
    return ListView(
      padding: EdgeInsets.only(
        left: 24,
        right: 24,
        top: listTop(context, extra: 54),
        bottom: listBottom(context, extra: 48),
      ),
      children: [
        SizedBox(
          height: 90,
          child: appGlassEffect(child: Text("Leave requested...")),
        ),
        SizedBox(height: 8),
        SizedBox(
          height: 90,
          child: appGlassEffect(child: Text("Leave requested...")),
        ),
        SizedBox(height: 8),
        SizedBox(
          height: 90,
          child: appGlassEffect(child: Text("Leave requested...")),
        ),
        SizedBox(height: 8),
        SizedBox(
          height: 90,
          child: appGlassEffect(child: Text("Leave requested...")),
        ),
        SizedBox(height: 8),
        SizedBox(
          height: 90,
          child: appGlassEffect(child: Text("Leave requested...")),
        ),
        SizedBox(height: 8),
        SizedBox(
          height: 90,
          child: appGlassEffect(child: Text("Leave requested...")),
        ),
        SizedBox(height: 8),
        SizedBox(
          height: 90,
          child: appGlassEffect(child: Text("Leave requested...")),
        ),
        //SizedBox(height: 48),
      ],
    );
  }

  Widget _leaveRequest(BuildContext context) {
    final safeBottom = MediaQuery.of(context).padding.bottom;
    const bottomBarHeight = 70.0; // your Dashboard bottom bar height

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
            child: TextButton.icon(
              onPressed: () {},
              icon: const Icon(
                Icons.rocket_launch_outlined,
                color: Colors.white,
              ),
              label: const Text(
                "Leave Request",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _searchBar(BuildContext context) {
    final safeTop = MediaQuery.of(context).padding.top;
    final topBarHeight = 48.0; // from Dashboard SafeArea Row
    return Positioned(
      top: safeTop + topBarHeight + 8,
      left: 24,
      right: 24,
      child: appTextField(hintText: "search", icon: Icons.search),
    );
  }

  Widget _buildFilter(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: listTop(context)),
      margin: const EdgeInsets.symmetric(horizontal: 24),
      child: Row(
        spacing: 16,
        children: [
          Expanded(
            child: _buildGlassEffect(
              child: Text(
                "Duration All",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 14,
                  color: Colors.black87,
                ),
              ),
            ),
          ),
          Expanded(
            child: _buildGlassEffect(
              child: Text(
                "Status All",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 14,
                  color: Colors.black54,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildGlassEffect({
    required Widget child,
    double borderRadius = 8,
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
              const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
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
}

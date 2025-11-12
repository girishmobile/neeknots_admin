import 'package:flutter/material.dart';
import 'package:neeknots_admin/core/constants/colors.dart';

class AppScaffold extends StatelessWidget {
  final Widget child;
  final bool isTopSafeArea;
  final bool isBottomSafeArea;

  const AppScaffold({
    super.key,
    required this.child,
    this.isTopSafeArea = false,
    this.isBottomSafeArea = false,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [color1, color2, color3],
              ),
            ),
          ),
          // Container(
          //   color: Colors.white.withValues(alpha: 0.05), // light overlay
          // ),
          SafeArea(top: isTopSafeArea, bottom: isBottomSafeArea, child: child),
        ],
      ),
    );
  }
}

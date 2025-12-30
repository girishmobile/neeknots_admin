import 'package:flutter/material.dart';
import 'package:neeknots_admin/components/components.dart';

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
          Container(decoration: BoxDecoration(gradient: appOrangeGradient())),
          SafeArea(top: isTopSafeArea, bottom: isBottomSafeArea, child: child),
        ],
      ),
    );
  }
}

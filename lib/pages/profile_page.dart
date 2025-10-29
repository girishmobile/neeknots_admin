import 'package:flutter/material.dart';
import 'package:neeknots_admin/common/app_scaffold.dart';
import 'package:neeknots_admin/components/components.dart';
import 'package:neeknots_admin/core/constants/string_constant.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final safeTop = MediaQuery.of(context).padding.top;
    const topBarHeight = 48.0; // your Dashboard SafeArea Row
    final listTop = safeTop + topBarHeight + 8; // search bar height + spacing
    return AppScaffold(
      child: Stack(
        children: [
          ListView(
            padding: EdgeInsets.only(left: 24, right: 24, top: listTop),
            children: [
              _buildProfileImage(),
              SizedBox(height: 16),
              loadTitleText(
                title: "Girish Chauhan",
                textAlign: TextAlign.center,
              ),
              loadSubText(title: "iOS Developer", textAlign: TextAlign.center),
            ],
          ),
          appNavigationBar(
            title: "PROFILE",
            onTap: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }

  Widget _buildProfileImage() {
    return Container(
      padding: const EdgeInsets.all(3), // thickness of border
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        gradient: appGradient(),
      ),
      child: Container(
        height: 120,
        width: 120,
        decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.white),
        child: appCircleImage(imageUrl: hostImage, radius: 58, onTap: () {}),
      ),
    );
  }
}

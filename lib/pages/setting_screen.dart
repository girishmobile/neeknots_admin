import 'package:flutter/material.dart';
import 'package:neeknots_admin/common/app_scaffold.dart';
import 'package:neeknots_admin/components/components.dart';
import 'package:neeknots_admin/core/constants/string_constant.dart';
import 'package:neeknots_admin/core/router/route_name.dart';
import 'package:neeknots_admin/utility/utils.dart';
import 'package:provider/provider.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      child: Consumer(
        builder: (context, provider, child) {
          return Stack(
            children: [
              ListView(
                padding: EdgeInsets.only(
                  left: 24,
                  right: 24,
                  top: appTopPadding(context),
                ),
                children: [
                  appProfileImage(imageUrl: hostImage, radius: 60),
                  SizedBox(height: 16),
                  loadTitleText(
                    title: "Girish Chauhan",
                    textAlign: TextAlign.center,
                  ),
                  loadSubText(
                    title: "iOS Developer",
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 32),
                  _buildRowItem(
                    title: "Edit Profile",
                    icon: Icons.edit_outlined,
                  ),
                  const SizedBox(height: 12),

                  _buildRowItem(
                    title: "Change Password",
                    icon: Icons.lock_outline,
                  ),
                  const SizedBox(height: 12),

                  _buildRowItem(
                    title: "My Hours",
                    icon: Icons.watch_later_outlined,
                  ),
                  const SizedBox(height: 12),
                  _buildRowItem(
                    title: "Employees",
                    icon: Icons.people_outline_outlined,
                  ),
                  const SizedBox(height: 24),
                  gradientButton(
                    title: "LOGOUT",
                    onPressed: () async {
                      Navigator.pushNamedAndRemoveUntil(
                        context,
                        RouteName.loginPage,
                        (Route<dynamic> route) => false,
                      );
                    },
                  ),
                ],
              ),
            ],
          );
        },
      ),
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
            loadSubText(title: title, fontColor: Colors.black54),
            Spacer(),
            appForwardIcon(),
          ],
        ),
      ),
    );
  }
}

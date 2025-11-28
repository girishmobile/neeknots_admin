import 'package:flutter/material.dart';
import 'package:neeknots_admin/common/app_scaffold.dart';
import 'package:neeknots_admin/components/components.dart';
import 'package:neeknots_admin/core/constants/string_constant.dart';
import 'package:neeknots_admin/core/router/route_name.dart';
import 'package:neeknots_admin/provider/app_provider.dart';
import 'package:neeknots_admin/provider/profile_provider.dart';
import 'package:neeknots_admin/utility/secure_storage.dart';
import 'package:neeknots_admin/utility/utils.dart';
import 'package:provider/provider.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      child: Consumer<ProfileProvider>(
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
                  appProfileImage(imaheUrl: hostImage, radius: 60),
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
                    onTap: () =>
                        Navigator.pushNamed(context, RouteName.editProfilePage),
                  ),
                  const SizedBox(height: 12),

                  _buildRowItem(
                    title: "Change Password",
                    icon: Icons.lock_outline,
                    onTap: () => Navigator.pushNamed(
                      context,
                      RouteName.changePasswordPage,
                    ),
                  ),
                  const SizedBox(height: 12),

                  _buildRowItem(
                    title: "My Hours",
                    icon: Icons.watch_later_outlined,
                    onTap: () =>
                        Navigator.pushNamed(context, RouteName.myHoursPage),
                  ),
                  const SizedBox(height: 12),

                  _buildRowItem(
                    title: "Employees",
                    icon: Icons.people_outline_outlined,
                    onTap: () =>
                        Navigator.pushNamed(context, RouteName.allEmplyeePage),
                  ),
                  const SizedBox(height: 24),
                  gradientButton(
                    title: "LOGOUT",
                    onPressed: () async {
                      provider.setLoading(true);
                      await SecureStorage.deleteAll().then((val) {
                        provider.setLoading(false);
                      });

                      if (!context.mounted) return;
                      // 🔥 Set page index BEFORE navigation
                      context.read<AppProvider>().setPageIndex(2);
                      Navigator.pushNamedAndRemoveUntil(
                        context,
                        RouteName.loginPage,
                        (Route<dynamic> route) => false,
                      );
                    },
                  ),
                ],
              ),
              provider.isLoading ? showProgressIndicator() : SizedBox.shrink(),
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

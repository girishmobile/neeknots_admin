import 'package:flutter/material.dart';
import 'package:neeknots_admin/common/app_scaffold.dart';
import 'package:neeknots_admin/components/components.dart';
import 'package:neeknots_admin/core/constants/string_constant.dart';
import 'package:neeknots_admin/utility/utils.dart';
import 'package:provider/provider.dart';

class ForgotPasswordPage extends StatelessWidget {
  const ForgotPasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    final formLoginKey = GlobalKey<FormState>();
    return AppScaffold(
      child: Consumer(
        builder: (context, provider, child) {
          return Stack(
            children: [
              Center(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.symmetric(horizontal: 32),
                  child: Column(
                    children: [
                      loadAssetImage(name: applogo, height: 128),
                      const SizedBox(height: 32),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: appGradientText(
                          text: "Enter your email to reset password",
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                          gradient: appGradient(),
                        ),
                      ),
                      const SizedBox(height: 16),
                      Form(
                        key: formLoginKey,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            appTextField(
                              hintText: "Employee email",
                              icon: Icons.email_outlined,
                            ),
                            const SizedBox(height: 32),
                            gradientButton(
                              title: "SEND RESET LINK",
                              onPressed: () async {
                                hideKeyboard(context);
                              },
                            ),
                            const SizedBox(height: 8),
                            loadSubText(title: "Please confirm email address"),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              appNavigationBar(
                title: "FORGOT PASSWORD",
                onTap: () {
                  Navigator.pop(context);
                },
              ),
            ],
          );
        },
      ),
    );
  }
}

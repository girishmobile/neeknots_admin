import 'package:flutter/material.dart';
import 'package:neeknots_admin/common/app_scaffold.dart';
import 'package:neeknots_admin/components/components.dart';
import 'package:neeknots_admin/core/constants/string_constant.dart';
import 'package:neeknots_admin/core/router/route_name.dart';
import 'package:neeknots_admin/utility/utils.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final formLoginKey = GlobalKey<FormState>();

    return AppScaffold(
      child: Consumer(
        builder: (context, provider, child) {
          return Stack(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Center(
                      child: SingleChildScrollView(
                        padding: const EdgeInsets.symmetric(horizontal: 32),
                        child: Column(
                          children: [
                            loadAssetImage(name: headerlogo, height: 40),
                            const SizedBox(height: 32),
                            Align(
                              alignment: Alignment.center,
                              child: appGradientText(
                                text: "WELCOME BACK!",
                                style: TextStyle(
                                  fontSize: 18,
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
                                  // Logo
                                  appTextField(
                                    hintText: "Employee email",
                                    icon: Icons.email_outlined,
                                  ),
                                  const SizedBox(height: 16),
                                  appTextField(
                                    hintText: "Password",
                                    icon: Icons.lock_outline,
                                  ),
                                  const SizedBox(height: 16),
                                  Align(
                                    alignment: Alignment.centerRight,
                                    child: GestureDetector(
                                      onTap: () => {
                                        Navigator.pushNamed(
                                          context,
                                          RouteName.forgotPasswordPage,
                                        ),
                                      },
                                      child: Text(
                                        "Forgot Password?",
                                        style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          color: Colors.black54,
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 32),
                                  // Login Button
                                  gradientButton(
                                    title: "LOGIN",
                                    onPressed: () async {
                                      hideKeyboard(context);
                                      Navigator.pushNamedAndRemoveUntil(
                                        context,
                                        RouteName.dashBoardPage,
                                        (route) => false,
                                      );
                                    },
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "© ${DateTime.now().year} NeekNots",
                          style: const TextStyle(
                            color: Colors.black54,
                            fontWeight: FontWeight.w400,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          );
        },
      ),
    );
  }
}

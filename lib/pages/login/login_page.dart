import 'package:flutter/material.dart';
import 'package:neeknots_admin/common/app_scaffold.dart';
import 'package:neeknots_admin/components/components.dart';
import 'package:neeknots_admin/core/constants/colors.dart';
import 'package:neeknots_admin/core/constants/string_constant.dart';
import 'package:neeknots_admin/core/router/route_name.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Center(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 32),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Logo
                    loadAssetImage(name: applogo, height: 128),
                    // appGradientText(
                    //   text: "KAUSHALAM",
                    //   style: TextStyle(
                    //     fontSize: 36,
                    //     fontWeight: FontWeight.w500,
                    //   ),
                    //   gradient: appGradient(),
                    // ),
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
                    appOrangeTextField(
                      hintText: "Employee email",
                      icon: Icons.email_outlined,
                    ),
                    const SizedBox(height: 16),
                    appOrangeTextField(
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
                      onPressed: () {
                        Navigator.pushNamedAndRemoveUntil(
                          context,
                          RouteName.dashboardScreen,
                          (route) => false,
                        );
                      },
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
                const Text(
                  "© 2025 Kaushalam Inc",
                  style: TextStyle(
                    color: Colors.black54,
                    fontWeight: FontWeight.w500,
                    fontSize: 12,
                  ),
                ),
                // GestureDetector(
                //   onTap: () {
                //     Navigator.pushNamed(context, RouteName.singUpPage);
                //   },
                //   child: const Text(
                //     "Sign Up",
                //     style: TextStyle(
                //       color: Colors.black87,
                //       fontWeight: FontWeight.w500,
                //       // decoration: TextDecoration.underline,
                //     ),
                //   ),
                // ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// class LoginPage extends StatefulWidget {
//   const LoginPage({super.key});

//   @override
//   State<LoginPage> createState() => _LoginPageState();
// }

// class _LoginPageState extends State<LoginPage> {
//   @override
//   Widget build(BuildContext context) {
//     return const Placeholder();
//   }
// }

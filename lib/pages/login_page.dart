import 'package:flutter/material.dart';
import 'package:neeknots_admin/common/app_scaffold.dart';
import 'package:neeknots_admin/components/components.dart';
import 'package:neeknots_admin/constants/colors.dart';
import 'package:neeknots_admin/constants/string_constant.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      child: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 32),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Logo
              loadAssetImage(name: applogo, height: 48),
              const SizedBox(height: 32),

              appTextField(hintText: "Email", icon: Icons.email_outlined),
              const SizedBox(height: 16),
              appTextField(hintText: "Password", icon: Icons.lock_outline),
              const SizedBox(height: 32),
              // Login Button
              Container(
                width: double.infinity,
                height: 55,
                decoration: BoxDecoration(
                  gradient: appGradient(colors: [btnColor1, btnColor2]),
                  borderRadius: BorderRadius.circular(30),
                ),
                child: TextButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.login, color: Colors.white),
                  label: const Text(
                    "LOGIN",
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

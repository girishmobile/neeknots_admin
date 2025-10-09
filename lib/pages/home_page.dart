import 'package:flutter/material.dart';
import 'package:neeknots_admin/common/app_scaffold.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(body: Center(child: Text('Home Page')));
  }
}

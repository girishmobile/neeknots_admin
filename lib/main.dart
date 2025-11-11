import 'package:flutter/material.dart';
import 'package:neeknots_admin/core/router/route_generate.dart';
import 'package:neeknots_admin/core/router/route_name.dart';
import 'package:neeknots_admin/pages/dashboard_page.dart';
import 'package:neeknots_admin/provider/app_provider.dart';
import 'package:neeknots_admin/provider/dashboard_provider.dart';
import 'package:neeknots_admin/provider/product_detail_provider.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

List<SingleChildWidget> providers = [
  ChangeNotifierProvider<DashboardProvider>(create: (_) => DashboardProvider()),
  ChangeNotifierProvider<AppProvider>(create: (_) => AppProvider()),
  ChangeNotifierProvider<ProductDetailProvider>(
    create: (_) => ProductDetailProvider(),
  ),
];
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: providers,
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          fontFamily: "Poppins",
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        ),
        initialRoute: RouteName.loginPage,
        onGenerateRoute: RouteGenerate.onGenerateRoute,
        debugShowCheckedModeBanner: false,
        home: DashboardPage(),
      ),
    );
  }
}

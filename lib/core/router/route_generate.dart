import 'package:flutter/material.dart';
import 'package:neeknots_admin/common/app_scaffold.dart';
import 'package:neeknots_admin/core/router/route_name.dart';
import 'package:neeknots_admin/pages/dashboard_page.dart';
import 'package:neeknots_admin/pages/login_page.dart';
import 'package:neeknots_admin/pages/notification_page.dart';
import 'package:neeknots_admin/pages/profile_page.dart';

class RouteGenerate {
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    Widget screen;
    switch (settings.name) {
      case RouteName.loginPage:
        screen = const LoginPage();
        break;
      case RouteName.dashBoardPage:
        screen = DashboardPage();
        break;
      case RouteName.profilePage:
        screen = ProfilePage();
        break;
      case RouteName.notificationPage:
        screen = NotificationPage();
        break;
      default:
        screen = AppScaffold(
          child: Center(child: Text("No route define for ${settings.name}")),
        );
    }
    return _pageRouteBuilder(screen, settings);
  }

  static PageRouteBuilder _pageRouteBuilder(
    Widget screen,
    RouteSettings settings,
  ) {
    return PageRouteBuilder(
      opaque: false,
      settings: settings, //Girish 27-oct-2025
      pageBuilder: (context, animation, secondaryAnimation) => screen,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        return FadeTransition(opacity: animation, child: child);
      },
    );
  }
}

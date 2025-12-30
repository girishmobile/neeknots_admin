import 'package:flutter/material.dart';
import 'package:neeknots_admin/common/app_scaffold.dart';
import 'package:neeknots_admin/core/router/route_name.dart';
import 'package:neeknots_admin/models/product_model.dart';
import 'package:neeknots_admin/pages/customer/all_customer.dart';
import 'package:neeknots_admin/pages/customer/customer_detail_page.dart';
import 'package:neeknots_admin/pages/customer/customer_orders_page.dart';
import 'package:neeknots_admin/pages/customer/customer_spent_page.dart';
import 'package:neeknots_admin/pages/dashboard_page.dart';
import 'package:neeknots_admin/pages/login/forgot_password_page.dart';
import 'package:neeknots_admin/pages/login/login_page.dart';
import 'package:neeknots_admin/pages/login/signup_page.dart';
import 'package:neeknots_admin/pages/notification_page.dart';
import 'package:neeknots_admin/pages/order/all_order_page.dart';
import 'package:neeknots_admin/pages/order/order_detail_page.dart';
import 'package:neeknots_admin/pages/product/all_product_page.dart';
import 'package:neeknots_admin/pages/product/product_detail_page.dart';
import 'package:neeknots_admin/pages/profile_page.dart';
import 'package:neeknots_admin/pages/today_sale_page.dart';
import 'package:neeknots_admin/pages/splash_screen.dart';

class RouteGenerate {
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    Widget screen;
    switch (settings.name) {
      case RouteName.splashScreen:
        screen = const SplashScreen();
        break;
      case RouteName.loginPage:
        screen = const LoginPage();
        break;
      case RouteName.singUpPage:
        screen = const SignupPage();
        break;
      case RouteName.forgotPasswordPage:
        screen = const ForgotPasswordPage();
        break;
      case RouteName.todaySalesPage:
        screen = TodaySalePage();
        break;
      case RouteName.dashBoardPage:
        screen = DashboardPage();
        break;
      case RouteName.profilePage:
        screen = const ProfilePage();
        break;
      case RouteName.notificationPage:
        screen = const NotificationPage();
        break;
      case RouteName.allProductPage:
        screen = const AllProductPage();
        break;
      case RouteName.allCustomer:
        screen = const AllCustomer();
        break;
      case RouteName.productDetailPage:
        final args = settings.arguments as ProductModel;
        screen = ProductDetailPage(product: args);
        break;
      case RouteName.allOrderPage:
        screen = const AllOrderPage();
        break;
      case RouteName.orderDetailPage:
        screen = const OrderDetailPage();
        break;
      case RouteName.customerDetailPage:
        screen = const CustomerDetailPage();
        break;
      case RouteName.customerOrdersPage:
        screen = const CustomerOrdersPage();
        break;
      case RouteName.customerSpentPage:
        screen = const CustomerSpentPage();
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

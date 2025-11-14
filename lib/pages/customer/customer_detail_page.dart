import 'package:flutter/material.dart';
import 'package:neeknots_admin/common/app_scaffold.dart';
import 'package:neeknots_admin/components/components.dart';
import 'package:neeknots_admin/core/constants/string_constant.dart';
import 'package:neeknots_admin/core/router/route_name.dart';

class CustomerDetailPage extends StatelessWidget {
  const CustomerDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      child: Stack(
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
              loadTitleText(title: "John Smith", textAlign: TextAlign.center),
              loadSubText(
                title: "Johnsmith@gmail.com",
                textAlign: TextAlign.center,
                fontSize: 12,
              ),
              SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  loadSubText(
                    title: "Joined: 25-oct-2024",
                    textAlign: TextAlign.center,
                    fontSize: 12,
                  ),
                  SizedBox(height: 4),
                  loadSubText(
                    title: "Status: Active",
                    textAlign: TextAlign.center,
                    fontSize: 12,
                  ),
                ],
              ),
              SizedBox(height: 24),
              Align(
                alignment: Alignment.centerRight,
                child: loadSubText(
                  title: "Last Order 10-oct-2024",
                  fontSize: 10,
                ),
              ),
              SizedBox(height: 8),
              appGlassEffect(
                onTap: () =>
                    Navigator.pushNamed(context, RouteName.customerOrdersPage),
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4.0),
                  child: Row(
                    spacing: 4,
                    children: [
                      Icon(
                        Icons.shopping_bag_outlined,
                        size: 24,
                        color: Colors.black54,
                      ),
                      loadTitleText(
                        title: "Orders 15",

                        fontWight: FontWeight.w500,
                        fontColor: Colors.black54,
                      ),
                      Spacer(),
                      appForwardIcon(),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 16),
              appGlassEffect(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4.0),
                  child: Row(
                    spacing: 4,
                    children: [
                      Icon(Icons.attach_money, size: 24, color: Colors.black87),
                      loadTitleText(
                        title: "Spent \$1500.00",
                        fontWight: FontWeight.w500,
                        fontColor: Colors.black87,
                      ),
                      Spacer(),
                      appForwardIcon(),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 16),
              appGlassEffect(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4.0),
                  child: Row(
                    spacing: 4,
                    children: [
                      Icon(
                        Icons.bookmark_outline,
                        size: 24,
                        color: Colors.black87,
                      ),
                      loadTitleText(
                        title: "Billing Address",
                        fontWight: FontWeight.w500,
                        fontColor: Colors.black87,
                      ),
                      Spacer(),
                      appForwardIcon(),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 16),
              appGlassEffect(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4.0),
                  child: Row(
                    spacing: 4,
                    children: [
                      Icon(
                        Icons.local_shipping_outlined,
                        size: 24,
                        color: Colors.black87,
                      ),
                      loadTitleText(
                        title: "Shiipping Address",
                        fontWight: FontWeight.w500,
                        fontColor: Colors.black87,
                      ),
                      Spacer(),
                      appForwardIcon(),
                    ],
                  ),
                ),
              ),

              // Additional customer details can be added here
            ],
          ),
          appNavigationBar(
            title: "CUSTOMER DETAILS",
            onTap: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}

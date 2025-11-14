import 'package:flutter/material.dart';
import 'package:neeknots_admin/common/app_scaffold.dart';
import 'package:neeknots_admin/components/components.dart';
import 'package:neeknots_admin/core/constants/string_constant.dart';
import 'package:neeknots_admin/core/router/route_name.dart';
import 'package:neeknots_admin/models/order_model.dart';

class CustomerOrdersPage extends StatelessWidget {
  const CustomerOrdersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      child: Stack(
        children: [
          _listOfOrders(context),
          customerInformation(context),
          appNavigationBar(
            title: "CUSTOMER ORDERS",
            onTap: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }

  Widget customerInformation(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: 24,
        right: 24,
        top: appTopPadding(context),
      ),
      child: Container(
        color: Colors.white.withValues(alpha: 0.1),
        child: Row(
          spacing: 16,
          children: [
            appProfileImage(
              imaheUrl: hostImage,
              radius: 28,
              padding: EdgeInsets.all(0),
            ),
            Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                loadTitleText(title: "John Smith"),
                loadSubText(title: "johnsmith@gmail.com"),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _listOfOrders(BuildContext context) {
    return ListView.separated(
      padding: EdgeInsets.only(
        left: 24,
        right: 24,
        top: appTopPadding(context, extra: 56 + 16),
        bottom: listBottom(context),
      ),
      itemBuilder: (context, index) {
        final order = sampleOrders[index % sampleOrders.length];
        return GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, RouteName.orderDetailPage);
          },
          child: orderCard(order),
        );
      },
      separatorBuilder: (context, index) => const SizedBox(height: 8),
      itemCount: 40,
    );
  }
}

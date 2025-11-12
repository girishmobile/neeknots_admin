import 'package:flutter/material.dart';
import 'package:neeknots_admin/components/components.dart';
import 'package:neeknots_admin/core/constants/string_constant.dart';
import 'package:neeknots_admin/core/router/route_name.dart';
import 'package:neeknots_admin/models/order_model.dart';

class OrderPage extends StatelessWidget {
  const OrderPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(children: [_listOfOrders(context), _searchBar(context)]);
  }

  Widget _listOfOrders(BuildContext context) {
    return ListView.separated(
      padding: EdgeInsets.only(
        left: 24,
        right: 24,
        top: listTop(context),
        bottom: listBottom(context),
      ),
      itemBuilder: (context, index) {
        final order = sampleOrders[index % sampleOrders.length];
        return GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, RouteName.orderDetailPage);
          },
          child: orderItem(order),
        );
      },
      separatorBuilder: (context, index) => const SizedBox(height: 8),
      itemCount: 20,
    );
  }

  Widget _searchBar(BuildContext context) {
    final safeTop = MediaQuery.of(context).padding.top;
    final topBarHeight = 48.0; // from Dashboard SafeArea Row

    return Positioned(
      top: safeTop + topBarHeight + 8,
      left: 24,
      right: 24,
      child: appTextField(hintText: "search", icon: Icons.search),
    );
  }

  Widget orderItem(OrderModel order) {
    return appGlassEffect(
      padding: const EdgeInsets.only(left: 1, right: 1, top: 1, bottom: 1),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(8),
              bottomLeft: Radius.circular(8),
            ),
            child: loadAssetImage(
              name: order.items.isNotEmpty
                  ? order.items[0].imageUrl
                  : productImage,
              width: 100,
              height: 100,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 6,
              children: [
                loadTitleText(title: "Order #${order.orderId}", fontSize: 14),
                loadSubText(
                  title: "Customer: ${order.customerName}",
                  fontSize: 12,
                ),
                loadSubText(
                  title: "Total: \$${order.totalAmount.toStringAsFixed(2)}",
                  fontSize: 12,
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,

                    children: [
                      Icon(
                        Icons.local_shipping_outlined,
                        size: 18,
                        color: Colors.black54,
                      ),
                      const SizedBox(width: 4),
                      Padding(
                        padding: const EdgeInsets.only(right: 0),
                        child: loadSubText(
                          title: order.status.name,
                          fontSize: 10,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          appForwardIcon(),
        ],
      ),
    );
  }
}

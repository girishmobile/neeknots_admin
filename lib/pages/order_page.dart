import 'package:flutter/material.dart';
import 'package:neeknots_admin/components/components.dart';
import 'package:neeknots_admin/core/constants/string_constant.dart';
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
        return GestureDetector(onTap: () {}, child: orderItem(order));
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
        spacing: 12,
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
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 6,
              children: [
                loadTitleText(title: "Order #${order.orderId}", fontSize: 16),
                loadSubText(
                  title: "Customer: ${order.customerName}",
                  fontSize: 13,
                ),
                loadSubText(
                  title: "Total: \$${order.totalAmount.toStringAsFixed(2)}",
                  fontSize: 13,
                ),
                Align(alignment: Alignment.centerRight, child: Text("Status")),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

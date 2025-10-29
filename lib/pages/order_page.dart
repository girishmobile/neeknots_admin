import 'package:flutter/material.dart';
import 'package:neeknots_admin/components/components.dart';
import 'package:neeknots_admin/core/constants/string_constant.dart';

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
        return GestureDetector(onTap: () {}, child: orderItem());
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

  Widget orderItem() {
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
              name: productImage,
              width: 100,
              height: 100,
              fit: BoxFit.cover,
            ),
          ),
          // Expanded(
          //   child: Row(
          //     children: [
          //       Icon(Icons.shopping_cart, size: 16, color: Colors.blue),
          //       SizedBox(width: 4),
          //       Text("Orders: 5", overflow: TextOverflow.ellipsis),
          //     ],
          //   ),
          // ),
          // Expanded(
          //   child: Row(
          //     mainAxisAlignment: MainAxisAlignment.end,
          //     children: [
          //       Icon(Icons.attach_money, size: 16, color: Colors.green),
          //       SizedBox(width: 4),
          //       Text("Spent: 250.50", overflow: TextOverflow.ellipsis),
          //     ],
          //   ),
          // ),
        ],
      ),
    );
  }
}

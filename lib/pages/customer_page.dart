import 'package:flutter/material.dart';
import 'package:neeknots_admin/common/app_scaffold.dart';
import 'package:neeknots_admin/components/components.dart';
import 'package:neeknots_admin/models/customer_model.dart';

class CustomerPage extends StatelessWidget {
  const CustomerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(children: [_listOfCustomer(context), _searchBar(context)]);
  }

  Widget _listOfCustomer(BuildContext context) {
    return ListView.separated(
      padding: EdgeInsets.only(
        left: 24,
        right: 24,
        top: listTop(context),
        bottom: listBottom(context),
      ),
      itemBuilder: (context, index) {
        final custModel = sampleCustomers[index];
        return GestureDetector(onTap: () {}, child: customerCard(custModel));
      },
      separatorBuilder: (context, index) => const SizedBox(height: 8),
      itemCount: sampleCustomers.length,
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
}

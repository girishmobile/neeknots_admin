import 'package:flutter/material.dart';
import 'package:neeknots_admin/common/app_scaffold.dart';
import 'package:neeknots_admin/components/components.dart';
import 'package:neeknots_admin/core/router/route_name.dart';
import 'package:neeknots_admin/models/customer_model.dart';

class AllEmplyeePage extends StatelessWidget {
  const AllEmplyeePage({super.key});

  @override
  Widget build(BuildContext context) {
    final safeTop = MediaQuery.of(context).padding.top;
    final topBarHeight = 48.0; // from Dashboard SafeArea Row
    return AppScaffold(
      child: Stack(
        children: [
          _listOfEmployee(context),
          Positioned(
            top: safeTop + topBarHeight + 8,
            left: 24,
            right: 24,
            child: _searchBar(context),
          ),
          appNavigationBar(
            title: "EMPLOYEES",
            onTap: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }

  Widget _listOfEmployee(BuildContext context) {
    return ListView.separated(
      padding: EdgeInsets.only(
        left: 24,
        right: 24,
        top: listTop(context),
        bottom: listBottom(context),
      ),
      addAutomaticKeepAlives: false,
      addRepaintBoundaries: true,
      cacheExtent: 500,
      itemBuilder: (context, index) {
        final custModel = sampleCustomers[index];
        return RepaintBoundary(
          child: GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, RouteName.employeeDetailPage);
            },
            child: employeeCard(custModel),
          ),
        );
      },
      separatorBuilder: (context, index) => const SizedBox(height: 8),
      itemCount: sampleCustomers.length,
    );
  }

  Widget _searchBar(BuildContext context) {
    return appOrangeTextField(hintText: "search", icon: Icons.search);
  }
}

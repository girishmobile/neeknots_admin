import 'package:flutter/material.dart';
import 'package:neeknots_admin/common/app_scaffold.dart';
import 'package:neeknots_admin/components/components.dart';
import 'package:neeknots_admin/utility/utils.dart';
import 'package:provider/provider.dart';

class NotificationPage extends StatelessWidget {
  const NotificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      child: Consumer(
        builder: (context, provider, child) {
          return Stack(
            children: [
              ListView.separated(
                padding: EdgeInsets.only(
                  left: 24,
                  right: 24,
                  top: listTop(context),
                  bottom: appBottomPadding(context),
                ),
                addAutomaticKeepAlives: false,
                addRepaintBoundaries: true,
                cacheExtent: 500,
                itemBuilder: (context, index) {
                  return RepaintBoundary(
                    child: GestureDetector(
                      onTap: () {},
                      child: notificationCard(),
                    ),
                  );
                },
                separatorBuilder: (context, index) => const SizedBox(height: 8),
                itemCount: 10,
              ),
              _searchBar(context),
              appNavigationBar(
                title: "NOTIFICATION",
                onTap: () {
                  Navigator.pop(context);
                },
              ),
            ],
          );
        },
      ),
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

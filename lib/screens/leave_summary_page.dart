import 'package:flutter/material.dart';
import 'package:neeknots_admin/components/components.dart';

class LeaveSummaryPage extends StatelessWidget {
  const LeaveSummaryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ListView(
          padding: EdgeInsets.only(left: 24, right: 24, top: listTop(context)),
          children: [Center(child: Text("Comming soon"))],
        ),
      ],
    );
  }
}

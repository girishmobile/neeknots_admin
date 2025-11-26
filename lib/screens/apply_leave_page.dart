import 'package:flutter/material.dart';
import 'package:neeknots_admin/common/app_scaffold.dart';
import 'package:neeknots_admin/components/components.dart';

class ApplyLeavePage extends StatelessWidget {
  const ApplyLeavePage({super.key});

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
              loadSubText(title: "From", fontWight: FontWeight.w600),
              SizedBox(height: 8),
              appViewEffect(
                child: Row(
                  children: [
                    Expanded(child: Text("22-11-2025")),
                    Icon(Icons.calendar_month_outlined, color: Colors.black54),
                  ],
                ),
              ),
              SizedBox(height: 16),
              loadSubText(title: "To", fontWight: FontWeight.w600),
              SizedBox(height: 8),
              appViewEffect(
                child: Row(
                  children: [
                    Expanded(child: Text("22-11-2025")),
                    Icon(Icons.calendar_month_outlined, color: Colors.black54),
                  ],
                ),
              ),
              SizedBox(height: 16),
              loadSubText(title: "Days", fontWight: FontWeight.w600),
              SizedBox(height: 8),
              appViewEffect(
                child: Row(
                  children: [
                    Expanded(child: Text("22-11-2025")),
                    Icon(Icons.pending_actions, color: Colors.black54),
                  ],
                ),
              ),
              SizedBox(height: 16),
              loadSubText(title: "Leave Type", fontWight: FontWeight.w600),
              SizedBox(height: 8),
              appViewEffect(
                child: Row(
                  children: [
                    Expanded(child: Text("CL or SL")),
                    Icon(Icons.arrow_drop_down, color: Colors.black54),
                  ],
                ),
              ),
              SizedBox(height: 16),
              loadSubText(title: "Hald day", fontWight: FontWeight.w600),
              SizedBox(height: 8),
              Row(children: [Switch(value: false, onChanged: (value) {})]),

              SizedBox(height: 16),
              loadSubText(title: "Reason", fontWight: FontWeight.w600),
              SizedBox(height: 8),
              loadMultiLineTextField(),
              SizedBox(height: 24),
              gradientButton(title: "Apply Leave", onPressed: () {}),
            ],
          ),
          appNavigationBar(
            title: "Apply Leave",
            onTap: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}

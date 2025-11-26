import 'package:flutter/material.dart';
import 'package:neeknots_admin/common/app_scaffold.dart';
import 'package:neeknots_admin/components/components.dart';

class ApplyLeavePage extends StatefulWidget {
  const ApplyLeavePage({super.key});

  @override
  State<ApplyLeavePage> createState() => _ApplyLeavePageState();
}

class _ApplyLeavePageState extends State<ApplyLeavePage> {
  DateTime? fromDate;
  DateTime? toDate;

  String formatDate(DateTime? date) {
    if (date == null) return "dd/mm/yyyy";
    return "${date.day}-${date.month}-${date.year}";
  }

  int calculateDays() {
    if (fromDate == null || toDate == null) return 0;

    // +1 because both start & end dates are included in leave
    return toDate!.difference(fromDate!).inDays + 1;
  }

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
              // FROM DATE
              loadSubText(title: "From", fontWight: FontWeight.w600),
              SizedBox(height: 8),
              appViewEffect(
                onTap: () async {
                  final picked = await appDatePicker(
                    context,
                    minDate: DateTime.now(),
                  );
                  if (picked != null) {
                    setState(() {
                      fromDate = picked;
                    });
                  }
                },
                child: Row(
                  children: [
                    Expanded(child: Text(formatDate(fromDate))),
                    Icon(Icons.calendar_month_outlined, color: Colors.black54),
                  ],
                ),
              ),

              SizedBox(height: 16),

              // TO DATE
              loadSubText(title: "To", fontWight: FontWeight.w600),
              SizedBox(height: 8),
              appViewEffect(
                onTap: () async {
                  final picked = await appDatePicker(
                    context,
                    minDate: fromDate ?? DateTime.now(),
                  );
                  if (picked != null) {
                    setState(() {
                      toDate = picked;
                    });
                  }
                },
                child: Row(
                  children: [
                    Expanded(child: Text(formatDate(toDate))),
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
                    Expanded(child: Text("${calculateDays()} Days")),
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
              loadSubText(title: "Half day", fontWight: FontWeight.w600),
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

          // NAV BAR
          appNavigationBar(
            title: "Apply Leave",
            onTap: () => Navigator.pop(context),
          ),
        ],
      ),
    );
  }
}

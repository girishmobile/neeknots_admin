import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:uuid/uuid.dart';

class Utils {
  static final Uuid _uuid = Uuid();

  /// Generate a random UUID (v4)
  static String generateUUID() {
    return _uuid.v4();
  }

  /// Generate a time-based UUID (v1)
  static String generateTimeUUID() {
    return _uuid.v1();
  }
}

String formatPrice(dynamic price, {String currency = "\$"}) {
  final value = (price is double)
      ? price
      : double.tryParse(price.toString()) ?? 0.0;
  return "$currency${value.toStringAsFixed(2)}";
}

String timeAgo(DateTime date) {
  final diff = DateTime.now().difference(date);

  if (diff.inMinutes < 1) return "just now";
  if (diff.inMinutes < 60) return "${diff.inMinutes}m ago";
  if (diff.inHours < 24) return "${diff.inHours}h ago";
  return "${diff.inDays}d ago";
}
//Padding

double listTop(BuildContext context, {double extra = 0}) {
  final safeTop = MediaQuery.of(context).padding.top;
  const topBarHeight = 56.0; // your Dashboard SafeArea Row
  const searchBoxHeight = 60.0;
  return safeTop + topBarHeight + searchBoxHeight + 8 + extra;
}

double listBottom(BuildContext context, {double extra = 0}) {
  final safeBottom = MediaQuery.of(context).padding.bottom;
  const bottomBarHeight = 70.0; // your Dashboard bottom bar height

  return safeBottom + bottomBarHeight + 16 + extra;
}

double appTopPadding(BuildContext context, {double extra = 0}) {
  final safeTop = MediaQuery.of(context).padding.top;
  const topBarHeight = 48.0; // your Dashboard SafeArea Row

  final listTop =
      safeTop + topBarHeight + 8 + extra; // search bar height + spacing

  return listTop;
}

double appBottomPadding(BuildContext context, {double extra = 0}) {
  final safeBottom = MediaQuery.of(context).padding.bottom;
  // const topBarHeight = 48.0; // your Dashboard SafeArea Row

  final listTop = safeBottom + 8 + extra; // search bar height + spacing

  return listTop;
}

void hideKeyboard(BuildContext context) {
  FocusScope.of(context).unfocus();
}

void showSnackBar(
  BuildContext context, {
  required String message,
  Color? bgColor,
}) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(
        message,
        style: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w500,
        ),
      ),
      backgroundColor: bgColor ?? Colors.black87,
      duration: const Duration(seconds: 2),
    ),
  );
}

//Date Time
DateTime getCurrentDateTime() {
  return DateTime.now();
}

//Format date and time
String formateDateTime(
  DateTime dateTime, {
  String format = 'yyyy-MM-dd HH:mm:ss',
}) {
  return DateFormat(format).format(dateTime);
}

//get only date (default yyyy-MM-dd)
String getFormattedDate(DateTime dateTime, {String format = 'yyyy-MM-dd'}) {
  return DateFormat(format).format(dateTime);
}

//Get only time (default HH:mm:ss)
String getFormattedTime(DateTime dateTime, {String format = 'HH:mm:ss'}) {
  return DateFormat(format).format(dateTime);
}

String convertDate(String? date, {String format = "dd-MMM-yy"}) {
  if (date == null || date.isEmpty) return '';
  try {
    final parsed = DateTime.parse(date);
    return DateFormat(format).format(parsed);
  } catch (_) {
    return date;
  }
}

String comrateStartEndate(dynamic startDate, dynamic endDate) {
  String formattedDate;

  if (startDate == endDate) {
    // Same Date
    formattedDate = convertDate(startDate, format: "dd MMM yyyy");
  } else {
    // Date Range
    formattedDate =
        '${convertDate(startDate, format: "dd MMM yyyy")} To ${convertDate(endDate, format: "dd MMM yyyy")}';
  }
  return formattedDate;
}

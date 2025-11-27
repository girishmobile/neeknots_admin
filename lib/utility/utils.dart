import 'package:flutter/material.dart';

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

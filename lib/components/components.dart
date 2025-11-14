import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:neeknots_admin/core/constants/colors.dart';
import 'package:neeknots_admin/core/constants/string_constant.dart';
import 'package:neeknots_admin/models/customer_model.dart';
import 'package:neeknots_admin/models/notification_model.dart';
import 'package:neeknots_admin/models/order_model.dart';

Widget appCircleIcon({
  IconData? icon,
  double? iconSize = 28,
  VoidCallback? onTap,
  Color? iconColor = Colors.white60, // fallback if gradient is null
  Gradient? gradient, // add gradient option
  String? text,
  Color? borderColor,
}) {
  return Material(
    color: Colors.transparent,
    child: InkWell(
      customBorder: const CircleBorder(),
      onTap: onTap,
      child: Container(
        child: icon != null
            ? ShaderMask(
                shaderCallback: (bounds) {
                  return gradient?.createShader(
                        Rect.fromLTWH(0, 0, bounds.width, bounds.height),
                      ) ??
                      LinearGradient(
                        colors: [iconColor!, iconColor],
                      ).createShader(
                        Rect.fromLTWH(0, 0, bounds.width, bounds.height),
                      );
                },
                child: Icon(
                  icon,
                  size: iconSize,
                  color: Colors.white, // must keep white to apply shader
                ),
              )
            : Text(
                (text != null && text.isNotEmpty) ? text[0].toUpperCase() : "?",
                style: TextStyle(
                  foreground: gradient != null
                      ? (Paint()
                          ..shader = gradient.createShader(
                            const Rect.fromLTWH(0, 0, 200, 70),
                          ))
                      : null,
                  color: gradient == null ? iconColor : null,
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                ),
              ),
      ),
    ),
  );
}

Widget appCircleImage({
  IconData? icon,
  double radius = 24,
  double? iconSize = 20,
  VoidCallback? onTap,
  Color? iconColor = Colors.white,
  String? text,
  Color? backgroundColor,
  String? imageUrl,
}) {
  return Material(
    color: Colors.transparent,
    shape: CircleBorder(side: BorderSide(color: Colors.white24, width: 1.5)),
    child: InkWell(
      splashColor: Colors.transparent,
      customBorder: const CircleBorder(),
      onTap: onTap,
      child: CircleAvatar(
        radius: radius,
        backgroundColor: backgroundColor ?? Colors.transparent,
        child: _buildImageOrFallback(
          imageUrl: imageUrl,
          radius: radius,
          icon: icon,
          iconColor: iconColor,
          text: text,
        ),
      ),
    ),
  );
}

Widget _buildImageOrFallback({
  required String? imageUrl,
  required double radius,
  IconData? icon,
  Color? iconColor,
  String? text,
}) {
  if (imageUrl != null && imageUrl.isNotEmpty) {
    if (imageUrl.startsWith("http")) {
      // Network image
      return ClipOval(
        child: CachedNetworkImage(
          imageUrl: imageUrl,
          width: radius * 2,
          height: radius * 2,
          fit: BoxFit.cover,
          placeholder: (_, __) => Center(
            child: SizedBox(
              height: 16,
              width: 16,
              child: CircularProgressIndicator(strokeWidth: 2),
            ),
          ),
          errorWidget: (_, __, ___) => _fallBackContent(icon, iconColor, text),
        ),
      );
    } else if (imageUrl.contains(".png") ||
        imageUrl.contains(".jpg") ||
        imageUrl.contains(".jpeg") ||
        imageUrl.contains(".svg")) {
      // Asset image (valid extensions only)
      return ClipOval(
        child: loadAssetImage(
          name: imageUrl,
          fit: BoxFit.cover,
          width: radius * 2,
          height: radius * 2,
        ),
      );
    } else {
      // Invalid string (like "Girish") → fallback
      return _fallBackContent(icon, iconColor, text ?? imageUrl);
    }
  }

  // If no imageUrl, show fallback
  return _fallBackContent(icon, iconColor, text);
}

Widget _fallBackContent(IconData? icon, Color? iconColor, String? text) {
  if (icon != null) {
    return Icon(icon, color: iconColor, size: 20);
  } else if (text != null && text.isNotEmpty) {
    return Text(
      text.characters.first.toUpperCase(),
      style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
    );
  } else {
    return const Icon(Icons.person, size: 20, color: Colors.grey);
  }
}

Widget loadAssetImage({
  required String name,
  double? width,
  double? height,
  BoxFit fit = BoxFit.contain,
  Color? color,
  VoidCallback? onTap,
}) {
  final image = Image.asset(
    name,
    width: width,
    height: height,
    fit: fit,
    color: color,
  );

  if (onTap != null) {
    return GestureDetector(onTap: onTap, child: image);
  }
  return image;
}

Widget appGlassEffect({
  required Widget child,
  double borderRadius = 8,
  EdgeInsetsGeometry? padding,
  double blurSigma = 10,
  Color overlayColor = Colors.white,
  double opacity = 0.15,
  Color borderColor = Colors.white,
  double borderWidth = 1.0,
  VoidCallback? onTap,
}) {
  final shape = RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(borderRadius),
  );

  return GestureDetector(
    onTap: onTap,
    child: ClipRRect(
      borderRadius: BorderRadius.circular(borderRadius),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: blurSigma, sigmaY: blurSigma),
        child: Container(
          padding: padding ?? const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: overlayColor.withValues(alpha: opacity),
            borderRadius: BorderRadius.circular(borderRadius),
            border: Border.all(
              color: borderColor.withValues(alpha: 0.3),
              width: borderWidth,
            ),
          ),
          child: child,
        ),
      ),
    ),
  );
}

Widget appGradientText({
  required String text,
  required TextStyle style,
  required Gradient gradient,
}) {
  return ShaderMask(
    shaderCallback: (bounds) {
      return gradient.createShader(
        Rect.fromLTWH(0, 0, bounds.width, bounds.height),
      );
    },
    child: Text(
      text,
      style: style.copyWith(
        color: Colors.white,
      ), // color must be white to apply shader
    ),
  );
}

LinearGradient appGradient({
  Alignment begin = Alignment.topLeft,
  Alignment end = Alignment.bottomRight,
  List<Color>? colors,
}) {
  return LinearGradient(
    begin: begin,
    end: end,
    colors:
        colors ??
        [
          Color.fromRGBO(93, 161, 251, 1), // Blue
          Color.fromRGBO(153, 45, 254, 1), // Purple
        ],
  );
}

Widget appTextField({required String hintText, IconData? icon}) {
  return TextField(
    decoration: InputDecoration(
      hintText: hintText,
      hintStyle: const TextStyle(color: Colors.black54, fontSize: 14),
      prefixIcon: icon != null
          ? Padding(
              padding: const EdgeInsets.only(left: 12, right: 8), // adjust here
              child: Icon(icon, color: Colors.black54, size: 20),
            )
          : null,
      prefixIconConstraints: const BoxConstraints(
        minWidth: 32,
        minHeight: 32,
      ), // removes extra padding
      filled: true,
      fillColor: Colors.white.withValues(alpha: 0.15), // glassy effect
      contentPadding: const EdgeInsets.symmetric(vertical: 14, horizontal: 20),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(30), // rounded corners
        borderSide: BorderSide(
          color: Colors.white.withValues(alpha: 0.4), // subtle border
          width: 1.5,
        ),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(30),
        borderSide: BorderSide(
          color: Colors.white.withValues(alpha: 0.4),
          width: 1.2,
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(30),
        borderSide: BorderSide(
          color: Colors.white.withValues(alpha: 0.8),
          width: 1.5,
        ),
      ),
    ),
    style: const TextStyle(color: Colors.black87),
  );
}

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

Widget customerCard(CustomerModel customer) {
  return appGlassEffect(
    child: Row(
      children: [
        // CircleAvatar(
        //   radius: 24,
        //   backgroundImage: AssetImage(customer.imageUrl),
        // ),
        appCircleImage(imageUrl: customer.imageUrl, radius: 24),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 4,
            children: [
              Text(
                customer.name,
                style: const TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 14,
                ),
              ),
              Text(
                customer.email,
                style: const TextStyle(fontSize: 12, color: Colors.black54),
              ),
              Text(
                "Orders: ${customer.totalOrders} • \$${customer.totalSpent.toStringAsFixed(2)}",
                style: const TextStyle(
                  fontSize: 12,
                  color: Colors.black87,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
        Text(
          "${customer.joinedDate.day}/${customer.joinedDate.month}",
          style: const TextStyle(fontSize: 12, color: Colors.black54),
        ),
        SizedBox(width: 4),
        appForwardIcon(),
      ],
    ),
  );
}

Widget notificationCard(NotificationModel notification) {
  return appGlassEffect(
    child: Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 4,
            children: [
              Text(
                notification.title,
                style: const TextStyle(
                  fontWeight: FontWeight.w600,
                  color: Colors.black87,
                  fontSize: 14,
                ),
              ),
              Text(
                notification.message,
                style: const TextStyle(fontSize: 12, color: Colors.black54),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  timeAgo(notification.time),
                  style: const TextStyle(fontSize: 12, color: Colors.black54),
                ),
              ),
            ],
          ),
        ),

        SizedBox(width: 4),
        appForwardIcon(),
      ],
    ),
  );
}

Widget orderCard(OrderModel order) {
  return appGlassEffect(
    padding: const EdgeInsets.only(left: 1, right: 4, top: 1, bottom: 1),
    child: Row(
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
        SizedBox(width: 10),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 6,
            children: [
              loadTitleText(title: "Order #${order.orderId}", fontSize: 14),
              loadSubText(
                title: "Customer: ${order.customerName}",
                fontSize: 12,
              ),
              loadSubText(
                title: "Total: \$${order.totalAmount.toStringAsFixed(2)}",
                fontSize: 12,
              ),
              Align(
                alignment: Alignment.centerRight,
                child: Row(
                  mainAxisSize: MainAxisSize.min,

                  children: [
                    Icon(
                      Icons.local_shipping_outlined,
                      size: 18,
                      color: Colors.black54,
                    ),
                    const SizedBox(width: 4),
                    Padding(
                      padding: const EdgeInsets.only(right: 0),
                      child: loadSubText(
                        title: order.status.name,
                        fontSize: 10,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),

        appForwardIcon(),
      ],
    ),
  );
}

Widget appForwardIcon() {
  // Icon(Icons.chevron_right_rounded, color: Colors.white54, size: 24),
  return Icon(Icons.chevron_right_outlined, color: Colors.black26);
}

String timeAgo(DateTime date) {
  final diff = DateTime.now().difference(date);

  if (diff.inMinutes < 1) return "just now";
  if (diff.inMinutes < 60) return "${diff.inMinutes}m ago";
  if (diff.inHours < 24) return "${diff.inHours}h ago";
  return "${diff.inDays}d ago";
}

Widget loadTitleText({
  String? title,
  double? fontSize,
  Color? fontColor,
  FontWeight? fontWight,
  TextAlign? textAlign,
  TextOverflow? textOverflow,
}) {
  return Text(
    title ?? "",
    style: TextStyle(
      color: fontColor ?? Colors.black87,
      fontSize: fontSize ?? 16,
      fontWeight: fontWight ?? FontWeight.w600,
    ),
    textAlign: textAlign ?? TextAlign.left,
    overflow: textOverflow,
  );
}

Widget loadSubText({
  String? title,
  double? fontSize,
  Color? fontColor,
  FontWeight? fontWight,
  TextAlign? textAlign,
  TextOverflow? textOverflow,
}) {
  return Text(
    title ?? "",
    style: TextStyle(
      color: fontColor ?? Colors.black54,
      fontSize: fontSize ?? 14,
      fontWeight: fontWight ?? FontWeight.w500,
    ),
    textAlign: textAlign ?? TextAlign.left,
    overflow: textOverflow,
  );
}

Widget appNavigationBar({required String title, VoidCallback? onTap}) {
  return SafeArea(
    child: Container(
      height: 48,
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: appCircleIcon(
              icon: Icons.arrow_back_rounded,
              iconSize: 24,
              //gradient: appGradient(),
              iconColor: Colors.black87,
              onTap: onTap,
            ),
          ),
          Text(
            title,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: Colors.black87,
            ),
          ),
        ],
      ),
    ),
  );
}

Widget gradientCircleView({required Widget child, double size = 50}) {
  return Center(
    child: Container(
      padding: const EdgeInsets.all(3), // thickness of the gradient border
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        gradient: appGradient(),
      ),
      child: Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.white, // inner circle color
        ),
        child: child,
      ),
    ),
  );
}

Widget gradientButton({
  required String title,
  required VoidCallback onPressed,
}) {
  return Container(
    width: double.infinity,
    height: 52,
    decoration: BoxDecoration(
      gradient: appGradient(colors: [btnColor1, btnColor2]),
      borderRadius: BorderRadius.circular(30),
    ),
    child: TextButton.icon(
      onPressed: onPressed,
      icon: const Icon(Icons.login, color: Colors.white),
      label: Text(
        title,
        style: TextStyle(
          color: Colors.white,
          fontSize: 16,
          fontWeight: FontWeight.w600,
        ),
      ),
    ),
  );
}

Widget appProfileImage({
  String imaheUrl = hostImage,
  double radius = 60,
  EdgeInsetsGeometry? padding,
}) {
  return Container(
    padding: padding ?? const EdgeInsets.all(3), // thickness of border
    decoration: BoxDecoration(shape: BoxShape.circle, gradient: appGradient()),
    child: Container(
      height: radius * 2,
      width: radius * 2,
      decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.white),
      child: appCircleImage(
        imageUrl: hostImage,
        radius: (radius - 2),
        onTap: () {},
      ),
    ),
  );
}

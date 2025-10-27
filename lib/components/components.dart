import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:neeknots_admin/models/customer_model.dart';
import 'package:neeknots_admin/models/notification_model.dart';

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
  EdgeInsetsGeometry? padding,
  double borderRadius = 8,
  Color blurColor = Colors.white,
}) {
  return Container(
    padding: padding ?? const EdgeInsets.all(8),
    decoration: BoxDecoration(
      color: Colors.white.withValues(alpha: 0.2), // semi-transparent background
      borderRadius: BorderRadius.circular(borderRadius),
      border: Border.all(
        color: Colors.white.withValues(alpha: 0.3), // subtle border
        width: 1,
      ),
    ),
    child: ClipRRect(
      borderRadius: BorderRadius.circular(borderRadius),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10), // blur effect
        child: child,
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
      hintStyle: const TextStyle(color: Colors.black54, fontSize: 16),
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
      fillColor: Colors.white.withValues(alpha: 0.2), // glassy effect
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
  return safeTop + topBarHeight + searchBoxHeight + 16 + extra;
}

double listBottom(BuildContext context, {double extra = 0}) {
  final safeBottom = MediaQuery.of(context).padding.bottom;
  const bottomBarHeight = 70.0; // your Dashboard bottom bar height

  return safeBottom + bottomBarHeight + 16 + extra;
}

Widget customerCard(CustomerModel customer) {
  return appGlassEffect(
    child: Row(
      children: [
        CircleAvatar(
          radius: 24,
          backgroundImage: AssetImage(customer.imageUrl),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
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
                style: const TextStyle(fontSize: 12, color: Colors.black87),
              ),
            ],
          ),
        ),
        Text(
          "${customer.joinedDate.day}/${customer.joinedDate.month}",
          style: const TextStyle(fontSize: 12, color: Colors.black54),
        ),
        SizedBox(width: 4),
        Icon(Icons.chevron_right_outlined, color: Colors.black26),
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
        Icon(Icons.chevron_right_outlined, color: Colors.black38),
      ],
    ),
  );
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
      color: fontColor ?? Colors.white.withValues(alpha: 1),
      fontSize: fontSize ?? 16,
      fontWeight: fontWight ?? FontWeight.w700,
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

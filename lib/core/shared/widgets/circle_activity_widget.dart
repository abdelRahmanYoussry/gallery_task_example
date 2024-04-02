import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CircleActivityWidget extends StatelessWidget {
  const CircleActivityWidget(
      {super.key, required this.child, required this.widgetColor});
  final Widget child;
  final Color widgetColor;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 32.w,
      height: 32.h,
      padding: const EdgeInsets.all(5),
      decoration: ShapeDecoration(
        color: widgetColor,
        shape: const OvalBorder(),
      ),
      child: child,
    );
  }
}

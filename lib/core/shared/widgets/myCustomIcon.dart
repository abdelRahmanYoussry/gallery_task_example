import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyCustomIconsWidget extends StatelessWidget {
  MyCustomIconsWidget(
      {super.key,
      this.height,
      this.width,
      this.backGround,
      required this.onTap,
      required this.childWidget});
  late double? height = 24.h;
  late double? width = 24.w;
  Color? backGround = Colors.white;
  void Function()? onTap;
  final Widget childWidget;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
          width: width,
          height: height,
          decoration: BoxDecoration(
              color: backGround,
              // shape: BoxShape.rectangle,
              // boxShadow: [
              //   BoxShadow(
              //     color: Colors.black.withOpacity(0.5),
              //     spreadRadius: -3,
              //     blurRadius: 5,
              //     offset: const Offset(0, 0),
              //   )
              // ],
              borderRadius: BorderRadius.circular(12.r)),
          child: childWidget),
    );
  }
}

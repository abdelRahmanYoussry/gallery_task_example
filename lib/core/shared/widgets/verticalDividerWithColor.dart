import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class VerticalDividerWithColor extends StatelessWidget {
  const VerticalDividerWithColor({super.key});

  @override
  Widget build(BuildContext context) {
    return Transform(
      transform: Matrix4.identity()
        ..translate(0.0, 0.0)
        ..rotateZ(1.57),
      child: Container(
        width: 15.w,
        decoration: const ShapeDecoration(
          shape: RoundedRectangleBorder(
            side: BorderSide(
              width: 1,
              strokeAlign: BorderSide.strokeAlignCenter,
              color: Color(0xFFB9B9B9),
            ),
          ),
        ),
      ),
    );
  }
}

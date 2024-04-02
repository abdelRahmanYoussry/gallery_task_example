import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../mangers/color_manager.dart';
import '../mangers/styles_manager.dart';

class MyElevatedButton extends StatelessWidget {
  double? height;
  double? width = double.infinity;
  double? borderWidth;
  double? fontSize;
  double? radius;
  void Function()? onTap;
  IconData? icon;
  AssetImage? image;
  final Color buttonColor;
  Color? borderColor;
  Color? textColor;
  final String buttonName;
  bool? condition;
  bool? changeColor;
  TextStyle? buttonTextStyle;
  MyElevatedButton({
    this.height,
    this.width,
    this.radius,
    this.fontSize,
    this.icon,
    this.image,
    required this.onTap,
    required this.buttonName,
    required this.buttonColor,
    this.textColor,
    this.changeColor = false,
    this.condition = true,
    this.buttonTextStyle,
    this.borderColor,
    this.borderWidth,
  });
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? 328.w,
      // width: width,
      height: height ?? 60.h,
      // height: height,
      child: ConditionalBuilder(
        builder: (context) => ElevatedButton(
            onPressed: onTap,
            style: ElevatedButton.styleFrom(
                backgroundColor: buttonColor,
                side: BorderSide(
                    color: borderColor ?? buttonColor, width: borderWidth ?? 1),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(radius ?? 15.r),
                ),
                padding: EdgeInsets.zero
                // shadowColor: ColorManager.black,
                // elevation: 10.0,
                ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (icon != null)
                  Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: Icon(
                      icon,
                    ),
                  ),
                if (image != null)
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Image(
                      image: image!,
                      fit: BoxFit.cover,
                      width: 20,
                    ),
                  ),
                Text(
                  buttonName,
                  style: buttonTextStyle ?? getMediumWhite17Style(),

                  // style: Theme.of(context).textTheme.displayMedium,
                ),
              ],
            )),
        fallback: (context) => Center(
          child: CircularProgressIndicator(
            color: ColorManager.mainPrimaryColor4,
          ),
        ),
        condition: condition!,
      ),
    );
  }
}

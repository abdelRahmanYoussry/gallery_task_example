import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pro_mina_gallary_task/core/shared/widgets/spacing.dart';

class HomeWidgetButton extends StatelessWidget {
  final String buttonName;
  final IconData icon;
  final Function onSubmit;
  final Color smallContainerColor;
  final Color mainContainerColor;
  final Color iconColor;
  final TextStyle textStyle;

  const HomeWidgetButton(
      {super.key,
      required this.buttonName,
      required this.icon,
      required this.textStyle,
      required this.onSubmit,
      required this.iconColor,
      required this.smallContainerColor,
      required this.mainContainerColor});
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onSubmit();
      },
      child: Container(
        decoration: BoxDecoration(
          color: mainContainerColor,
          borderRadius: BorderRadius.circular(20.r),
        ),
        padding: EdgeInsets.symmetric(
          horizontal: 20.w,
          vertical: 5.h,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              decoration: BoxDecoration(
                color: smallContainerColor,
                borderRadius: BorderRadius.circular(10.r),
              ),
              child: Padding(
                padding: const EdgeInsets.all(3.0),
                child: Icon(
                  icon,
                  color: iconColor,
                ),
              ),
            ),
            horizontalSpace(5),
            Text(buttonName, style: textStyle),
          ],
        ),
      ),
    );
  }
}

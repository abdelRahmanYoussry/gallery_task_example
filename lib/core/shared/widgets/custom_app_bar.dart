import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  CustomAppBar({
    Key? key,
    required this.myColor,
    required this.title,
    this.routeName,
    required this.toolBarHeight,
    required this.isLeading,
    required this.onLeadingTap,
    this.actions,
    this.flexibleSpace,
    this.bottomWidget,
    this.systemUiOverlayStyle,
    this.leadingWidget,
  }) : super(key: key);

  final Color myColor;
  final Widget title;
  String? routeName;
  final double toolBarHeight;
  final bool isLeading;
  final void Function() onLeadingTap;
  Widget? leadingWidget;
  PreferredSize? bottomWidget;
  SystemUiOverlayStyle? systemUiOverlayStyle;
  List<Widget>? actions;
  Widget? flexibleSpace;
  @override
  Size get preferredSize => Size.fromHeight(toolBarHeight);
  @override
  Widget build(BuildContext context) {
    return AppBar(
      surfaceTintColor: Colors.transparent,
      systemOverlayStyle: systemUiOverlayStyle ??
          const SystemUiOverlayStyle(
            statusBarIconBrightness: Brightness.light,
          ),
      title: title,
      leading: isLeading
          ? InkWell(
              onTap: onLeadingTap

              // ()
              // {
              //   // Navigator.pop(context);
              // }

              ,
              child: leadingWidget,
            )
          : const SizedBox(),
      toolbarHeight: toolBarHeight,
      centerTitle: true,
      elevation: 0,
      flexibleSpace: flexibleSpace,
      backgroundColor: myColor,
      actions: actions,
      bottom: bottomWidget,
    );
  }
}

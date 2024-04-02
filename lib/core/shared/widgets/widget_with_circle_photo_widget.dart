import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../mangers/assets_manager.dart';
import '../mangers/color_manager.dart';
import 'cached_network_image.dart';

class WidgetWithCircleImageWidget extends StatefulWidget {
  WidgetWithCircleImageWidget(
      {super.key,
      // required this.name,
      required this.onTap,
      required this.ifFalseFunction,
      required this.clickedColor,
      required this.notClickedColor,
      this.imageUrl,
      this.imageWidth,
      this.imageHeight,
      this.boxFit,
      required this.isCircle,
      required this.isAssetsImage,
      this.assetsImageUrl,
      required this.isClicked});
  // final String name;
  final Function()? onTap;
  final Function()? ifFalseFunction;
  final Color clickedColor;
  final Color notClickedColor;
  String? imageUrl;
  String? assetsImageUrl;
  double? imageWidth;
  double? imageHeight;
  BoxFit? boxFit;
  final bool isCircle;
  final bool isAssetsImage;
  final bool isClicked;

  @override
  State<WidgetWithCircleImageWidget> createState() =>
      _WidgetWithCircleImageWidgetState();
}

class _WidgetWithCircleImageWidgetState
    extends State<WidgetWithCircleImageWidget> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        setState(() {
          // widget.isClicked = !widget.isClicked;
          // debugPrint(widget.isClicked.toString());
          debugPrint(widget.isClicked.toString());
          // widget.onTap!();

          if (widget.isClicked == true) {
            widget.ifFalseFunction!();
          } else {
            widget.onTap!();
            debugPrint(widget.isClicked.toString());
          }
        });
      },
      child: ConditionalBuilder(
        condition: widget.isCircle == false,
        builder: (context) => Container(
          width: 60.w,
          height: 60.h,
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          decoration: BoxDecoration(
              color: ColorManager.mainObjectsBackGroundColor,
              border: Border.all(
                  color: widget.isClicked == false
                      ? widget.notClickedColor
                      : widget.clickedColor,
                  width: 1),
              borderRadius: const BorderRadius.all(Radius.circular(5))),
          child: widget.imageUrl != null
              ? MyCachedNetworkImage(
                  url: widget.imageUrl!,
                  width: widget.imageWidth ?? 40.w,
                  height: widget.imageHeight ?? 40.h,
                  boxFit: widget.boxFit ?? BoxFit.cover,
                )
              : const Image(
                  image: AssetImage(ImageAssets.loginBackGroundImage)),
        ),
        fallback: (context) => ConditionalBuilder(
            condition: widget.imageUrl != null && widget.isAssetsImage == false,
            builder: (context) => ClipOval(
                  child: MyCachedNetworkImage(
                    url: widget.imageUrl!,
                    width: widget.imageWidth ?? 50.w,
                    height: widget.imageHeight ?? 50.h,
                    boxFit: widget.boxFit ?? BoxFit.cover,
                  ),
                ),
            fallback: (context) => Container(
                  width: widget.imageWidth ?? 48.w,
                  height: widget.imageHeight ?? 48.h,
                  decoration: BoxDecoration(
                      border: Border.all(
                          color: widget.isClicked == false
                              ? widget.notClickedColor
                              : widget.clickedColor,
                          strokeAlign: BorderSide.strokeAlignOutside,
                          width: 4),
                      image: DecorationImage(
                          fit: widget.boxFit ?? BoxFit.contain,
                          image: AssetImage(widget.assetsImageUrl!)),
                      shape: BoxShape.circle
                      // RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))

                      ),
                )

            //     ClipOval(
            //   child: Image(
            //     image: AssetImage(widget.assetsImageUrl!),
            //     fit: widget.boxFit ?? BoxFit.cover,
            //     width: 50.w,
            //     height: 50.h,
            //   ),
            // ),
            ),
      ),
    );
  }
}

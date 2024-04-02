import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../mangers/assets_manager.dart';
import '../mangers/color_manager.dart';

class MyCachedNetworkImage extends StatelessWidget {
  const MyCachedNetworkImage(
      {super.key, required this.url, this.width, this.height, this.boxFit});
  final String url;
  final BoxFit? boxFit;
  final double? width;
  final double? height;
  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
        imageUrl: url,
        width: width ?? 50,
        height: height ?? 50,
        fit: boxFit ?? BoxFit.cover,
        progressIndicatorBuilder: (context, url, progress) =>
            CircularProgressIndicator(
              value: progress.progress,
              color: ColorManager.mainPrimaryColor4,
            ),
        errorWidget: (context, url, error) =>
            // Image(image: AssetImage(ImageAssets.noImageAvailable)
            SvgPicture.asset(
              ImageAssets.loginBackGroundImage,
              fit: BoxFit.contain,
              // color: Colors.transparent,
              width: width ?? 100,
              height: height ?? 100,
              alignment: Alignment.center,
            ));
  }
}

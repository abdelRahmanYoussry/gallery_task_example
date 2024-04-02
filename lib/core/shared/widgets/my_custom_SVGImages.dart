import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MySvgImageWidget extends StatelessWidget {
  MySvgImageWidget({
    Key? key,
    this.boxFit,
    required this.image,
    required this.width,
    this.height,
    this.placeHolder = const CircularProgressIndicator(),
  }) : super(key: key);
  final String image;
  final Widget placeHolder;
  final double width;
  double? height;
  BoxFit? boxFit;
  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      image,
      fit: boxFit ?? BoxFit.cover,
      width: width,
      height: height ?? 220,
      placeholderBuilder: (context) => placeHolder,
      // height: MediaQuery.of(context).size.height / AppSize.size70,
    );
  }
}

// class MyCustomDividerSize20 extends StatelessWidget {
//   const MyCustomDividerSize20({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       height: 20.h,
//       // height: MediaQuery.of(context).size.height / AppSize.size70,
//     );
//   }
// }

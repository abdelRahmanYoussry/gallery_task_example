import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import 'color_manager.dart';
import 'font_manager.dart';

TextStyle _getTextStyle(
  double fontSize,
  FontWeight fontWeight,
  Color color,
) {
  //
  return GoogleFonts.alexandria(
    fontSize: fontSize,
    fontWeight: fontWeight,
    color: color,
  );
}

//New
TextStyle getBoldBlack18Style() {
  return _getTextStyle(
    FontSize.size18.sp,
    FontWeightManager.bold,
    ColorManager.textColorBoldBlack,
  );
}

TextStyle getBoldBlack16Style() {
  return _getTextStyle(
    FontSize.size16.sp,
    FontWeightManager.bold,
    ColorManager.textColorBoldBlack,
  );
}

TextStyle getMediumBlack16Style() {
  return _getTextStyle(
    FontSize.size16.sp,
    FontWeightManager.medium,
    ColorManager.textColorBoldBlack,
  );
}

TextStyle getMediumBlack15Style() {
  return _getTextStyle(
    FontSize.size15.sp,
    FontWeightManager.medium,
    ColorManager.black,
  );
}

TextStyle getMediumBlack18Style() {
  return _getTextStyle(
    FontSize.size18.sp,
    FontWeightManager.medium,
    ColorManager.textColorBoldBlack,
  );
}

TextStyle getMediumWhite10Style() {
  return _getTextStyle(
    FontSize.size10.sp,
    FontWeightManager.medium,
    ColorManager.white,
  );
}

TextStyle getMediumBlue10Style() {
  return _getTextStyle(
    FontSize.size10.sp,
    FontWeightManager.medium,
    ColorManager.blueColor,
  );
}

TextStyle getMediumBlue16Style() {
  return _getTextStyle(
    FontSize.size16.sp,
    FontWeightManager.medium,
    ColorManager.mainPrimaryColor4,
  );
}

TextStyle getMediumBlue14Style() {
  return _getTextStyle(
    FontSize.size14.sp,
    FontWeightManager.medium,
    ColorManager.mainPrimaryColor4,
  );
}

TextStyle getBoldBlack10Style() {
  return _getTextStyle(
    FontSize.size10.sp,
    FontWeightManager.bold,
    ColorManager.mainPrimaryColor4,
  );
}

TextStyle getMediumBlack20Style() {
  return _getTextStyle(
    FontSize.size20.sp,
    FontWeightManager.medium,
    ColorManager.textColorBoldBlack,
  );
}

TextStyle getMediumBlack14Style() {
  return _getTextStyle(
    FontSize.size14.sp,
    FontWeightManager.medium,
    ColorManager.textColorBoldBlack,
  );
}

TextStyle getMediumBlack12Style() {
  return _getTextStyle(
    FontSize.size12.sp,
    FontWeightManager.medium,
    ColorManager.textColorBoldBlack,
  );
}

TextStyle getMediumBlack10Style() {
  return _getTextStyle(
    FontSize.size10.sp,
    FontWeightManager.medium,
    ColorManager.textColorBoldBlack,
  );
}

TextStyle getMediumBlack8Style() {
  return _getTextStyle(
    FontSize.size8.sp,
    FontWeightManager.medium,
    ColorManager.textColorBoldBlack,
  );
}

TextStyle getMediumBlue8style() {
  return _getTextStyle(
    FontSize.size8.sp,
    FontWeightManager.medium,
    ColorManager.mainBlue,
  );
}

TextStyle getMediumGrey10Style() {
  return _getTextStyle(
    FontSize.size12.sp,
    FontWeightManager.medium,
    ColorManager.textGrey,
  );
}

TextStyle getBoldBlack14Style() {
  return _getTextStyle(
    FontSize.size14.sp,
    FontWeightManager.bold,
    ColorManager.textColorBoldBlack,
  );
}

TextStyle getBoldWhite14Style() {
  return _getTextStyle(
    FontSize.size14.sp,
    FontWeightManager.bold,
    ColorManager.white,
  );
}

TextStyle getBoldWhite18Style() {
  return _getTextStyle(
    FontSize.size18.sp,
    FontWeightManager.bold,
    ColorManager.white,
  );
}

TextStyle getBoldWhite25Style() {
  return _getTextStyle(
    FontSize.size25.sp,
    FontWeightManager.bold,
    ColorManager.white,
  );
}

TextStyle getBoldWhite12Style() {
  return _getTextStyle(
    FontSize.size12.sp,
    FontWeightManager.bold,
    ColorManager.white,
  );
}

TextStyle getRegularWhite12Style() {
  return _getTextStyle(
    FontSize.size12.sp,
    FontWeightManager.regular,
    ColorManager.white,
  );
}

TextStyle getRegularWhite14Style() {
  return _getTextStyle(
    FontSize.size14.sp,
    FontWeightManager.regular,
    ColorManager.white,
  );
}

TextStyle getBoldGrey12Style() {
  return _getTextStyle(
    FontSize.size12.sp,
    FontWeightManager.bold,
    ColorManager.textGrey,
  );
}

TextStyle getRegularWhite10Style() {
  return _getTextStyle(
    FontSize.size10.sp,
    FontWeightManager.regular,
    ColorManager.white,
  );
}

TextStyle getBoldBlack12Style() {
  return _getTextStyle(
    FontSize.size12.sp,
    FontWeightManager.bold,
    ColorManager.textColor1,
  );
}

TextStyle getBoldBlue14Style() {
  return _getTextStyle(
    FontSize.size14.sp,
    FontWeight.bold,
    ColorManager.mainPrimaryColor4,
  );
}

TextStyle getRegularRed12Style() {
  return _getTextStyle(
    FontSize.size12.sp,
    FontWeightManager.regular,
    ColorManager.error,
  );
}

TextStyle getBoldBlue12Style() {
  return _getTextStyle(
    FontSize.size12.sp,
    FontWeight.bold,
    ColorManager.mainPrimaryColor4,
  );
}

TextStyle getBoldBlue16Style() {
  return _getTextStyle(
    FontSize.size16.sp,
    FontWeight.bold,
    ColorManager.mainPrimaryColor4,
  );
}

TextStyle getBoldGray14Style() {
  return _getTextStyle(
    FontSize.size14.sp,
    FontWeight.bold,
    ColorManager.grey,
  );
}

TextStyle getBoldGray20Style() {
  return _getTextStyle(
    FontSize.size20.sp,
    FontWeight.bold,
    ColorManager.grey,
  );
}

TextStyle getBoldGray12Style() {
  return _getTextStyle(
    FontSize.size12.sp,
    FontWeight.bold,
    ColorManager.grey,
  );
}

TextStyle getBoldBlack32Style() {
  return _getTextStyle(
    FontSize.size32.sp,
    FontWeightManager.bold,
    ColorManager.daysBlackColor,
  );
}

TextStyle getBoldBlack20FinalStyle() {
  return _getTextStyle(
    FontSize.size20.sp,
    FontWeightManager.bold,
    ColorManager.textColorFinal,
  );
}

TextStyle getBoldBlack12FinalStyle() {
  return _getTextStyle(
    FontSize.size12.sp,
    FontWeightManager.bold,
    ColorManager.textColorFinal,
  );
}

TextStyle getBoldBlack30FinalStyle() {
  return _getTextStyle(
    FontSize.size30.sp,
    FontWeightManager.bold,
    ColorManager.textColorFinal,
  );
}

TextStyle getBoldBlack30Style() {
  return _getTextStyle(
    FontSize.size30.sp,
    FontWeightManager.bold,
    ColorManager.textColorBoldBlack,
  );
}

TextStyle getBoldBlack24Style() {
  return _getTextStyle(
    FontSize.size24.sp,
    FontWeightManager.bold,
    ColorManager.textColorBoldBlack,
  );
}

TextStyle getBoldBlack22Style() {
  return _getTextStyle(
    FontSize.size22.sp,
    FontWeightManager.bold,
    ColorManager.textColorBoldBlack,
  );
}

TextStyle getBoldBlack20Style() {
  return _getTextStyle(
    FontSize.size20.sp,
    FontWeightManager.bold,
    ColorManager.textColorBoldBlack,
  );
}

TextStyle getMediumWhite20Style() {
  return _getTextStyle(
    FontSize.size20.sp,
    FontWeightManager.medium,
    ColorManager.white,
  );
}

TextStyle getSemiBoldWhite24Style() {
  return _getTextStyle(
    FontSize.size24.sp,
    FontWeightManager.semiBold,
    ColorManager.white,
  );
}

TextStyle getMediumWhite17Style() {
  return _getTextStyle(
    FontSize.size17.sp,
    FontWeightManager.medium,
    ColorManager.white,
  );
}

TextStyle getMediumWhite16Style() {
  return _getTextStyle(
    FontSize.size16.sp,
    FontWeightManager.medium,
    ColorManager.white,
  );
}

TextStyle getMediumWhite18Style() {
  return _getTextStyle(
    FontSize.size18.sp,
    FontWeightManager.medium,
    ColorManager.white,
  );
}

TextStyle getMediumWhite14Style() {
  return _getTextStyle(
    FontSize.size14.sp,
    FontWeightManager.medium,
    ColorManager.white,
  );
}

TextStyle getMediumGray16Style() {
  return _getTextStyle(
    FontSize.size16.sp,
    FontWeightManager.medium,
    ColorManager.textGrey,
  );
}

TextStyle getMediumGray14Style() {
  return _getTextStyle(
    FontSize.size14.sp,
    FontWeightManager.regular,
    ColorManager.textGrey2,
  );
}

TextStyle getRegularGray14Style() {
  return _getTextStyle(
    FontSize.size14.sp,
    FontWeightManager.regular,
    ColorManager.textGrey,
  );
}

TextStyle getRegularGray12Style() {
  return _getTextStyle(
    FontSize.size12.sp,
    FontWeightManager.regular,
    ColorManager.textGrey,
  );
}

TextStyle getRegularGray10Style() {
  return _getTextStyle(
    FontSize.size10.sp,
    FontWeightManager.regular,
    ColorManager.textColorGrey,
  );
}

TextStyle getRegularGray2_16Style() {
  return _getTextStyle(
    FontSize.size16.sp,
    FontWeightManager.regular,
    ColorManager.textGrey2,
  );
}

TextStyle getRegularBlack12Style() {
  return _getTextStyle(
    FontSize.size12.sp,
    FontWeightManager.regular,
    ColorManager.textColor1,
  );
}

TextStyle getRegularBlack10Style() {
  return _getTextStyle(
    FontSize.size10.sp,
    FontWeightManager.regular,
    ColorManager.textColorBoldBlack,
  );
}

TextStyle getRegularBlue12Style() {
  return _getTextStyle(
    FontSize.size12.sp,
    FontWeightManager.regular,
    ColorManager.mainBlue,
  );
}

TextStyle getRegularBlack14Style() {
  return _getTextStyle(
    FontSize.size14.sp,
    FontWeightManager.regular,
    ColorManager.textColor1,
  );
}

TextStyle getRegularBlack16Style() {
  return _getTextStyle(
    FontSize.size16.sp,
    FontWeightManager.regular,
    ColorManager.textColor1,
  );
}

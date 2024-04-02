import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../mangers/color_manager.dart';
import '../mangers/font_manager.dart';
import '../mangers/styles_manager.dart';

class MyTextFormField extends StatelessWidget {
  late bool readOnly = false;
  final TextEditingController control;
  final TextInputType type;
  late dynamic validator;
  Function? onSubmit;
  Function? onChanged;
  Function()? onTap;
  late bool isPassword = false;
  bool? isEnabled = false;
  String? label;
  String? hint;
  Widget? prefix;
  IconData? suffix;
  Function()? suffixClicked;
  TextStyle? hintStyle;
  Color? borderColor;
  EdgeInsets? contentPadding;
  // Color ?labelColor ;
  // Color backgroundColor = Colors.blueGrey;
  // Color? prefixIconColor = Colors.limeAccent;
  // Color? suffixIconColor = ColorManager.suffixColor;
  Color? fillColor;
  String? textInputFormat;
  AutovalidateMode? isAutoValid;
  TextAlign textAlign;
  int maxText = 1;

  MyTextFormField(
      {super.key,
      required this.readOnly,
      required this.control,
      this.hint,
      this.contentPadding,
      required this.type,
      this.validator,
      this.onSubmit,
      this.onChanged,
      this.onTap,
      required this.isPassword,
      this.isEnabled,
      this.label,
      this.prefix,
      this.suffix,
      this.maxText = 1,
      this.suffixClicked,
      this.textAlign = TextAlign.start,
      this.textInputFormat,
      this.fillColor,
      this.hintStyle,
      this.isAutoValid});
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      enableSuggestions: false,
      autocorrect: false,
      inputFormatters: const [],
      readOnly: readOnly,
      autovalidateMode: isAutoValid ?? AutovalidateMode.onUserInteraction,
      // autofocus: true,
      // textAlignVertical: TextAlignVertical.center,
      onTapOutside: (value) {
        // FocusManager.instance.primaryFocus?.unfocus();
      },
      textAlign: textAlign,
      maxLines: maxText,
      controller: control,
      keyboardType: type,
      validator: validator,

      onFieldSubmitted: (s) {
        onSubmit!(s);
      },
      onTap: () {
        onTap!();
      },
      obscureText: isPassword,
      enabled: isEnabled,
      onChanged: (value) {
        onChanged!(value);
      },
      style: getMediumBlack15Style(),

      decoration: InputDecoration(
        errorStyle: TextStyle(
            fontSize: FontSize.size12.sp,
            color: ColorManager.error,
            height: 1,
            fontWeight: FontWeightManager.regular),
        fillColor: fillColor ?? ColorManager.white,
        filled: true,
        labelText: label,
        hintText: hint,
        contentPadding:
            contentPadding ?? EdgeInsets.symmetric(horizontal: 10.w),
        // labelColor
        errorMaxLines: 3,
        labelStyle: getRegularBlack10Style(),
        hintStyle: hintStyle ?? getRegularGray12Style(),
        prefixIcon: prefix,
        prefixIconColor: ColorManager.suffixColor,
        suffixIcon: suffix != null
            ? IconButton(
                onPressed: () {
                  suffixClicked!();
                },
                icon: Icon(suffix,
                    // suffixIconColor
                    color: ColorManager.suffixColor),
              )
            : null,
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: ColorManager.fillInputColor,
            width: 2,
          ),
          borderRadius: BorderRadius.circular(20.r),
        ),
        focusedBorder: OutlineInputBorder(
            borderSide:
                BorderSide(color: ColorManager.mainPrimaryColor4, width: 2),
            borderRadius: BorderRadius.circular(20.r)),
        focusedErrorBorder: OutlineInputBorder(
            borderSide: BorderSide(color: ColorManager.error, width: 1),
            borderRadius: BorderRadius.circular(20.r)),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: ColorManager.error, width: 1),
          borderRadius: BorderRadius.circular(20.r),
        ),
      ),
    );
  }
}

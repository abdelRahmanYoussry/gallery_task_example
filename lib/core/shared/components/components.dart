import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../style/NavigationService.dart';
import '../mangers/color_manager.dart';

void navigateTo(context, {required routeName}) =>
    Navigator.pushNamed(context, routeName);

void navigateAndFinish(context, {required routeName}) =>
    Navigator.pushNamedAndRemoveUntil(context, routeName, (route) => false);

void navigateAndFinishWithoutRoute(context, widget) =>
    Navigator.pushAndRemoveUntil(context,
        MaterialPageRoute(builder: (context) => widget), (route) => false);
void navigateToWithoutRoute(context, {required widget}) =>
    Navigator.push(context, MaterialPageRoute(builder: (context) => widget));

FToast? fToast;
void showToast({required String text, required ToastState state}) {
  fToast = FToast();
  fToast!.init(NavigationService.navigatorKey.currentContext!);

  FToast().showToast(
    child: Container(
      width:
          myMediaQuery(context: NavigationService.navigatorKey.currentContext!)
              .width,
      height: 50.h,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 0),
      clipBehavior: Clip.antiAlias,
      decoration: ShapeDecoration(
        gradient: LinearGradient(
          begin: const Alignment(1.00, -0.08),
          end: const Alignment(-1, 0.08),
          colors: state == ToastState.success
              ? [const Color(0xFF32BA71), const Color(0xFF2A9D8F)]
              : [const Color(0xFFF6743E), const Color(0xFFD42424)],
        ),
        shape: RoundedRectangleBorder(
          side: BorderSide(
              width: 1,
              color: state == ToastState.success
                  ? const Color(0xFF43D590)
                  : const Color(0xFFF0863A)),
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 14,
          fontFamily: 'DIN Next LT Arabic',
          fontWeight: FontWeight.w700,
          height: 1.3,
        ),
      ),
    ),
    toastDuration: const Duration(seconds: 2),
    positionedToastBuilder: (context, child) {
      return Positioned(
        // top: 16.0,
        bottom: 10.0,
        width: myMediaQuery(
                context: NavigationService.navigatorKey.currentContext!)
            .width,
        child: child,
      );
    },
  );
}

void showToastNew(
    {required String text,
    required ToastState state,
    required BuildContext context}) {
  FToast fToast = FToast();
  // fToast.init(NavigationService.navigatorKey.currentContext!);
  fToast.init(context);
  // fToast = FToast();
  // fToast!.init(NavigationService.navigatorKey.currentContext!);
  // if (fToast == null) {
  //   void initToast() {
  //
  //     fToast!.init(NavigationService.navigatorKey.currentContext!);
  //   }
  // }
  fToast.showToast(
    child: Container(
      width: myMediaQuery(context: context).width,
      // height: AppSize.size50.h,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 0),
      clipBehavior: Clip.antiAlias,
      decoration: ShapeDecoration(
        gradient: LinearGradient(
          begin: const Alignment(1.00, -0.08),
          end: const Alignment(-1, 0.08),
          colors: state == ToastState.success
              ? [const Color(0xFF32BA71), const Color(0xFF2A9D8F)]
              : [const Color(0xFFF6743E), const Color(0xFFD42424)],
        ),
        shape: RoundedRectangleBorder(
          side: BorderSide(
              width: 1,
              color: state == ToastState.success
                  ? const Color(0xFF43D590)
                  : const Color(0xFFF0863A)),
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 14,
          fontFamily: 'DIN Next LT Arabic',
          fontWeight: FontWeight.w700,
          // height: 1.2,
        ),
      ),
    ),
    toastDuration: const Duration(seconds: 3),
    positionedToastBuilder: (context, child) {
      return Positioned(
        // top: 16.0,
        bottom: 10.0,
        width: myMediaQuery(context: context).width,
        child: child,
      );
    },
  );
}

Color chooseToastColor(ToastState state) {
  Color color;
  switch (state) {
    case ToastState.success:
      color = Colors.green;
      break;
    case ToastState.error:
      color = Colors.red;
      break;
    case ToastState.warning:
      color = Colors.amber;
      break;
  }
  return color;
}

enum ToastState { success, error, warning }

Size myMediaQuery({
  required BuildContext context,
}) {
  return MediaQuery.of(context).size;
}

SnackBar mySnackBar({required String myMessage, required bool isError}) =>
    SnackBar(
      width:
          myMediaQuery(context: NavigationService.navigatorKey.currentContext!)
              .width,
      behavior: SnackBarBehavior.floating,
      padding: const EdgeInsets.symmetric(vertical: 10),
      // margin: const EdgeInsets.symmetric(vertical: AppPadding.padding10),
      content: Text(
        textAlign: TextAlign.center,
        myMessage,
        style:
            const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
      ),
      backgroundColor:
          isError ? ColorManager.error : ColorManager.mainPrimaryColor4,
    );

DateTime currentDateTime() {
  return DateTime.now();
}

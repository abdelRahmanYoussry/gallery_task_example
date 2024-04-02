import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../features/auth/data/login_model.dart';
import '../../features/auth/presentaion/controller/login_cubit.dart';
import '../../features/auth/presentaion/login/login_screen.dart';
import '../../features/home/prsentaion/controller/home_cubit.dart';
import '../../features/home/prsentaion/screen/home_screen.dart';
import '../services_locator/services_locator.dart';
import '../shared/mangers/color_manager.dart';
import '../shared/mangers/styles_manager.dart';

class Routes {
  static const String loginScreen = '/loginScreen';
  static const String signUpScreen = '/signUpScreen';
  static const String homeScreen = '/homeScreen';
  static const String behaviorRecord = '/behaviorRecord';
  static const String addRoutine = '/addRoutine';
  static const String routineScreen = '/routine';
  static const String profileScreen = '/profile';
  static const String informationScreen = '/information';
  static const String addChildScreen = '/addChild';
  static const String parentLayoutScreen = '/parentLayout';
  static const String splashScreen = '/splashScreen';
}

class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings settings) {
    //this arguments to be passed in any screen like this ( arguments as ClassName )
    final arguments = settings.arguments;
    switch (settings.name) {
      case Routes.homeScreen:
        return MaterialPageRoute(
            builder: (context) => BlocProvider(
                  create: (context) => serviceLocator<HomeCubit>()..getImages(),
                  child: HomeScreen(
                    loginModel: settings.arguments as LoginModel,
                  ),
                ),
            settings: settings);
      case Routes.loginScreen:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => serviceLocator<LoginCubit>(),
            child: const LoginScreen(),
          ),
        );
      default:
        return unDefinedRoute();
    }
  }

  static Route<dynamic> unDefinedRoute() {
    return MaterialPageRoute(
      builder: (_) => Scaffold(
        backgroundColor: ColorManager.mainPrimaryColor4,
        appBar: AppBar(
          backgroundColor: ColorManager.mainPrimaryColor4,
          elevation: 0,
          centerTitle: true,
          title: const Text(
            'LocaleKeys.appName.tr()',
          ),
        ),
        body: Center(
          child: Text(
            'No Route',
            style: getBoldBlack24Style(
// color: ColorManager.white,
// fontSize: FontSize.size18,
                ),
          ),
        ),
      ),
    );
  }
}

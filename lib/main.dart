import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pro_mina_gallary_task/core/services_locator/services_locator.dart'
    as di;

import 'core/routes/app_routes.dart';
import 'core/shared/app/NavigationService.dart';
import 'core/shared/mangers/color_manager.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  await ScreenUtil.ensureScreenSize();
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarBrightness: Brightness.light,
  ));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      useInheritedMediaQuery: true,
      builder: (context, child) => MaterialApp(
        title: 'MyGallery',
        navigatorKey: NavigationService.navigatorKey,
        debugShowCheckedModeBanner: false,
        onGenerateRoute: (route) => RouteGenerator.getRoute(route),
        initialRoute: Routes.loginScreen,
        theme: ThemeData(
          colorScheme:
              ColorScheme.fromSeed(seedColor: ColorManager.mainPrimaryColor4),
          scaffoldBackgroundColor: ColorManager.white,
          useMaterial3: true,
        ),
      ),
    );
  }
}

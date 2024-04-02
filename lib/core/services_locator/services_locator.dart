import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../features/auth/presentaion/controller/login_cubit.dart';
import '../../features/home/prsentaion/controller/home_cubit.dart';
import '../bloc_observer/bloc_observer.dart';
import '../network/dio_helper.dart';

final serviceLocator = GetIt.instance;

Future<void> init() async {
  //// Bloc Observer
  final myBlocObserver = Bloc.observer = MyBlocObserver();
  serviceLocator.registerFactory(() => myBlocObserver);
  ///// SHARED PREFERENCES
  final sharedPreferences = await SharedPreferences.getInstance();
  ////////Blocs
  serviceLocator.registerFactory(() => HomeCubit());
  serviceLocator.registerFactory(() => LoginCubit());
  serviceLocator.registerFactory(() => ());
  //////////////Shared Pref
  serviceLocator.registerFactory(() => sharedPreferences);
  //// DIO
  serviceLocator.registerLazySingleton(() => LogInterceptor(
        request: true,
        requestBody: true,
        requestHeader: true,
        responseBody: true,
        responseHeader: true,
        error: true,
      ));
  serviceLocator.registerLazySingleton(() => Dio());
  DioHelper.init();
}

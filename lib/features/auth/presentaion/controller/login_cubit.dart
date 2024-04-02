import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:pro_mina_gallary_task/core/cache_helper/cache_helper.dart';

import '../../../../core/network/base_errors_model.dart';
import '../../../../core/network/dio_helper.dart';
import '../../../../core/network/end_points.dart';
import '../../../../core/shared/mangers/strings_manager.dart';
import '../../data/login_model.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());
  LoginModel? loginModel;
  BaseErrorsModel? baseErrorsModel;
  void userLogin({
    required String email,
    required String password,
  }) async {
    try {
      emit(LoginLoadingState());
      DioHelper.postData(
        endpoint: loginEndPoint,
        isFile: false,
        data: {
          "email": email,
          "password": password,
        },
        query: {},
      ).then((value) {
        if (value.statusCode == 200) {
          if (value.data != null) {
            loginModel = LoginModel.fromJson(value.data);
            debugPrint('${loginModel!.token} token');
            String newToken = loginModel!.token!;
            CacheHelper.saveDataToSharedPreferences(
                key: token, value: newToken);
            emit(LoginSuccessState(loginModel!));
          } else {
            baseErrorsModel = BaseErrorsModel.fromJson(value.data);
            emit(LoginErrorState());
          }
        } else {
          emit(LoginErrorState());
        }
      });
    } on DioError catch (e) {
      // debugPrint(e.toString());
      if (e.response != null) {
        if (e.response!.statusCode == 422) {
          // debugPrint(e.response!.data['message']);
        }
      }
      debugPrint('$e  ERROR IN LOGIN CUBIT');
      emit(LoginErrorState());
    }
  }
}

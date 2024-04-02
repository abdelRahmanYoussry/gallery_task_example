import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pro_mina_gallary_task/core/shared/mangers/assets_manager.dart';
import 'package:pro_mina_gallary_task/core/shared/mangers/extensions.dart';

import '../../../../core/routes/app_routes.dart';
import '../../../../core/shared/app/app_regex.dart';
import '../../../../core/shared/components/components.dart';
import '../../../../core/shared/mangers/color_manager.dart';
import '../../../../core/shared/mangers/styles_manager.dart';
import '../../../../core/shared/widgets/elevatedButton.dart';
import '../../../../core/shared/widgets/spacing.dart';
import '../../../../core/shared/widgets/textFormfield.dart';
import '../controller/login_cubit.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _emailController = TextEditingController();

  final _passwordController = TextEditingController();

  bool rememberMe = false;

  final GlobalKey<FormState> _loginKey = GlobalKey<FormState>();

  @override
  void initState() {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
    ));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state is LoginErrorState) {
          showToastNew(
              text: 'Something went wrong please try again',
              state: ToastState.error,
              context: context);
        }
        if (state is LoginSuccessState) {
          showToastNew(
              text: 'Login Success',
              state: ToastState.success,
              context: context);
          context.pushNamedAndRemoveUntil(
            Routes.homeScreen,
            arguments: state.loginModel,
            predicate: (route) => false,
          );
        }
      },
      builder: (context, state) {
        return Scaffold(
          extendBodyBehindAppBar: true,
          resizeToAvoidBottomInset: true,
          body: SingleChildScrollView(
            child: Stack(
              alignment: Alignment.center,
              children: [
                Image.asset(
                  ImageAssets.loginBackGroundImage,
                  fit: BoxFit.fill,
                ),
                Positioned(
                  top: myMediaQuery(context: context).height * 0.4,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30.0),
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: ClipRect(
                        child: BackdropFilter(
                          filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
                          child: Container(
                            // margin: EdgeInsets.symmetric(vertical: 30.h),
                            decoration: BoxDecoration(
                              color: ColorManager.white.withOpacity(0.3),
                              borderRadius: BorderRadius.circular(40.r),
                            ),
                            width: 345.w,
                            // height: 200.h,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 30.0, horizontal: 24),
                              child: Form(
                                key: _loginKey,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      'LOG IN',
                                      style: getBoldBlack30FinalStyle(),
                                    ),
                                    verticalSpace(15),
                                    MyTextFormField(
                                        readOnly: false,
                                        control: _emailController,
                                        type: TextInputType.emailAddress,
                                        onChanged: (value) {},
                                        onTap: () {},
                                        fillColor: ColorManager.white,
                                        onSubmit: (value) {},
                                        validator: (value) {
                                          if (value.isEmpty) {
                                            return emptyValidationMessage(
                                                'Email');
                                          }
                                          if (!AppRegex.isEmailValid(value)) {
                                            return userEmailValidationMessage(
                                                'Email');
                                          }
                                        },
                                        hint: "Email",
                                        isPassword: false),
                                    verticalSpace(15),
                                    MyTextFormField(
                                        readOnly: false,
                                        control: _passwordController,
                                        type: TextInputType.text,
                                        onChanged: (value) {},
                                        onTap: () {},
                                        fillColor: ColorManager.white,
                                        onSubmit: (value) {},
                                        validator: (value) {
                                          if (value.isEmpty) {
                                            return emptyValidationMessage(
                                                'Password');
                                          }
                                          if (!AppRegex.hasMinLength(value)) {
                                            return userPasswordValidationMessage(
                                                'password');
                                          }
                                        },
                                        hint: "Password",
                                        isPassword: true),
                                    verticalSpace(25),
                                    MyElevatedButton(
                                      condition: state is! LoginLoadingState,
                                      height: 50.h,
                                      onTap: () {
                                        if (_loginKey.currentState!
                                            .validate()) {
                                          context.read<LoginCubit>().userLogin(
                                              email: _emailController.text,
                                              password:
                                                  _passwordController.text);
                                        }
                                      },
                                      buttonName: 'SUBMIT',
                                      buttonColor:
                                          ColorManager.mainPrimaryColor2,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

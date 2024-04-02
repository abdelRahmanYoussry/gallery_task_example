import 'dart:ui';

import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pro_mina_gallary_task/core/shared/components/components.dart';
import 'package:pro_mina_gallary_task/core/shared/mangers/extensions.dart';
import 'package:pro_mina_gallary_task/core/shared/mangers/styles_manager.dart';
import 'package:pro_mina_gallary_task/core/shared/widgets/spacing.dart';
import 'package:pro_mina_gallary_task/features/auth/data/login_model.dart';

import '../../../../core/shared/mangers/assets_manager.dart';
import '../../../../core/shared/mangers/color_manager.dart';
import '../../../../core/shared/widgets/home_button_widget.dart';
import '../controller/home_cubit.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key, required this.loginModel});

  final LoginModel loginModel;

  @override
  Widget build(BuildContext context) {
    final LoginModel loginModel =
        ModalRoute.of(context)!.settings.arguments as LoginModel;
    return BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) {
        if (state is UploadImageSuccessState) {
          showToastNew(
              text: context.read<HomeCubit>().uploadImageMessage ??
                  'Image uploaded successfully',
              state: ToastState.success,
              context: context);
          context.pop();
        }
        if (state is UploadImageErrorState) {
          showToastNew(
            text: 'Error while uploading image',
            state: ToastState.error,
            context: context,
          );
        }
        if (state is GetImagesErrorState) {
          showToastNew(
            text: 'Error while getting images',
            state: ToastState.error,
            context: context,
          );
        }
      },
      builder: (context, state) {
        return Scaffold(
          extendBodyBehindAppBar: true,
          // resizeToAvoidBottomInset: true,
          body: SingleChildScrollView(
              child: Container(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                    fit: BoxFit.fill,
                    image: AssetImage(
                      ImageAssets.homeBackGroundImage,
                    ),
                  )),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 30.0, horizontal: 16),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text(
                                'Welcome',
                                style: getBoldBlack20FinalStyle(),
                              ),
                              const Spacer(),
                              const CircleAvatar(
                                radius: 25,
                                backgroundImage:
                                    AssetImage(ImageAssets.userExample),
                              )
                            ],
                          ),
                          SizedBox(
                            width: 220.w,
                            child: Text(
                              loginModel.loginData!.name ?? 'No User Name',
                              style: getBoldBlack20FinalStyle(),
                            ),
                          ),
                          verticalSpace(30),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              HomeWidgetButton(
                                buttonName: 'Log Out',
                                iconColor: ColorManager.white,
                                textStyle: getBoldBlack12FinalStyle(),
                                mainContainerColor:
                                    ColorManager.white.withOpacity(0.5),
                                smallContainerColor: ColorManager.error,
                                onSubmit: () {},
                                icon: Icons.arrow_back_rounded,
                              ),
                              HomeWidgetButton(
                                buttonName: 'Upload',
                                iconColor: ColorManager.white,
                                smallContainerColor: Colors.amber,
                                textStyle: getBoldBlack12FinalStyle(),
                                mainContainerColor:
                                    ColorManager.white.withOpacity(0.5),
                                onSubmit: () {
                                  showDialog(
                                      context: context,
                                      builder: (_) => Dialog(
                                            backgroundColor: Colors.transparent,
                                            child: ClipRect(
                                              child: BackdropFilter(
                                                filter: ImageFilter.blur(
                                                    sigmaX: 2.0, sigmaY: 2.0),
                                                child: Container(
                                                  height: myMediaQuery(
                                                              context: context)
                                                          .height *
                                                      0.25,
                                                  width: 345.w,
                                                  // margin: EdgeInsets.symmetric(vertical: 30.h),
                                                  decoration: BoxDecoration(
                                                    color: ColorManager.white
                                                        .withOpacity(0.3),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            40.r),
                                                  ),
                                                  // height: 200.h,
                                                  child: Padding(
                                                      padding:
                                                          EdgeInsets.symmetric(
                                                              vertical: 30.0,
                                                              horizontal: 60.w),
                                                      child: Column(children: [
                                                        HomeWidgetButton(
                                                            buttonName:
                                                                'Gallery',
                                                            textStyle:
                                                                getBoldBlack20FinalStyle(),
                                                            iconColor: ColorManager
                                                                .mainPrimaryColor4,
                                                            icon: Icons.photo,
                                                            onSubmit: () {
                                                              context
                                                                  .read<
                                                                      HomeCubit>()
                                                                  .pickUpProfileImage();
                                                            },
                                                            smallContainerColor:
                                                                ColorManager
                                                                    .galleryIconColor,
                                                            mainContainerColor:
                                                                ColorManager
                                                                    .galleryIconColor),
                                                        const Spacer(),
                                                        HomeWidgetButton(
                                                            buttonName:
                                                                'Camera',
                                                            textStyle:
                                                                getBoldBlack20FinalStyle(),
                                                            iconColor:
                                                                ColorManager
                                                                    .mainBlue,
                                                            icon: Icons
                                                                .camera_alt,
                                                            onSubmit: () {
                                                              context
                                                                  .read<
                                                                      HomeCubit>()
                                                                  .getImages();
                                                            },
                                                            smallContainerColor:
                                                                ColorManager
                                                                    .cameraIconColor,
                                                            mainContainerColor:
                                                                ColorManager
                                                                    .cameraIconColor),
                                                      ])),
                                                ),
                                              ),
                                            ),
                                          ));
                                },
                                icon: Icons.arrow_upward,
                              ),
                            ],
                          ),
                          ConditionalBuilder(
                            builder: (context) => Expanded(
                              child: GridView.builder(
                                  itemCount:
                                      context.read<HomeCubit>().images.length,
                                  gridDelegate:
                                      const SliverGridDelegateWithFixedCrossAxisCount(
                                          crossAxisCount: 3,
                                          mainAxisSpacing: 20,
                                          crossAxisSpacing: 30),
                                  itemBuilder: (context, index) {
                                    return Container(
                                        decoration: BoxDecoration(
                                            color: ColorManager.white,
                                            borderRadius: BorderRadius.circular(
                                              20.r,
                                            ),
                                            image: DecorationImage(
                                                fit: BoxFit.fill,
                                                image: NetworkImage(context
                                                    .read<HomeCubit>()
                                                    .images[index]))));
                                  }),
                            ),
                            fallback: (context) => const SizedBox(),
                            condition:
                                context.read<HomeCubit>().images.isNotEmpty,
                          )
                        ]),
                  ))),
        );
      },
    );
  }
}

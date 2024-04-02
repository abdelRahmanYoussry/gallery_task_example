import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pro_mina_gallary_task/core/network/end_points.dart';

import '../../../../core/cache_helper/cache_helper.dart';
import '../../../../core/network/dio_helper.dart';
import '../../../../core/shared/mangers/strings_manager.dart';
import '../../Data/images_model.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());
  String? uploadImageMessage;
  ImagesModel? imagesModel;
  List<dynamic> images = [];
  final userToken = CacheHelper.getSharedPreferencesValue(key: token);

  File? profileImageFile;
  var picker = ImagePicker();
  // String? base64Image;
  Future<void> pickUpProfileImage() async {
    emit(PickUpImageLoadingState());
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      profileImageFile = File(pickedFile.path);
      debugPrint('${pickedFile.path}   Path');
      if (profileImageFile != null) {
        uploadImage(image: profileImageFile!);
      }
      emit(PickUpImageSuccessState());
    } else {
      debugPrint('No Image Selected');
      emit(PickUpImageErrorState());
    }
  }

  Future<void> uploadImage({required File image}) async {
    try {
      emit(UploadImageLoadingState());
      DioHelper.postData(
        endpoint: uploadImageEndPoint,
        isFile: true,
        newData: FormData.fromMap({
          'img': await MultipartFile.fromFile(image.path),
        }),
        token: userToken.toString(),
        query: {},
      ).then((value) {
        if (value.statusCode == 200) {
          if (value.data != null) {
            debugPrint(value.data.toString());
            uploadImageMessage = value.data['message'];
            getImages();

            emit(UploadImageSuccessState());
          } else {
            emit(UploadImageErrorState());
          }
        } else {
          emit(UploadImageErrorState());
        }
      });
    } on DioError catch (e) {
      if (e.response != null) {
        if (e.response!.statusCode == 422) {
          // debugPrint(e.response!.data['message']);
        }
      }
      debugPrint('$e  ERROR IN LOGIN CUBIT');
      emit(UploadImageErrorState());
    }
  }

  Future<void> getImages() async {
    try {
      emit(GetImagesLoadingState());
      DioHelper.getData(
        endpoint: getImageEndPoint,
        token: userToken.toString(),
        query: {},
      ).then((value) {
        if (value.statusCode == 200) {
          if (value.data != null) {
            debugPrint(value.data.toString());
            imagesModel = ImagesModel.fromJson(value.data);
            images = imagesModel!.imageData!;
            for (var element in imagesModel!.imageData!) {
              debugPrint(element.toString());
            }

            emit(GetImagesSuccessState());
          } else {
            emit(GetImagesErrorState());
          }
        } else {
          emit(GetImagesErrorState());
        }
      });
    } on DioError catch (e) {
      if (e.response != null) {
        if (e.response!.statusCode == 422) {
          debugPrint(e.response!.data['message']);
        }
      }
      debugPrint('$e  ERROR IN LOGIN CUBIT');
      emit(GetImagesErrorState());
    }
  }
}

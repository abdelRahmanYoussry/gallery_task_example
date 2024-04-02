import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

import '../shared/mangers/strings_manager.dart';
import 'end_points.dart';

class DioHelper {
  static Dio? dio;
  static init() {
    debugPrint(baseUrl);
    debugPrint('Dio Initialized');
    dio = Dio(BaseOptions(
        // baseUrl: 'https://apitest.truckella.com/api/', followRedirects: true
        // baseUrl: 'http://144.126.155.112:8090/api/',
        validateStatus: (statusCode) {
          if (statusCode == null) {
            debugPrint(statusCode.toString());
            return false;
          }
          if (statusCode == 422) {
            // your http status code
            return true;
          } else if (statusCode == 401) {
            return true;
          } else {
            return statusCode >= 200 && statusCode < 300;
          }
        },
        baseUrl: baseUrl,
        followRedirects: true));
  }

  static Future<Response> getData(
      {required String endpoint,
      Map<String, dynamic>? query,
      required String token}) async {
    dio!.options.headers = {
      // 'Language': checkDirection(dirArabic: "ar", dirEnglish: "en"),
      "Content-Type": "application/json",
      "Accept": "application/json",
      "Authorization": 'Bearer $token'
    };
    return await dio!.get(
      endpoint,
      queryParameters: query,
    );
  }

  static Future<Response> getDataForCities(
      {required String endpoint,
      Map<String, dynamic>? query,
      required String lang}) async {
    dio!.options.headers = {
      // 'Language':
      //     lang == "" ? checkDirection(dirArabic: "ar", dirEnglish: "en") : lang
    };
    return await dio!.get(
      endpoint,
      // queryParameters: query,
    );
  }

  static Future<Response> postData({
    required String endpoint,
    Map<String, dynamic>? query,
    Map<String, dynamic>? data,
    dynamic newData,
    String? token,
    required bool isFile,
  }) {
    debugPrint(isFile.toString());
    isFile == true
        ? dio!.options.headers = {
            "Content-Type": "multipart/form-data",
            "Accept": "application/json",
            "Authorization": 'Bearer $token'
          }
        : token == null
            ? dio!.options.headers = {
                "Content-Type": "application/json",
                "Accept": "application/json",

                // 'Language': checkDirection(dirArabic: "ar", dirEnglish: "en"),
              }
            : dio!.options.headers = {
                "Content-Type": "application/json",
                "Accept": "application/json",
                "Authorization": 'Bearer $token'
                // 'Language': checkDirection(dirArabic: "ar", dirEnglish: "en"),
              };
    return dio!.post(
      endpoint,
      queryParameters: query!,
      data: isFile ? newData : data,
    );
  }

  static Future<Response> patchData({
    required String endpoint,
    required Map<String, dynamic> query,
    required data,
  }) {
    dio!.options.headers = {
      "content-type": "application/json",
      'Authorization': "Bearer $token",
      // 'Language': checkDirection(dirEnglish: "en", dirArabic: "ar"),
    };
    return dio!.patch(
      endpoint,
      queryParameters: query,
      data: data,
    );
  }

  static Future<Response> patchDataForPhoneConfirmation({
    required String endpoint,
    required Map<String, dynamic> query,
    required data,
  }) {
    dio!.options.headers = {
      "content-type": "application/json",
      // 'Language': checkDirection(dirEnglish: "en", dirArabic: "ar"),
    };
    return dio!.patch(
      endpoint,
      queryParameters: query,
      data: data,
    );
  }

  static Future<Response> getDataWithToken(
      {required String endpoint, Map<String, dynamic>? query}) async {
    dio!.options.headers = {
      // 'Language': checkDirection(dirArabic: "ar", dirEnglish: "en"),
      'Authorization': "Bearer $token",
    };
    return await dio!.get(
      endpoint,
      queryParameters: query,
    );
  }

  static Future<Response> postDataWithToken({
    required String endpoint,
    required Map<String, dynamic> query,
    required Map<String, dynamic> data,
  }) {
    dio!.options.headers = {
      "content-type": "application/json",
      'Authorization': "Bearer $token",
      // 'Language': checkDirection(dirEnglish: "en", dirArabic: "ar"),
    };
    return dio!.post(
      endpoint,
      queryParameters: query,
      data: data,
    );
  }

  static Future<Response> deleteData({
    required String endpoint,
    required Map<String, dynamic> query,
    required Map<String, dynamic> data,
  }) {
    dio!.options.headers = {
      "content-type": "application/json",
      'Authorization': "Bearer $token",
      // 'Language': checkDirection(dirEnglish: "en", dirArabic: "ar"),
    };
    return dio!.delete(
      endpoint,
      queryParameters: query,
      data: data,
    );
  }

  static Future<Response> putData({
    required String endpoint,
    required Map<String, dynamic> query,
    required Map<String, dynamic> data,
  }) {
    dio!.options.headers = {
      "content-type": "application/json",
      'Authorization': "Bearer $token",
      // 'Language': checkDirection(dirEnglish: "en", dirArabic: "ar"),
    };
    return dio!.put(
      endpoint,
      queryParameters: query,
      data: data,
    );
  }

  static Future<Response> postDataWithTokenToChangeUserProfile({
    required String url,
    required Map<String, dynamic> query,
    required FormData data,
  }) {
    // dio!.options.headers = {
    //   // "content-type": "application/json",
    //   // "Accept": "application/json", "x-localization": "ar",
    //   // 'Authorization': "Bearer " + token,
    //   // 'lang': checkDirection(dirEnglish: "en", dirArabic: "ar"),
    //   // "country_id": countryId,
    // };
    return dio!.post(
      url,
      queryParameters: query,
      data: data,
    );
  }
}

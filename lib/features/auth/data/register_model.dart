import '../../../core/network/base_errors_model.dart';
import '../../../core/network/base_model.dart';

class RegisterModel extends BaseModel {
  RegisterData? registerData;
  String? token;
  RegisterModel(
      {super.data,
      required super.succeeded,
      required super.message,
      super.errors,
      this.registerData,
      this.token});

  factory RegisterModel.fromJson(Map<String, dynamic> json) {
    return RegisterModel(
        succeeded: json['success'],
        message: json['message'].toString(),
        data: json['data'],
        errors: json['errors'] != null
            ? BaseErrorsModel.fromJson(json['errors'])
            : null,
        registerData: json['data'] != null
            ? RegisterData.fromJson(json['data']['info'])
            : null,
        token: json['data'] != null ? json['data']['token'] : null);
  }
}

class RegisterData {
  String? firstName;
  int? id;
  String? lastName;
  String? email;
  String? phoneNumber;
  String? token;
  bool? isNany;
  RegisterData.fromJson(Map<String, dynamic> json) {
    firstName = json['firstName'];
    id = json['id'];
    lastName = json['lastName'];
    email = json['email'];
    phoneNumber = json['phoneNumber'];
    isNany = json['isNany'];
    token = json['token'];
  }
}

class LoginModel {
  LoginData? loginData;
  String? token;
  LoginModel({
    this.loginData,
    this.token,
  });

  factory LoginModel.fromJson(Map<String, dynamic> json) {
    return LoginModel(
        loginData: LoginData.fromJson(json['user']), token: json['token']);
  }
}

class LoginData {
  String? name;
  int? id;
  String? email;
  String? email_verified_at;
  String? created_at;
  String? updated_at;
  LoginData.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    id = json['id'];
    email = json['email'];
    email_verified_at = json['email_verified_at'];
    updated_at = json['updated_at'];
    created_at = json['created_at'];
  }
}

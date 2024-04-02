class BaseErrorsModel {
  // String? propertyName;
  String? message;

  BaseErrorsModel({this.message});

  factory BaseErrorsModel.fromJson(Map<String, dynamic> json) {
    return BaseErrorsModel(
      // propertyName: json["propertyName"],
      message: json["message"],
    );
  }
}

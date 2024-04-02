import 'base_errors_model.dart';

class BaseModel {
  late final dynamic data;
  final bool succeeded;
  final String message;
  BaseErrorsModel? errors;

  BaseModel({
    required this.data,
    required this.succeeded,
    required this.message,
    this.errors,
  });
}

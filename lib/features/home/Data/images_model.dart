class ImagesModel {
  List<dynamic>? imageData;
  String? message;
  ImagesModel({
    // super.data,
    // required super.succeeded,
    // required super.message,
    // required super.errors,
    this.imageData,
    this.message,
  });

  factory ImagesModel.fromJson(Map<String, dynamic> json) {
    return ImagesModel(
        // imageData: json['data'] != null
        //     ? List<ImageData>.from(
        //         json['data']['images'].map((x) => ImageData.fromJson(x)))
        //     : null,
        imageData: json['data'] != null ? json['data']['images'] : null,
        message: json['data']['message']);
  }
}

class ImageData {
  dynamic image;
  ImageData.fromJson(Map<String, dynamic> json) {
    image = json['name'];
  }
}

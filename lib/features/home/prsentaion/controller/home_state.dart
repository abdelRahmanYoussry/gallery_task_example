part of 'home_cubit.dart';

// @immutable
abstract class HomeState {}

class HomeInitial extends HomeState {}

class UploadImageLoadingState extends HomeState {}

class UploadImageSuccessState extends HomeState {}

class UploadImageErrorState extends HomeState {}

class PickUpImageLoadingState extends HomeState {}

class PickUpImageSuccessState extends HomeState {}

class PickUpImageErrorState extends HomeState {}

class GetImagesLoadingState extends HomeState {}

class GetImagesSuccessState extends HomeState {}

class GetImagesErrorState extends HomeState {}

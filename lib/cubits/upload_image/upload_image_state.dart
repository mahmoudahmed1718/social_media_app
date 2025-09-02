part of 'upload_image_cubit.dart';

@immutable
sealed class UploadImageState {}

final class UploadImageInitial extends UploadImageState {}

final class UploadImageLoading extends UploadImageState {}

final class UploadImageSuccess extends UploadImageState {
  final String imageUrl;
  UploadImageSuccess({required this.imageUrl});
}

final class UploadImageFailure extends UploadImageState {
  final String errorMessage;
  UploadImageFailure({required this.errorMessage});
}

import 'dart:io';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:social_meda/core/repo/upload_image/upload_image_repo.dart';

part 'upload_image_state.dart';

class UploadImageCubit extends Cubit<UploadImageState> {
  UploadImageCubit({required this.uploadImageRepo})
    : super(UploadImageInitial());

  final UploadImageRepo uploadImageRepo;

  Future<void> uploadImage(String imagePath) async {
    emit(UploadImageLoading());
    final file = File(imagePath);

    final result = await uploadImageRepo.uploadImage(file);

    result.fold(
      (failure) => emit(UploadImageFailure(errorMessage: failure.message)),
      (url) => emit(UploadImageSuccess(imageUrl: url)),
    );
  }
}

import 'dart:developer';
import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:social_meda/core/errors/server_faileur.dart';

import 'package:social_meda/core/repo/upload_image/upload_image_repo.dart';
import 'package:social_meda/core/services/backend_point.dart';
import 'package:social_meda/core/services/storage_service.dart';

class UploadImageRepoImpl implements UploadImageRepo {
  final StorageService storageService;

  UploadImageRepoImpl({required this.storageService});
  @override
  Future<Either<Faileur, String>> uploadImage(File imageFile) async {
    try {
      String url = await storageService.uploadFile(
        imageFile,
        BackEndpoints.imagesBucket,
      );
      return Right(url);
    } catch (e) {
      log('Error uploading image: ${e.toString()}');
      return Left(Faileur(message: 'Failed to upload image: ${e.toString()}'));
    }
  }
}

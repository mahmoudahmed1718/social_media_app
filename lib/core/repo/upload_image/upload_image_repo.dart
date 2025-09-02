import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:social_meda/core/errors/server_faileur.dart';

abstract class UploadImageRepo {
  Future<Either<Faileur, String>> uploadImage(File imageFile);
}

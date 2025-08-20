import 'package:dartz/dartz.dart';
import 'package:social_meda/core/errors/server_faileur.dart';
import 'package:social_meda/features/auth/domain/entites/app_user_entity.dart';

abstract class AuthRepo {
  Future<Either<Faileur, AppUserEntity>> signInWithEmailAndPassword({
    required String email,
    required String password,
  });
  Future<Either<Faileur, AppUserEntity>> signUpWithEmailAndPassword({
    required String email,
    required String password,
    required String name,
  });
  Future<void> signOut();
  Future<AppUserEntity?> getCurrentUser();
}

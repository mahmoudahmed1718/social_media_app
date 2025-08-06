import 'package:dartz/dartz.dart';
import 'package:social_meda/core/errors/server_faileur.dart';
import 'package:social_meda/features/auth/domain/entites/app_user_entity.dart';

abstract class AuthRepo {
  Future<Either<Faileur, AppUserEntity>> signInWithEmailAndPassword(
    String email,
    String password,
  );
  Future<Either<Faileur, AppUserEntity>> signUpWithEmailAndPassword(
    String email,
    String password,
    String name,
  );
  Future<void> signOut();
  Future<AppUserEntity?> getCurrentUser();
}

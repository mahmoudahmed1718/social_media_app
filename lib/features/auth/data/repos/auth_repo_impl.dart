import 'package:dartz/dartz.dart';
import 'package:social_meda/core/errors/custom_excption.dart';
import 'package:social_meda/core/errors/server_faileur.dart';
import 'package:social_meda/core/services/firebase_auth_service.dart';
import 'package:social_meda/features/auth/data/model/app_user_model.dart';
import 'package:social_meda/features/auth/domain/entites/app_user_entity.dart';
import 'package:social_meda/features/auth/domain/repos/auth_repo.dart';

class AuthRepoImpl implements AuthRepo {
  final FirebaseAuthServices firebaseAuthServices;

  AuthRepoImpl({required this.firebaseAuthServices});

  @override
  Future<Either<ServerFaileur, AppUserEntity>> signInWithEmailAndPassword(
    String email,
    String password,
  ) async {
    try {
      var user = await firebaseAuthServices.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return right(AppUserModel.fromFirebaseUser(user));
    } on CustomException catch (e) {
      return left(ServerFaileur(message: e.message));
    }
  }

  @override
  Future<Either<ServerFaileur, AppUserEntity>> signUpWithEmailAndPassword(
    String email,
    String password,
    String name,
  ) async {
    try {
      var user = await firebaseAuthServices.createUserWithEmailAndPassword(
        email: email,
        password: password,
        name: name,
      );
      return right(AppUserModel.fromFirebaseUser(user));
    } on CustomException catch (e) {
      return left(ServerFaileur(message: e.message));
    }
  }

  @override
  Future<void> signOut() {
    // TODO: implement signOut
    throw UnimplementedError();
  }

  @override
  Future<AppUserEntity?> getCurrentUser() {
    throw UnimplementedError();
  }
}

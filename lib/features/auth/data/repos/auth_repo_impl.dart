import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:social_meda/constant.dart';

import 'package:social_meda/core/errors/custom_excption.dart';
import 'package:social_meda/core/errors/server_faileur.dart';
import 'package:social_meda/core/services/backend_endpoint.dart';
import 'package:social_meda/core/services/database_service.dart';
import 'package:social_meda/core/services/firebase_auth_service.dart';
import 'package:social_meda/core/services/shared_prefence_singleton.dart';
import 'package:social_meda/features/auth/data/model/app_user_model.dart';
import 'package:social_meda/features/auth/domain/entites/app_user_entity.dart';
import 'package:social_meda/features/auth/domain/repos/auth_repo.dart';

class AuthRepoImpl implements AuthRepo {
  final FirebaseAuthServices firebaseAuthServices;
  final DatabaseService databaseService;

  AuthRepoImpl({
    required this.firebaseAuthServices,
    required this.databaseService,
  });

  @override
  Future<Either<ServerFaileur, AppUserEntity>> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      var user = await firebaseAuthServices.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      var userData = await databaseService.getData(
        path: BackendEndpoint.usersCollection,
        documentId: user!.uid,
      );
      saveUserData(userEntity: AppUserModel.fromJson(userData));
      return right(AppUserModel.fromJson(userData));
    } on CustomException catch (e) {
      return left(ServerFaileur(message: e.message));
    }
  }

  @override
  Future<Either<ServerFaileur, AppUserEntity>> signUpWithEmailAndPassword({
    required String email,
    required String password,
    required String name,
  }) async {
    User? user;
    try {
      var user = await firebaseAuthServices.createUserWithEmailAndPassword(
        email: email,
        password: password,
        name: name,
      );

      final userModel = AppUserModel(uId: user!.uid, name: name, email: email);
      await databaseService.addData(
        path: BackendEndpoint.usersCollection,
        data: userModel.toJson(),
      );
      return right(userModel);
    } on CustomException catch (e) {
      await deleteuser(user);
      return left(ServerFaileur(message: e.message));
    } catch (e) {
      deleteuser(user);
      return left(ServerFaileur(message: 'An unknown error occurred.'));
    }
  }

  @override
  Future<void> signOut() async {
    await firebaseAuthServices.signOut();
  }

  @override
  Future<AppUserEntity?> getCurrentUser() async {
    var user = await firebaseAuthServices.getCurrentUser();
    if (user == null) {
      return null;
    }
    return AppUserModel.fromFirebaseUser(user);
  }

  Future<void> deleteuser(User? user) async {
    if (user != null) {
      await firebaseAuthServices.deleteUser();
    }
  }

  Future<AppUserEntity> saveUserData({
    required AppUserEntity userEntity,
  }) async {
    var jsonData = jsonEncode(AppUserModel.fromEntity(userEntity).toJson());
    await SharedPreferenceSingleton.setString(kUserData, jsonData);
    return userEntity;
  }
}

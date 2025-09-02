import 'package:social_meda/core/services/backend_point.dart';
import 'package:social_meda/features/auth/domain/entites/app_user_entity.dart';

class AppUserModel extends AppUserEntity {
  AppUserModel({required super.uId, required super.name, required super.email});

  factory AppUserModel.fromJson(Map<String, dynamic> json) {
    return AppUserModel(
      uId: json[BackEndpoints.userUid],
      name: json[BackEndpoints.name],
      email: json[BackEndpoints.userEmail],
    );
  }
  factory AppUserModel.fromEntity(AppUserEntity entity) {
    return AppUserModel(
      uId: entity.uId,
      name: entity.name,
      email: entity.email,
    );
  }
  Map<String, dynamic> toJson() {
    return {
      BackEndpoints.userUid: uId,
      BackEndpoints.name: name,
      BackEndpoints.userEmail: email,
    };
  }

  factory AppUserModel.fromFirebaseUser(dynamic user) {
    return AppUserModel(
      uId: user.uid,
      name: user.displayName ?? '',
      email: user.email ?? '',
    );
  }
}

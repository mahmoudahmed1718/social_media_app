import 'package:social_meda/core/services/backend_point.dart';
import 'package:social_meda/features/profile/domain/entities/profile_user_entity.dart';

class ProfileUserModel extends ProfileUserEntity {
  ProfileUserModel({
    required super.bio,
    required super.profileImageUrl,
    required super.username,
    required super.uId,
    required super.name,
    required super.email,
  });
  ProfileUserEntity copyWith({
    String? bio,
    String? profileImageUrl,
    String? username,
  }) {
    return ProfileUserEntity(
      bio: bio ?? this.bio,
      profileImageUrl: profileImageUrl ?? this.profileImageUrl,
      username: username ?? this.username,
      uId: uId,
      name: name,
      email: email,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      BackEndpoints.userBio: bio,
      BackEndpoints.userProfileImageUrl: profileImageUrl,
      BackEndpoints.username: username,
      BackEndpoints.userUid: uId,
      BackEndpoints.name: name,
      BackEndpoints.userEmail: email,
    };
  }

  factory ProfileUserModel.fromJson(Map<String, dynamic> json) {
    return ProfileUserModel(
      bio: json[BackEndpoints.userBio] ?? '',
      profileImageUrl: json[BackEndpoints.userProfileImageUrl] ?? '',
      username: json[BackEndpoints.username] ?? '',
      uId: json[BackEndpoints.userUid] ?? '',
      name: json[BackEndpoints.name] ?? '',
      email: json[BackEndpoints.userEmail] ?? '',
    );
  }
}

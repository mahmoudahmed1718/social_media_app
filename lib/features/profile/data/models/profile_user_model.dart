import 'package:social_meda/core/services/backend_endpoint.dart';
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
      BackendEndpoint.userBio: bio,
      BackendEndpoint.userProfileImageUrl: profileImageUrl,
      BackendEndpoint.username: username,
      BackendEndpoint.userUid: uId,
      BackendEndpoint.name: name,
      BackendEndpoint.userEmail: email,
    };
  }

  factory ProfileUserModel.fromJson(Map<String, dynamic> json) {
    return ProfileUserModel(
      bio: json[BackendEndpoint.userBio] ?? '',
      profileImageUrl: json[BackendEndpoint.userProfileImageUrl] ?? '',
      username: json[BackendEndpoint.username] ?? '',
      uId: json[BackendEndpoint.userUid] ?? '',
      name: json[BackendEndpoint.name] ?? '',
      email: json[BackendEndpoint.userEmail] ?? '',
    );
  }
}

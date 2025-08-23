import 'package:social_meda/features/auth/domain/entites/app_user_entity.dart';

class ProfileUserEntity extends AppUserEntity {
  final String bio;
  final String profileImageUrl;
  final String username;
  ProfileUserEntity({
    required this.bio,
    required this.profileImageUrl,
    required this.username,
    required super.uId,
    required super.name,
    required super.email,
  });

  factory ProfileUserEntity.formEntity({
    required ProfileUserEntity profileUserEntity,
  }) {
    return ProfileUserEntity(
      bio: profileUserEntity.bio,
      profileImageUrl: profileUserEntity.profileImageUrl,
      username: profileUserEntity.username,
      uId: profileUserEntity.uId,
      name: profileUserEntity.name,
      email: profileUserEntity.email,
    );
  }
}

import 'package:social_meda/features/auth/domain/entites/app_user_entity.dart';

class ProfileUser extends AppUserEntity {
  final String bio;
  final String profileImageUrl;
  final String username;
  ProfileUser(
    this.bio,
    this.profileImageUrl,
    this.username, {
    required super.uId,
    required super.name,
    required super.email,
  });
}

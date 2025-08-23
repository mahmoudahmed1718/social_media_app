import 'package:social_meda/features/profile/domain/entities/profile_user_entity.dart';

abstract class ProfileUserRepo {
  Future<ProfileUserEntity?> getProfileUser({required String uid});
  Future<void> updateProfileUser({ProfileUserEntity? profileUserEntity});
}

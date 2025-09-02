import 'package:social_meda/core/services/backend_point.dart';
import 'package:social_meda/core/services/database_service.dart';
import 'package:social_meda/features/profile/data/models/profile_user_model.dart';
import 'package:social_meda/features/profile/domain/entities/profile_user_entity.dart';
import 'package:social_meda/features/profile/domain/repo/profile_user_repo.dart';

class ProfileUserRepoImpl implements ProfileUserRepo {
  final DatabaseService databaseService;

  ProfileUserRepoImpl({required this.databaseService});
  @override
  Future<ProfileUserEntity?> getProfileUser({required String uid}) async {
    final userData = await databaseService.getData(
      documentId: uid,
      path: BackEndpoints.usersCollection,
    );
    return ProfileUserModel.fromJson(userData);
  }

  @override
  Future<void> updateProfileUser({ProfileUserEntity? profileUserEntity}) async {
    try {
      var updateData = await databaseService.updateData(
        documentId: profileUserEntity!.uId,
        path: BackEndpoints.usersCollection,
        data: {
          BackEndpoints.username: profileUserEntity.username,
          BackEndpoints.userProfileImageUrl: profileUserEntity.profileImageUrl,
          BackEndpoints.userBio: profileUserEntity.bio,
          BackEndpoints.name: profileUserEntity.name,
        },
      );
      return updateData;
    } catch (e) {
      throw Exception('Failed to update profile user: $e');
    }
  }
}

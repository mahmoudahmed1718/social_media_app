import 'package:social_meda/core/services/backend_endpoint.dart';
import 'package:social_meda/core/services/database_service.dart';
import 'package:social_meda/features/profile/domain/entities/profile_user_entity.dart';
import 'package:social_meda/features/profile/domain/repo/profile_user_repo.dart';

class ProfileUserRepoImpl implements ProfileUserRepo {
  final DatabaseService databaseService;

  ProfileUserRepoImpl({required this.databaseService});
  @override
  Future<ProfileUserEntity?> getProfileUser({required String uid}) async {
    final userData = await databaseService.getData(
      documentId: uid,
      path: BackendEndpoint.usersCollection,
    );
    return ProfileUserEntity.formEntity(
      profileUserEntity: userData as ProfileUserEntity,
    );
  }

  @override
  Future<void> updateProfileUser({ProfileUserEntity? profileUserEntity}) {
    // TODO: implement updateProfileUser
    throw UnimplementedError();
  }
}

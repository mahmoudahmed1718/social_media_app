import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:social_meda/features/profile/domain/entities/profile_user_entity.dart';
import 'package:social_meda/features/profile/domain/repo/profile_user_repo.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  final ProfileUserRepo profileUserRepo;

  ProfileCubit({required this.profileUserRepo}) : super(ProfileInitial());

  Future<void> fetchProfileUser({required String uid}) async {
    emit(ProfileLoading());
    final user = await profileUserRepo.getProfileUser(uid: uid);

    if (user != null) {
      emit(ProfileLoaded(profileUser: user));
    } else {
      emit(ProfileError('Failed to load profile user'));
    }
  }

  Future<void> updateProfileUser({
    required ProfileUserEntity profileUser,
  }) async {
    emit(ProfileLoading());
    try {
      await profileUserRepo.updateProfileUser(profileUserEntity: profileUser);
      // after update, emit success state
      emit(ProfileLoaded(profileUser: profileUser));
    } catch (e) {
      emit(ProfileError('Failed to update profile user: $e'));
    }
  }
}

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
}

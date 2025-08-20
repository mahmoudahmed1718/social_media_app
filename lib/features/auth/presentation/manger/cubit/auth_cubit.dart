import 'package:bloc/bloc.dart';

import 'package:meta/meta.dart';
import 'package:social_meda/features/auth/domain/entites/app_user_entity.dart';
import 'package:social_meda/features/auth/domain/repos/auth_repo.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final AuthRepo authRepo;
  AuthCubit({required this.authRepo}) : super(AuthInitial());
  Future<void> login({required String email, required String password}) async {
    emit(AuthLoading());
    var user = await authRepo.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
    user.fold(
      (l) => emit(AuthError(message: l.message)),
      (r) => emit(AuthSuccess(user: r)),
    );
  }

  Future<void> register({
    required String email,
    required String password,
    required String name,
  }) async {
    emit(AuthLoading());
    var user = await authRepo.signUpWithEmailAndPassword(
      email: email,
      password: password,
      name: name,
    );
    user.fold(
      (l) => emit(AuthError(message: l.message)),
      (r) => emit(AuthSuccess(user: r)),
    );
  }

  Future<void> logout() async {
    await authRepo.signOut();
  }
}

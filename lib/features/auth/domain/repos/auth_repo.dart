import 'package:social_meda/features/auth/domain/entites/app_user_entity.dart';

abstract class AuthRepo {
  Future<void> signInWithEmailAndPassword(String email, String password);
  Future<void> signUpWithEmailAndPassword(String email, String password);
  Future<void> signOut();
  Future<AppUserEntity?> getCurrentUser();
}

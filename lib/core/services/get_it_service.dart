import 'package:get_it/get_it.dart';
import 'package:social_meda/core/services/firebase_auth_service.dart';
import 'package:social_meda/features/auth/data/repos/auth_repo_impl.dart';
import 'package:social_meda/features/auth/domain/repos/auth_repo.dart';

GetIt getIt = GetIt.instance;

void setupGetIt() {
  getIt.registerSingleton<FirebaseAuthServices>(FirebaseAuthServices());
  getIt.registerSingleton<AuthRepo>(
    AuthRepoImpl(firebaseAuthServices: getIt.get<FirebaseAuthServices>()),
  );
}

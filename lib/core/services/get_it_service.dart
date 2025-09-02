import 'package:get_it/get_it.dart';
import 'package:social_meda/core/services/database_service.dart';
import 'package:social_meda/core/services/firebase_auth_service.dart';
import 'package:social_meda/core/services/firestore_service.dart';
import 'package:social_meda/core/services/storage_service.dart';
import 'package:social_meda/core/services/supabase_storage_service.dart';
import 'package:social_meda/features/auth/data/repos/auth_repo_impl.dart';
import 'package:social_meda/features/auth/domain/repos/auth_repo.dart';
import 'package:social_meda/features/profile/data/repo/profile_user_repo_impl.dart';
import 'package:social_meda/features/profile/domain/repo/profile_user_repo.dart';

GetIt getIt = GetIt.instance;

void setupGetIt() {
  getIt.registerSingleton<FirebaseAuthServices>(FirebaseAuthServices());
  getIt.registerSingleton<DatabaseService>(FirestoreService());
  getIt.registerSingleton<StorageService>(SupabaseStorageService());
  getIt.registerSingleton<AuthRepo>(
    AuthRepoImpl(
      firebaseAuthServices: getIt.get<FirebaseAuthServices>(),
      databaseService: getIt.get<DatabaseService>(),
    ),
  );
  getIt.registerSingleton<ProfileUserRepo>(
    ProfileUserRepoImpl(databaseService: getIt.get<DatabaseService>()),
  );
}

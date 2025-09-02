import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:social_meda/core/services/get_it_service.dart';
import 'package:social_meda/core/utils/keys.dart';
import 'package:social_meda/core/utils/on_route_generate.dart';

import 'package:social_meda/features/splash/presentation/view/splash_view.dart';
import 'package:social_meda/features/theme/light_mode.dart';
import 'package:social_meda/firebase_options.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'core/services/shared_prefence_singleton.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: ".env");
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await Supabase.initialize(
    url: Keys.supabaseUrl,
    anonKey: Keys.supabaseAnonKey,
  );
  setupGetIt();
  await SharedPreferenceSingleton.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: lightMode,
      onGenerateRoute: onGenerateRoutes,
      initialRoute: SplashView.routeName,
    );
  }
}

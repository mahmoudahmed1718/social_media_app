import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:social_meda/core/services/get_it_service.dart';
import 'package:social_meda/core/utils/on_route_generate.dart';
import 'package:social_meda/features/auth/presentation/views/login_page.dart';
import 'package:social_meda/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  setupGetIt();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      onGenerateRoute: onGenerateRoutes,
      initialRoute: LoginPage.routeName,
      home: LoginPage(),
    );
  }
}

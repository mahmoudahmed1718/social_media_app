import 'package:flutter_dotenv/flutter_dotenv.dart';

abstract class Keys {
  static String get googleApiKey => dotenv.env['google_api_key']!;
  static String get supabaseUrl => dotenv.env['supabase_url']!;
  static String get supabaseAnonKey => dotenv.env['supabase_anon_key']!;
}

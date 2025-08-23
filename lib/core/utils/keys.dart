// lib/core/utils/keys.dart
import 'package:flutter_dotenv/flutter_dotenv.dart';

class Keys {
  static final String googleApiKey = dotenv.env['google_api_key']!;
  // static final String supabaseUrl = dotenv.env['URL_SUPABASE']!;
  // static final String supabaseApiKey = dotenv.env['API_KEY_SUPABASE']!;
}

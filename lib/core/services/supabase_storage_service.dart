import 'dart:io';

import 'package:social_meda/core/services/backend_point.dart';
import 'package:social_meda/core/services/storage_service.dart';
import 'package:social_meda/core/utils/keys.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:path/path.dart' as b;

class SupabaseStorageService implements StorageService {
  static late Supabase _supabase;
  static initSupabase() async {
    _supabase = await Supabase.initialize(
      url: Keys.supabaseUrl,
      anonKey: Keys.supabaseAnonKey,
    );
  }

  @override
  @override
  Future<String> uploadFile(File file, String path) async {
    String fileName = b.basename(file.path);
    String extensionName = b.extension(file.path);

    String fullPath = '$path/$fileName$extensionName';

    await _supabase.client.storage
        .from(BackEndpoints.imagesBucket)
        .upload(fullPath, file);

    final String publicUrl = _supabase.client.storage
        .from(BackEndpoints.imagesBucket)
        .getPublicUrl(fullPath);

    return publicUrl;
  }
}

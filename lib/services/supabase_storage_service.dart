import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseStorageService {
  final SupabaseClient _supabase = Supabase.instance.client;

  Future<List<String>> getImageUrls() async {
    try {
      final response = await _supabase
          .storage
          .from('images') // Replace with your bucket name
          .list();

      final List<String> imageUrls = [];
      for (var file in response) {
        final String publicUrl = _supabase
            .storage
            .from('images')
            .getPublicUrl(file.name);
        imageUrls.add(publicUrl);
      }

      return imageUrls;
    } catch (e) {
      throw Exception('Failed to fetch image URLs: $e');
    }
  }
}
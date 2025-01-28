import 'package:flutter/material.dart';
import 'package:sabrina2025/model/image_model.dart';
import 'package:sabrina2025/services/supabase_storage_service.dart';

class ImageViewModel extends ChangeNotifier {
  final SupabaseStorageService _storageService = SupabaseStorageService();
  List<ImageModel> _images = [];
  bool _isLoading = false;

  List<ImageModel> get images => _images;
  bool get isLoading => _isLoading;

  Future<void> fetchImages() async {
    _isLoading = true;
    notifyListeners();

    try {
      final urls = await _storageService.getImageUrls();
      _images = urls.map((url) => ImageModel(url: url)).toList();
    } catch (e) {
      print('Error fetching images: $e');
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}

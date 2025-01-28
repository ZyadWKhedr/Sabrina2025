import 'package:flutter/material.dart';
import 'package:sabrina2025/model/product_model.dart';
import '../services/supabase_service.dart';

class ProductViewModel with ChangeNotifier {
  final SupabaseService _supabaseService;
  List<Product> _products = [];
  bool _isLoading = false;
  String _errorMessage = '';

  ProductViewModel(this._supabaseService);

  List<Product> get products => _products;
  bool get isLoading => _isLoading;
  String get errorMessage => _errorMessage;

  Future<void> fetchProductsByCategory(String category) async {
    _isLoading = true;
    _errorMessage = '';
    notifyListeners();

    try {
      // Use the service to fetch products
      _products = await _supabaseService.streamProductsByCategory(category).first;
    } catch (e) {
      _errorMessage = 'Failed to fetch products: $e';
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> addProduct(Product product) async {
    try {
      await _supabaseService.addProduct(product);
      notifyListeners(); // Refresh the product list
    } catch (e) {
      _errorMessage = 'Failed to add product: $e';
      notifyListeners();
    }
  }

  Future<void> deleteProductByName(String productName) async {
    try {
      await _supabaseService.deleteProductByName(productName);
      notifyListeners(); // Refresh the product list
    } catch (e) {
      _errorMessage = 'Failed to delete product: $e';
      notifyListeners();
    }
  }

  Future<void> updateProductByName(
      String productName, Map<String, dynamic> updatedFields) async {
    try {
      await _supabaseService.updateProductByName(productName, updatedFields);
      notifyListeners(); // Refresh the product list
    } catch (e) {
      _errorMessage = 'Failed to update product: $e';
      notifyListeners();
    }
  }
}
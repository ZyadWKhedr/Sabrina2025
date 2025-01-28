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

  /// Fetch products by category
  Future<void> fetchProductsByCategory(int categoryId) async {
    _isLoading = true;
    _errorMessage = '';
    notifyListeners();

    try {
      // Listen to the stream and update the products list
      _supabaseService.streamProductsByCategoryId(categoryId).listen(
          (products) {
        _products = products;
        notifyListeners();
      }, onError: (error) {
        _errorMessage = 'Failed to fetch products: $error';
        notifyListeners();
      });
    } catch (e) {
      _errorMessage = 'Failed to fetch products: $e';
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  /// Add a new product
  Future<void> addProduct(Product product) async {
    _isLoading = true;
    _errorMessage = '';
    notifyListeners();

    try {
      await _supabaseService.addProduct(product);
      // Refresh the product list after adding
      await fetchProductsByCategory(product.categoryId!);
    } catch (e) {
      _errorMessage = 'Failed to add product: $e';
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  /// Delete a product by name
  Future<void> deleteProductByName(String productName) async {
    _isLoading = true;
    _errorMessage = '';
    notifyListeners();

    try {
      await _supabaseService.deleteProductByName(productName);
      // Refresh the product list after deletion
      await fetchProductsByCategory(_products.first.categoryId!);
    } catch (e) {
      _errorMessage = 'Failed to delete product: $e';
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  /// Update a product by name
  Future<void> updateProductByName(
      String productName, Map<String, dynamic> updatedFields) async {
    _isLoading = true;
    _errorMessage = '';
    notifyListeners();

    try {
      await _supabaseService.updateProductByName(productName, updatedFields);
      // Refresh the product list after updating
      await fetchProductsByCategory(_products.first.categoryId!);
    } catch (e) {
      _errorMessage = 'Failed to update product: $e';
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  /// Fetch all products (no category filter)
  Future<void> fetchAllProducts() async {
    _isLoading = true;
    _errorMessage = '';
    notifyListeners();

    try {
      // Fetch all products from the database
      _products = await _supabaseService.fetchAllProducts();
      notifyListeners();
    } catch (e) {
      _errorMessage = 'Failed to fetch all products: $e';
      notifyListeners();
    } finally {
      _isLoading = false;
    }
  }
}

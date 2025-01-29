import 'package:sabrina2025/model/categories_model.dart';
import 'package:sabrina2025/model/product_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseService {
  final SupabaseClient _client;

  SupabaseService(this._client);

  /// Stream products filtered by category ID
  Stream<List<Product>> streamProductsByCategoryId(int categoryId) {
    if (categoryId <= 0) {
      throw Exception('Category ID must be a positive number');
    }

    return _client
        .from('products')
        .stream(primaryKey: ['id'])
        .eq('category_id', categoryId) // Use category_id instead of category
        .order('id', ascending: true)
        .map((data) {
          if (data == null) {
            throw Exception('No data received from the stream');
          }
          return data.map((json) => Product.fromJson(json)).toList();
        })
        .handleError((error) {
          throw Exception('Error streaming products: $error');
        });
  }

  /// Add a new product to the database
  Future<void> addProduct(Product product) async {
    if (product.name.isEmpty || product.categoryId == null) {
      throw Exception('Product name and category ID are required');
    }

    final response = await _client.from('products').insert({
      'name': product.name,
      'description': product.description,
      'image_url': product.imageUrl,
      'price': product.price,
      'category_id': product.categoryId,
    });

    if (response == null) {
      throw Exception('Failed to add product: No response from server');
    }
  }

  /// Delete a product by its name
  Future<void> deleteProductByName(String productName) async {
    if (productName.isEmpty) {
      throw Exception('Product name cannot be empty');
    }

    final response =
        await _client.from('products').delete().eq('name', productName);

    if (response == null) {
      throw Exception('Failed to delete product: No response from server');
    }
  }

  /// Update product details by name
  Future<void> updateProductByName(
      String productName, Map<String, dynamic> updatedFields) async {
    if (productName.isEmpty) {
      throw Exception('Product name cannot be empty');
    }

    if (updatedFields.isEmpty) {
      throw Exception('Updated fields cannot be empty');
    }

    final response = await _client
        .from('products')
        .update(updatedFields)
        .eq('name', productName);

    if (response == null) {
      throw Exception('Failed to update product: No response from server');
    }
  }

  /// Fetch all products from the database
  Future<List<Product>> fetchAllProducts() async {
    final response = await _client.from('products').select();

    if (response == null) {
      throw Exception('Failed to fetch products: No response from server');
    }

    return response.map((json) => Product.fromJson(json)).toList();
  }

  Future<List<Categories>> fetchAllCategories() async {
    final response = await _client.from('categories').select();

    if (response == null) {
      throw Exception('Failed to fetch categories: No response from server');
    }

    return response.map((json) => Categories.fromJson(json)).toList();
  }
}

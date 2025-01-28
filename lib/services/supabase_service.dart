import 'package:sabrina2025/model/product_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';


class SupabaseService {
  final SupabaseClient _client;

  SupabaseService(this._client);

  Stream<List<Product>> streamProductsByCategory(String category) {
    return _client
        .from('products')
        .stream(primaryKey: ['id'])
        .eq('category', category)
        .order('id', ascending: true)
        .map((data) => data.map((json) => Product.fromJson(json)).toList());
  }

  Future<void> addProduct(Product product) async {
    final response = await _client.from('products').insert({
      'name': product.name,
      'description': product.description,
      'image_url': product.imageUrl,
      'price': product.price,
      'category_id': product.categoryId,
    });

    if (response.error != null) {
      throw Exception('Error adding product: ${response.error!.message}');
    }
  }

  Future<void> deleteProductByName(String productName) async {
    final response = await _client
        .from('products')
        .delete()
        .eq('name', productName);

    if (response.error != null) {
      throw Exception('Error deleting product: ${response.error!.message}');
    }
  }

  Future<void> updateProductByName(
      String productName, Map<String, dynamic> updatedFields) async {
    final response = await _client
        .from('products')
        .update(updatedFields)
        .eq('name', productName);

    if (response.error != null) {
      throw Exception('Error updating product: ${response.error!.message}');
    }
  }
}
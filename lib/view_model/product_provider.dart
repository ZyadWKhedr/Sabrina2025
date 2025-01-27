import 'package:flutter/material.dart';
import 'package:sabrina2025/model/product_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class ProductProvider with ChangeNotifier {
  final SupabaseClient supabaseClient;
  List<Product> _products = [];

  ProductProvider({required this.supabaseClient});

  List<Product> get products => _products;

  Stream<List<Product>> fetchProductsByCategory(String category) {
    // Using stream to listen for changes in the 'products' table filtered by category
    final stream = supabaseClient
        .from('products') // Target the 'products' table
        .stream(primaryKey: [
          'id'
        ]) // Primary key for each product, assuming 'id' is unique
        .eq('category', category) // Filter by category
        .order('id', ascending: true) // Optional: Order by product id
        .map((List<Map<String, dynamic>> data) {
          // Map stream data to the Product model
          return data
              .map((productJson) => Product.fromJson(productJson))
              .toList();
        });

    return stream; // Return the stream of products
  }

  Future<void> addProduct(Product product) async {
    try {
      final response = await Supabase.instance.client
          .from('products') // Specify the table name
          .insert({
        'name': product.name,
        'description': product.description,
        'image_url': product.imageUrl, // Use the correct column name
        'price': product.price,
        'category_id': product
            .categoryId, // Make sure 'category_id' matches your table column
      });

      if (response.error != null) {
        print('Error adding product: ${response.error!.message}');
      } else {
        print('Product added successfully!');
        // Optionally refresh the product list or perform other actions
        notifyListeners();
      }
    } catch (e) {
      print('Unexpected error: $e');
    }
  }

  Future<void> deleteProductByName(String productName) async {
    try {
      final response = await Supabase.instance.client
          .from('products') // Specify the table
          .delete() // Perform delete operation
          .eq('name', productName); // filter by name

      // Check if the delete operation was successful
      if (response.error != null) {
        print('Error deleting product: ${response.error!.message}');
      } else {
        print('Product deleted successfully!');
        notifyListeners();
      }
    } catch (e) {
      // Handle unexpected errors
      print('Unexpected error: $e');
    }
  }

  Future<void> updateProductByName(
      String productName, Map<String, dynamic> updatedFields) async {
    try {
      final response = await Supabase.instance.client
              .from('products') // Specify the table
              .update(updatedFields) // Provide the updated fields
              .eq('name', productName) // Filter by name
          ;

      // Check if the update operation was successful
      if (response.error != null) {
        print('Error updating product: ${response.error!.message}');
      } else {
        print('Product updated successfully!');
        // Optionally, refresh the product list or perform other actions
        notifyListeners();
      }
    } catch (e) {
      // Handle unexpected errors
      print('Unexpected error: $e');
    }
  }
}

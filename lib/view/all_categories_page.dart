import 'package:flutter/material.dart';
import 'package:sabrina2025/core/constants/app_colors.dart';
import 'package:sabrina2025/model/categories_model.dart';

class AllCategoriesPage extends StatelessWidget {
  const AllCategoriesPage({super.key, required this.categories});

  final List<Categories> categories;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('All Categories')),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 10), // Optional spacing
            categories.isNotEmpty
                ? GridView.builder(
                    shrinkWrap: true,
                    physics:
                        const NeverScrollableScrollPhysics(), // Disable internal scrolling
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2, // Set 2 columns for better layout
                      crossAxisSpacing: 8.0,
                      mainAxisSpacing: 8.0,
                      childAspectRatio: 2.5,
                    ),
                    itemCount: categories.length,
                    itemBuilder: (context, index) {
                      final category = categories[index];
                      return Padding(
                        padding: const EdgeInsets.all(6.0),
                        child: Container(
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: AppColors.iconColor,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Text(
                            category.name,
                            style: const TextStyle(color: Colors.white),
                          ),
                        ),
                      );
                    },
                  )
                : const Center(child: Text('No categories available')),
            const SizedBox(height: 20), // Optional spacing
          ],
        ),
      ),
    );
  }
}

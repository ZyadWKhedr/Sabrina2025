import 'package:flutter/material.dart';
import 'package:sabrina2025/core/app/custom_text.dart';
import 'package:sabrina2025/core/constants/app_colors.dart';
import 'package:sabrina2025/core/constants/dimensions.dart';

class CategoriesGrid extends StatelessWidget {
  final List<String> categories = [
    'Bakery',
    'Desserts',
    'Savory',
    'Ice Coffee',
    'Frappe',
    'Matcha'
  ];

  CategoriesGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return categories.isNotEmpty
        ? GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 8.0,
              mainAxisSpacing: 5.0,
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
                    child: CustomText(
                      text: category,
                      color: Colors.white,
                      fontSize: Dimensions.font20 / 1.2,
                    )),
              );
            },
          )
        : const Center(child: Text('No categories available'));
  }
}

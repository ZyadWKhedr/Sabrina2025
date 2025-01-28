import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart'; // Importing provider to use ProductViewModel
import 'package:sabrina2025/core/app/custom_navigation_bar.dart';
import 'package:sabrina2025/core/app/custom_text.dart';
import 'package:sabrina2025/core/constants/app_colors.dart';
import 'package:sabrina2025/core/constants/dimensions.dart';
import 'package:sabrina2025/view/home/widgets/custom_carousel.dart';
import 'package:sabrina2025/view_model/product_view_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    const HomeContent(),
    Center(child: Text('Cart Page')), // Placeholder for Cart Page
    Center(child: Text('Favourites Page')), // Placeholder for Favourites Page
    Center(child: Text('Profile Page')), // Placeholder for Profile Page
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex], // Display the current page
      bottomNavigationBar: CustomNavigationBar(
        currentIndex: _currentIndex,
        onTabChange: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}

class HomeContent extends StatefulWidget {
  const HomeContent({super.key});

  @override
  _HomeContentState createState() => _HomeContentState();
}

class _HomeContentState extends State<HomeContent> {
  @override
  void initState() {
    super.initState();

    // Fetch all products when the widget is first created
    final productViewModel =
        Provider.of<ProductViewModel>(context, listen: false);
    productViewModel.fetchAllProducts();
  }

  @override
  Widget build(BuildContext context) {
    final productViewModel = Provider.of<ProductViewModel>(context);

    if (productViewModel.isLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    if (productViewModel.errorMessage.isNotEmpty) {
      return Center(child: Text('Error: ${productViewModel.errorMessage}'));
    }

    return Column(
      children: [
        CustomText(text: 'Location', fontSize: Dimensions.font20 * 0.7),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(FontAwesomeIcons.locationDot,
                size: Dimensions.iconSize24 * 0.8, color: AppColors.mainColor),
            SizedBox(width: Dimensions.width10),
            CustomText(
                text: 'Moharem Bek, Alexandria',
                color: AppColors.iconColor,
                fontSize: Dimensions.font20 * 0.7),
          ],
        ),
        SizedBox(height: Dimensions.height50),
        CustomCarousel(),
        SizedBox(height: Dimensions.height20),
        productViewModel.products.isNotEmpty
            ? ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: productViewModel.products.length,
                itemBuilder: (context, index) {
                  final product = productViewModel.products[index];
                  return ListTile(
                    title: Text(product.name),
                    subtitle: Text(product.description),
                    leading: Image.network(
                        product.imageUrl), // Display product image
                    trailing: Text(
                        '\$${product.price.toString()}'), // Display product price
                  );
                },
              )
            : const Center(child: Text('No products available')),
      ],
    );
  }
}

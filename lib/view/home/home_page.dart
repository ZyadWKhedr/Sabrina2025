import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sabrina2025/core/app/custom_navigation_bar.dart';
import 'package:sabrina2025/core/app/custom_text.dart';
import 'package:sabrina2025/core/constants/app_colors.dart';
import 'package:sabrina2025/core/constants/dimensions.dart';
import 'package:sabrina2025/view/home/widgets/custom_carousel.dart';

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

class HomeContent extends StatelessWidget {
  const HomeContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomText(
              text: 'Location',
              fontSize: Dimensions.font20 * 0.7,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  FontAwesomeIcons.locationDot,
                  size: Dimensions.iconSize24 * 0.8,
                  color: AppColors.mainColor,
                ),
                SizedBox(
                  width: Dimensions.width10,
                ),
                CustomText(
                  text: 'Moharem Bek, Alexandria',
                  color: AppColors.iconColor,
                  fontSize: Dimensions.font20 * 0.7,
                ),
              ],
            ),
            SizedBox(
              height: Dimensions.height50,
            ),
            CustomCarousel()
          ],
        ),
      ],
    );
  }
}

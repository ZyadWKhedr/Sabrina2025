import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:sabrina2025/core/constants/app_colors.dart';
import 'package:sabrina2025/core/constants/dimensions.dart';

class CustomNavigationBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTabChange;

  const CustomNavigationBar({
    required this.currentIndex,
    required this.onTabChange,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Padding(
      padding: const EdgeInsets.only(bottom: 40, left: 10, right: 10),
      child: Container(
        padding: EdgeInsets.symmetric(
            horizontal: screenWidth * 0.01, vertical: screenHeight * 0.015),
        decoration: BoxDecoration(
          color: AppColors.mainColor,
          borderRadius: BorderRadius.circular(30),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.shade300,
              spreadRadius: 2,
              blurRadius: 4,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: GNav(
            haptic: true,
            tabBorderRadius: 20,
            curve: Curves.easeInOut,
            duration: const Duration(milliseconds: 300),
            gap: screenWidth * 0.02,
            color: Colors.black,
            iconSize: screenWidth * 0.06,
            tabBackgroundColor: Colors.white38,
            padding: EdgeInsets.symmetric(
              horizontal: screenWidth * 0.05,
              vertical: screenHeight * 0.012,
            ),
            onTabChange: onTabChange,
            selectedIndex: currentIndex,
            tabs: [
              GButton(
                icon: FontAwesomeIcons.house,
                text: 'Home',
                iconColor: AppColors.iconColor,
                textStyle: TextStyle(
                  fontSize: Dimensions.font20 / 1.5,
                  color: AppColors.iconColor,
                ),
              ),
              GButton(
                icon: FontAwesomeIcons.cartShopping,
                text: 'Cart',
                iconColor: AppColors.iconColor,
                textStyle: TextStyle(
                  fontSize: Dimensions.font20 / 1.5,
                  color: AppColors.iconColor,
                ),
              ),
              GButton(
                icon: FontAwesomeIcons.heart,
                text: 'Favourites',
                iconColor: AppColors.iconColor,
                textStyle: TextStyle(
                  fontSize: Dimensions.font20 / 1.5,
                  color: AppColors.iconColor,
                ),
              ),
              GButton(
                icon: CupertinoIcons.person_fill,
                text: 'Profile',
                iconColor: AppColors.iconColor,
                textStyle: TextStyle(
                  fontSize: Dimensions.font20 / 1.5,
                  color: AppColors.iconColor,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

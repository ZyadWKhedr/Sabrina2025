import 'package:flutter/material.dart';
import 'package:sabrina2025/core/app/custom_navigation_bar.dart';
import 'package:sabrina2025/core/constants/app_colors.dart';
import 'package:sabrina2025/core/constants/dimensions.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;
  // This will track the selected tab
  final List<Widget> _pages = [
    const HomeContent(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CustomNavigationBar(
          currentIndex: _currentIndex,
          onTabChange: (index) {
            setState(() {
              _currentIndex = index;
            });
          }),
    );
  }
}

class HomeContent extends StatelessWidget {
  const HomeContent({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

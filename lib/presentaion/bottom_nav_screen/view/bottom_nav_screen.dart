import 'package:flutter/material.dart';
import 'package:kistler/core/constants.dart/color.dart';
import 'package:kistler/global_widgets/custom_app_bar.dart';
import 'package:kistler/presentaion/profile_screen/view/profile_screen.dart';

import '../../../global_widgets/Drawer.dart';
import '../../../global_widgets/custom_bottom_navigation.dart';
import '../../custom_made_solution_screen/view/custom_made_solution_screen.dart';
import '../../home_screen/view/home_screen.dart';
import '../../categories_screen/view/categories_screen.dart';

class BottomNavScreen extends StatefulWidget {
  const BottomNavScreen({super.key});

  @override
  State<BottomNavScreen> createState() => _BottomNavScreenState();
}

class _BottomNavScreenState extends State<BottomNavScreen> {
  int _currentIndex = 1;

  final List<Widget> _screens = [
    ProfilScreen(),
    HomeScreen(),
    CustomMadeSolutionScreen(),
    CategoriesScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: CustomDrawer(),
      appBar: CustomAppBar(),
      body: _screens[_currentIndex],
      bottomNavigationBar: CustomBottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}

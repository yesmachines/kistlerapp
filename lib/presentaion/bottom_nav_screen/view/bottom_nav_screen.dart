import 'package:flutter/material.dart';
import 'package:kistler/core/constants.dart/color.dart';

import '../../../global_widgets/custom_bottom_navigation/custom_bottom_navigation.dart';
import '../../custom_made_solution_screen/view/custom_made_solution_screen.dart';
import '../../home_screen/view/home_screen.dart';

class BottomNavScreen extends StatefulWidget {
  const BottomNavScreen({super.key});

  @override
  State<BottomNavScreen> createState() => _BottomNavScreenState();
}

class _BottomNavScreenState extends State<BottomNavScreen> {
  int _currentIndex = 0;

  final List<Widget> _screens = [
    HomeScreen(),
    CustomMadeSolutionScreen(),
    ScreenThree(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: colorConstant.kistlerWhite,
        leading: Icon(
          Icons.menu,
          color: colorConstant.kistlerBrandGreen,
        ),
        actions: [
          Container(
              height: 20,
              width: 160,
              child: Image.asset("assets/images/logo.png")),
          SizedBox(
            width: 15,
          )
        ],
      ),
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

class ScreenThree extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        onPressed: () {},
        child: Text('Screen 3'),
      ),
    );
  }
}

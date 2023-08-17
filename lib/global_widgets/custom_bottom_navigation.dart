import 'package:flutter/material.dart';
import 'package:kistler/core/constants.dart/color.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  CustomBottomNavigationBar({required this.currentIndex, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Container(
        height: 50,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(.4),
              blurRadius: 10,
              offset: Offset(1, 3),
            ),
          ],
          borderRadius: BorderRadius.circular(22),
          color: ColorConstant.kistlerWhite,
        ),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              BottomNavItem(
                my_icon: Icons.person,
                isSelected: currentIndex == 0,
                onTap: () => onTap(0),
              ),
              BottomNavItem(
                my_icon: Icons.home,
                isSelected: currentIndex == 1,
                onTap: () => onTap(1),
              ),
              BottomNavItem(
                my_icon: Icons.settings_suggest,
                isSelected: currentIndex == 2,
                onTap: () => onTap(2),
              ),
              BottomNavItem(
                my_icon: Icons.domain,
                isSelected: currentIndex == 3,
                onTap: () => onTap(3),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class BottomNavItem extends StatelessWidget {
  final IconData my_icon;

  final bool isSelected;
  final Function onTap;

  BottomNavItem({
    required this.my_icon,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap(),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Image.asset(
          //   my_icon,
          //   scale: isSelected ? .8 : 1,
          // )
          Icon(
            my_icon,
            color: isSelected ? ColorConstant.kistlerBrandGreen : Colors.grey,
            size: isSelected ? 30 : 25,
          ),
        ],
      ),
    );
  }
}

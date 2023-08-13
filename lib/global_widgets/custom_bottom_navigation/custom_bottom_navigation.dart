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
        height: 60,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(.1),
              blurRadius: 10,
              offset: Offset(1, 3),
            ),
          ],
          borderRadius: BorderRadius.circular(22),
          color: colorConstant.kistlerWhite,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            BottomNavItem(
              icon: Icons.home_outlined,
              label: 'Home',
              isSelected: currentIndex == 0,
              onTap: () => onTap(0),
            ),
            BottomNavItem(
              icon: Icons.settings,
              label: 'Search',
              isSelected: currentIndex == 1,
              onTap: () => onTap(1),
            ),
            BottomNavItem(
              icon: Icons.space_dashboard_outlined,
              label: 'Profile',
              isSelected: currentIndex == 2,
              onTap: () => onTap(2),
            ),
          ],
        ),
      ),
    );
  }
}

// bottomNavigationBar: Padding(
//   padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
//   child: Container(
//     height: 50,
//     width: double.infinity,

//     child: Align(
//       alignment: Alignment.center,
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           SizedBox(),
//           IconButton(
//             onPressed: () {
//               setState(() { });
//             },
//             icon: Icon(Icons.home_outlined),
//             color: colorConstant.kistlerBrandGreen,
//           ),
//           Icon(
//             Icons.settings,
//             color: Colors.grey,
//           ),
//           Icon(
//             Icons.space_dashboard_outlined,
//             color: Colors.grey,
//           ),
//           SizedBox()
//         ],
//       ),
//     ),
//   ),
// ));

class BottomNavItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final bool isSelected;
  final Function onTap;

  BottomNavItem({
    required this.icon,
    required this.label,
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
          Icon(
            icon,
            color: isSelected ? colorConstant.kistlerBrandGreen : Colors.grey,
          ),
          Text(
            label,
            style: TextStyle(
              color: isSelected ? colorConstant.kistlerBrandGreen : Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}

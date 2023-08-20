import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kistler/core/constants.dart/color.dart';
import 'package:kistler/global_widgets/custom_app_bar.dart';
import 'package:kistler/presentaion/profile_screen/view/profile_screen.dart';
import '../../../global_widgets/custom_bottom_navigation.dart';
import '../../custom_made_solution_screen/view/custom_made_solution_screen.dart';
import '../../categories_screen/view/categories_screen.dart';

class BottomNavScreen extends StatefulWidget {
  const BottomNavScreen({super.key});

  @override
  State<BottomNavScreen> createState() => _BottomNavScreenState();
}

class _BottomNavScreenState extends State<BottomNavScreen> {
  int _currentIndex = 1;

  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    Future<bool> ShowexitPopup() async {
      return await showDialog(
            context: context,
            builder: (context) => Padding(
              padding: const EdgeInsets.all(25),
              child: AlertDialog(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)),
                title: CircleAvatar(
                  radius: 24,
                  backgroundColor: ColorConstant.kistlerBrandGreen,
                  child: CircleAvatar(
                    radius: 22,
                    backgroundColor: Colors.white,
                    child: Icon(
                      Icons.question_mark_rounded,
                      size: 30,
                      color: ColorConstant.kistlerBrandGreen,
                    ),
                  ),
                ),
                content: Text(
                  'Do you want to exit ?',
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
                  textAlign: TextAlign.center,
                ),
                actions: [
                  Row(
                    children: [
                      SizedBox(
                        width: 20,
                      ),
                      Expanded(
                        child: InkWell(
                          onTap: () => Navigator.pop(context),
                          child: Container(
                            height: 40,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(
                                  color: ColorConstant.kistlerBrandGreen),
                            ),
                            child: Center(
                              child: Text(
                                "No",
                                style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                    color: ColorConstant.kistlerBrandGreen),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Expanded(
                        child: InkWell(
                          onTap: () => SystemNavigator.pop(),
                          child: Container(
                            height: 40,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: ColorConstant.kistlerBrandGreen),
                            child: Center(
                              child: Text(
                                "Yes",
                                style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.white),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  )
                ],
              ),
            ),
          ) ??
          false; //if showDialouge had returned null, then return false
    }

    List<Widget> _screens = [
      ProfilScreen(),
      CategoriesScreen(),
      CustomMadeSolutionScreen(),
      // HomeScreen(),
    ];
    print("my BN localle ${context.locale}");
    return WillPopScope(
      onWillPop: ShowexitPopup,
      child: Scaffold(
        // drawer: CustomDrawer(),
        appBar: CustomAppBar(backButtonVisibility: false),
        body: _screens[_currentIndex],
        bottomNavigationBar: CustomBottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:kistler/core/constants.dart/color.dart';
import 'package:kistler/core/image_constant/images.dart';
import 'package:kistler/presentaion/bottom_nav_screen/view/bottom_nav_screen.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(),
            Container(
                height: 150,
                width: MediaQuery.of(context).size.width * .60,
                child: Image.asset(ImageConstant.kistlerLogo)),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: Column(
                children: [
                  Text(
                    "Log in",
                    style: TextStyle(
                        fontSize: 25,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  TextField(
                    decoration: InputDecoration(
                      //  isDense: true,
                      contentPadding: EdgeInsets.all(15),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: ColorConstant.kistlerBrandGreen),
                          borderRadius: BorderRadius.circular(24)),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: ColorConstant.kistlerBrandGreen)),
                      labelText: "User ID", alignLabelWithHint: true,
                      hintText: "User ID",

                      border: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: ColorConstant.kistlerBrandGreen),
                      ),
                      //  focusedBorder: OutlineInputBorder()
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextField(
                    decoration: InputDecoration(
                      //  isDense: true,
                      contentPadding: EdgeInsets.all(15),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: ColorConstant.kistlerBrandGreen),
                          borderRadius: BorderRadius.circular(24)),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: ColorConstant.kistlerBrandGreen)),
                      labelText: "Password", alignLabelWithHint: true,
                      hintText: "Password",

                      border: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: ColorConstant.kistlerBrandGreen),
                      ),
                      //  focusedBorder: OutlineInputBorder()
                    ),
                  ),
                  SizedBox(height: 20),
                  InkWell(
                    onTap: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => BottomNavScreen(),
                        ),
                      );
                    },
                    child: Container(
                      height: 50,
                      width: 150,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: ColorConstant.kistlerBrandGreen,
                      ),
                      child: Center(
                        child: Text(
                          "Login",
                          style: TextStyle(
                              fontSize: 18,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            Column(
              children: [
                Text("You are completely safe."),
                Text(
                  " Read our Terms & Conditions.",
                  style: TextStyle(color: ColorConstant.kistlerBrandGreen),
                ),
                SizedBox(
                  height: 50,
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}

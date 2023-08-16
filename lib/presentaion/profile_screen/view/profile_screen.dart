import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kistler/core/constants.dart/color.dart';

class ProfilScreen extends StatelessWidget {
  const ProfilScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(),
          Column(
            children: [
              Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
                SizedBox(),
                Row(
                  children: [
                    Icon(
                      Icons.edit_calendar_outlined,
                      color: ColorConstant.kistlerBrandGreen,
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    CircleAvatar(
                      radius: 75,
                      backgroundColor: ColorConstant.kistlerBrandGreen,
                      child: CircleAvatar(
                        backgroundColor: ColorConstant.kistlerWhite,
                        radius: 72,
                        backgroundImage: NetworkImage(
                            "https://imgs.search.brave.com/NY3q4iDdSa0W_vEw16mKYGZk5hcoC1HeBYjN7k89hD4/rs:fit:860:0:0/g:ce/aHR0cHM6Ly9tZWRp/YS53aXJlZC5jb20v/cGhvdG9zLzY0OWM3/NjU3NjI3OWUzNjQ3/Mjg0NDY0Ni8zOjIv/d18xMjgwLGNfbGlt/aXQvRWxvbi1NdXNr/LVZpdmF0ZWNoLUJ1/c2luZXNzLTE0OTkw/MTMxMDIuanBn"),
                      ),
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Icon(
                      Icons.share,
                      color: ColorConstant.kistlerBrandGreen,
                    ),
                  ],
                ),
                SizedBox(),
              ]),
              SizedBox(
                height: 20,
              ),
              Text(
                "Felix Kistler",
                style: TextStyle(
                    fontSize: 30,
                    letterSpacing: 1,
                    fontWeight: FontWeight.w500,
                    color: ColorConstant.kistlerBrandGreen),
              ),
              Text(
                "Marketing & Sales Management",
              ),
              SizedBox(
                child: SvgPicture.asset("assets/images_svg/facebook.svg"),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.call, color: ColorConstant.kistlerBrandGreen),
                  SizedBox(
                    width: 15,
                  ),
                  Icon(Icons.message, color: ColorConstant.kistlerBrandGreen)
                ],
              ),
            ],
          ),
          Container(
              height: 50,
              width: MediaQuery.of(context).size.width * .75,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(18),
                color: ColorConstant.kistlerBrandGreen,
              ),
              child: Center(
                  child: Text(
                "LogOut",
                style: TextStyle(color: ColorConstant.kistlerWhite),
              ))),
          SizedBox()
        ],
      ),
    );
  }
}

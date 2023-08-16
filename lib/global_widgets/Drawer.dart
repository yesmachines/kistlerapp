import 'package:flutter/material.dart';
import 'package:kistler/core/constants.dart/color.dart';

class CustomDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: MediaQuery.of(context).size.width * .60,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            SizedBox(
              height: 30,
            ),
            Column(
              children: [
                CircleAvatar(
                  radius: 55,
                  backgroundColor: ColorConstant.kistlerBrandGreen,
                  child: CircleAvatar(
                    radius: 52,
                    backgroundImage: NetworkImage(
                        "https://imgs.search.brave.com/NY3q4iDdSa0W_vEw16mKYGZk5hcoC1HeBYjN7k89hD4/rs:fit:860:0:0/g:ce/aHR0cHM6Ly9tZWRp/YS53aXJlZC5jb20v/cGhvdG9zLzY0OWM3/NjU3NjI3OWUzNjQ3/Mjg0NDY0Ni8zOjIv/d18xMjgwLGNfbGlt/aXQvRWxvbi1NdXNr/LVZpdmF0ZWNoLUJ1/c2luZXNzLTE0OTkw/MTMxMDIuanBn"),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "Felix Kistler",
                  style: TextStyle(
                      color: ColorConstant.kistlerBrandGreen, fontSize: 20),
                ),
              ],
            ),
            Column(
              children: [
                ListTile(
                  leading: Icon(Icons.person),
                  title: Text('Profile'),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
                ListTile(
                  leading: Icon(Icons.settings),
                  title: Text('Custom Made Solution'),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
                ListTile(
                  leading: Icon(Icons.cut),
                  title: Text('Cutting'),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
                ListTile(
                  leading: Icon(Icons.webhook_outlined),
                  title: Text('Welding'),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
                ListTile(
                  leading: Icon(Icons.kitchen_sharp),
                  title: Text('Kistler'),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
                ListTile(
                  leading: Icon(Icons.border_all),
                  title: Text('Bode'),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
            SizedBox(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  ListTile(
                    contentPadding: EdgeInsets.zero,
                    leading: Icon(Icons.logout),
                    title: Text('LogOut'),
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                  Row(
                    children: [
                      Icon(Icons.room_rounded),
                      SizedBox(
                        width: 10,
                      ),
                      Icon(Icons.room_rounded),
                      SizedBox(
                        width: 10,
                      ),
                      Icon(Icons.room_rounded),
                      SizedBox(
                        width: 10,
                      ),
                    ],
                  )
                ],
              ),
            ),
            // SizedBox(),
          ],
        ),
      ),
    );
  }
}

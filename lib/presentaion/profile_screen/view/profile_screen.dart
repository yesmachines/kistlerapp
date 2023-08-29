import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:kistler/core/constants.dart/color.dart';
import 'package:kistler/generated/locale_keys.g.dart';
import 'package:kistler/global_widgets/profile_card.dart';
import 'package:kistler/global_widgets/common_image_view.dart';
import 'package:kistler/global_widgets/reusable_loading_widget.dart';
import 'package:kistler/presentaion/profile_screen/controller/profile_screen_controller.dart';
import 'package:kistler/presentaion/profile_screen/view/widgets/logout_confirm_popup.dart';
import 'package:kistler/presentaion/profile_update_screen/view/profile_update_screen.dart';
import 'package:provider/provider.dart';

class ProfilScreen extends StatefulWidget {
  const ProfilScreen({super.key});
  @override
  State<ProfilScreen> createState() => _ProfilScreenState();
}

class _ProfilScreenState extends State<ProfilScreen> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<ProfileScreenController>(context, listen: false)
          .getUserData(language: context.locale);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ProfileScreenController>(context);

    return Scaffold(
      body: provider.isLoading
          ? ReusableLoadingIndicator()
          : SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(),
                  Column(
                    children: [
                      SizedBox(height: 60),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            SizedBox(),
                            Row(
                              children: [
                                InkWell(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              ProfileUpdateScreen()),
                                    );
                                  },
                                  child: Icon(
                                    Icons.save_as,
                                    size: 30,
                                    color: ColorConstant.kistlerBrandGreen,
                                  ),
                                ),
                                SizedBox(
                                  width: 20,
                                ),

                                CircleAvatar(
                                  backgroundColor:
                                      ColorConstant.kistlerBrandGreen,
                                  radius: 102,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(200),
                                    child: SizedBox(
                                      height: 200,
                                      child: CommonImageView(
                                        url: provider.userData?.imageUrl,
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                  ),
                                ),
                                // CircleAvatar(
                                //   radius: 75,
                                //   backgroundColor:
                                //       ColorConstant.kistlerBrandGreen,
                                //   child: CircleAvatar(
                                //       backgroundColor:
                                //           ColorConstant.kistlerWhite,
                                //       radius: 72,
                                //       backgroundImage: NetworkImage( ??
                                //           "")), // TODO : NEED TO BE UPDATED AFTER IMAGE SETUP
                                // ),
                                SizedBox(
                                  width: 20,
                                ),
                                InkWell(
                                  onTap: () => _showProfileCard(context),
                                  child: Icon(
                                    Icons.share,
                                    size: 30,
                                    color: ColorConstant.kistlerBrandGreen,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(),
                          ]),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        provider.userData?.name ?? "N/a",
                        style: TextStyle(
                            fontSize: 23,
                            letterSpacing: 1,
                            fontWeight: FontWeight.w500,
                            color: ColorConstant.kistlerBrandGreen),
                      ),
                      Text(
                        provider.userData?.name ?? "N/a",
                        style: TextStyle(
                          fontSize: 12,
                          letterSpacing: 1,
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * .80,
                        padding: EdgeInsets.only(
                            left: 10, right: 10, top: 15, bottom: 15),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey,
                              offset: Offset(2.0, 2.0),
                              blurRadius: 4.0,
                              spreadRadius: 0.0,
                            ),
                          ],
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Icon(
                              Icons.phone,
                              color: ColorConstant.kistlerBrandGreen,
                            ),
                            SizedBox(width: 10),
                            Text(
                              provider.userData?.phone ?? "N/a",
                              style: TextStyle(
                                fontSize: 14,
                                letterSpacing: 1,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * .80,
                        padding: EdgeInsets.only(
                            left: 10, right: 10, top: 15, bottom: 15),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey,
                              offset: Offset(2.0, 2.0),
                              blurRadius: 4.0,
                              spreadRadius: 0.0,
                            ),
                          ],
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Icon(
                              Icons.mail_outline_rounded,
                              color: ColorConstant.kistlerBrandGreen,
                            ),
                            SizedBox(width: 10),
                            SizedBox(
                              width: MediaQuery.of(context).size.width * .60,
                              child: Text(
                                provider.userData?.email ?? "N/a",
                                style: TextStyle(
                                  fontSize: 12,
                                  letterSpacing: 1,
                                  fontWeight: FontWeight.w500,
                                ),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: 30),
                  Container(
                    height: 200,
                    width: 200,
                    color: ColorConstant.kistlerBrandGreen,
                    child: Image.asset(
                      "assets/images/QR1.png",
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(height: 40),
                  InkWell(
                    onTap: () {
                      logoutConfirmPopup(context: context);
                    },
                    child: Container(
                        height: 50,
                        width: MediaQuery.of(context).size.width * .50,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(18),
                          color: ColorConstant.kistlerBrandGreen,
                        ),
                        child: Center(
                            child: Text(
                          LocaleKeys.logout.tr(),
                          style: TextStyle(color: ColorConstant.kistlerWhite),
                        ))),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                ],
              ),
            ),
    );
  }

  void _showProfileCard(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) {
        return Center(
          child: Container(
            padding: EdgeInsets.all(5),
            child: ProfileCard(),
          ),
        );
      },
    );
  }
}

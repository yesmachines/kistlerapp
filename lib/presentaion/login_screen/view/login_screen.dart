import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:kistler/core/app_utils/app_utils.dart';
import 'package:kistler/core/constants.dart/color.dart';
import 'package:kistler/core/image_constant/images.dart';
import 'package:kistler/generated/locale_keys.g.dart';
import 'package:kistler/global_widgets/reusable_loading_widget.dart';
import 'package:kistler/presentaion/bottom_nav_screen/view/bottom_nav_screen.dart';
import 'package:kistler/presentaion/login_screen/controller/login_screen_controller.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _emailController = TextEditingController();
  final _passController = TextEditingController();
  final _loginFormKey = GlobalKey<FormState>();
  bool _isPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<LoginScreenController>(context);

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Center(
            child: Form(
              key: _loginFormKey,
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
                          LocaleKeys.Log_in.tr(),
                          style: TextStyle(
                              fontSize: 20,
                              color: Colors.black,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 25,
                        ),
                        TextFormField(
                          textCapitalization: TextCapitalization.none,
                          controller: _emailController,
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
                            labelText: LocaleKeys.user_id.tr(),
                            labelStyle: TextStyle(
                                color: ColorConstant.kistlerBrandBorder),
                            focusColor: ColorConstant.kistlerBrandGreen,
                            alignLabelWithHint: true,
                            hintText: LocaleKeys.user_id.tr(),

                            border: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: ColorConstant.kistlerBrandGreen),
                            ),
                            //  focusedBorder: OutlineInputBorder()
                          ),
                          validator: (value) {
                            if (value != null && value.contains("@")) {
                              return null;
                            } else {
                              return LocaleKeys.Enter_a_valid_email_address
                                  .tr();
                            }
                          },
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          obscureText: !_isPasswordVisible,
                          controller: _passController,
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
                            labelText: LocaleKeys.password.tr(),
                            labelStyle: TextStyle(
                                color: ColorConstant.kistlerBrandBorder),
                            alignLabelWithHint: true,
                            hintText: LocaleKeys.password.tr(),
                            focusColor: ColorConstant.kistlerBrandGreen,
                            suffixIcon: IconButton(
                              icon: Icon(
                                _isPasswordVisible
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                                color: ColorConstant.kistlerBrandGreen,
                              ),
                              onPressed: () {
                                setState(() {
                                  _isPasswordVisible = !_isPasswordVisible;
                                });
                              },
                            ),

                            border: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: ColorConstant.kistlerBrandGreen),
                            ),

                            //  focusedBorder: OutlineInputBorder()
                          ),
                          validator: (value) {
                            if (value != null &&
                                value.isNotEmpty &&
                                value.length >= 8) {
                              return null;
                            } else {
                              return LocaleKeys
                                  .password_must_contain_8_character
                                  .tr();
                            }
                          },
                        ),
                        SizedBox(height: 20),
                        provider.isLoading
                            ? Center(child: ReusableLoadingIndicator())
                            : InkWell(
                                onTap: () {
                                  if (_loginFormKey.currentState!.validate()) {
                                    Provider.of<LoginScreenController>(context,
                                            listen: false)
                                        .onLogin(
                                      email: _emailController.text.trim(),
                                      password: _passController.text.trim(),
                                      language: context.locale,
                                    )
                                        .then((value) {
                                      if (value) {
                                        Navigator.pushAndRemoveUntil(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                BottomNavScreen(),
                                          ),
                                          (route) => false,
                                        );
                                      } else {
                                        AppUtils.oneTimeSnackBar(
                                            LocaleKeys.login_failed_try_again
                                                .tr(),
                                            context: context);
                                      }
                                    });
                                  }
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
                                      LocaleKeys.Log_in.tr(),
                                      style: TextStyle(
                                          fontSize: 14,
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
                      Text(
                        LocaleKeys.safe1.tr(),
                      ),
                      InkWell(
                        onTap: () => termsAndConditionSheet(context),
                        child: Text(
                          LocaleKeys.safe2.tr(),
                          style: TextStyle(
                              color: ColorConstant.kistlerBrandGreen,
                              fontSize: 13),
                        ),
                      ),
                      SizedBox(
                        height: 50,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<dynamic> termsAndConditionSheet(BuildContext context) {
    return showModalBottomSheet(
        isScrollControlled: true,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(16))),
        context: context,
        builder: (context) => Padding(
              padding: const EdgeInsets.only(top: 30),
              child: Container(
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(15)),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 30,
                        ),
                        HtmlWidget(
                          LocaleKeys.privacy_heading.tr(),
                          textStyle: TextStyle(
                              height: 1.5,
                              color: ColorConstant.kistlerBrandGreen,
                              fontWeight: FontWeight.bold,
                              fontSize: 16),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        HtmlWidget(
                          LocaleKeys.privacy_start_content_1.tr(),
                          textStyle: TextStyle(
                              height: 1.5,
                              color: ColorConstant.kistlerTextBlack,
                              fontSize: 12),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        HtmlWidget(
                          LocaleKeys.privacy_start_content_2.tr(),
                          textStyle: TextStyle(
                              height: 1.5,
                              color: ColorConstant.kistlerTextBlack,
                              fontSize: 12),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        HtmlWidget(
                          LocaleKeys.privacy_start_content_3.tr(),
                          textStyle: TextStyle(
                              height: 1.5,
                              color: ColorConstant.kistlerTextBlack,
                              fontSize: 12),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        HtmlWidget(
                          LocaleKeys.privacy_point_1.tr(),
                          textStyle: TextStyle(
                              height: 1.5,
                              color: ColorConstant.kistlerTextBlack,
                              fontSize: 12),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        HtmlWidget(
                          LocaleKeys.privacy_point_2.tr(),
                          textStyle: TextStyle(
                              height: 1.5,
                              color: ColorConstant.kistlerTextBlack,
                              fontSize: 12),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        HtmlWidget(
                          LocaleKeys.privacy_point_3.tr(),
                          textStyle: TextStyle(
                              height: 1.5,
                              color: ColorConstant.kistlerTextBlack,
                              fontSize: 12),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        HtmlWidget(
                          LocaleKeys.privacy_point_4.tr(),
                          textStyle: TextStyle(
                              height: 1.5,
                              color: ColorConstant.kistlerTextBlack,
                              fontSize: 12),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        HtmlWidget(
                          LocaleKeys.privacy_point_5.tr(),
                          textStyle: TextStyle(
                              height: 1.5,
                              color: ColorConstant.kistlerTextBlack,
                              fontSize: 12),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        HtmlWidget(
                          LocaleKeys.privacy_point_6.tr(),
                          textStyle: TextStyle(
                              height: 1.5,
                              color: ColorConstant.kistlerTextBlack,
                              fontSize: 12),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        HtmlWidget(
                          LocaleKeys.privacy_point_7.tr(),
                          textStyle: TextStyle(
                              height: 1.5,
                              color: ColorConstant.kistlerTextBlack,
                              fontSize: 12),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        HtmlWidget(
                          LocaleKeys.privacy_point_8.tr(),
                          textStyle: TextStyle(
                              height: 1.5,
                              color: ColorConstant.kistlerTextBlack,
                              fontSize: 12),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        HtmlWidget(
                          LocaleKeys.privacy_point_9.tr(),
                          textStyle: TextStyle(
                              height: 1.5,
                              color: ColorConstant.kistlerTextBlack,
                              fontSize: 12),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        HtmlWidget(
                          LocaleKeys.privacy_point_10.tr(),
                          textStyle: TextStyle(
                              height: 1.5,
                              color: ColorConstant.kistlerTextBlack,
                              fontSize: 12),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        HtmlWidget(
                          LocaleKeys.privacy_point_11.tr(),
                          textStyle: TextStyle(
                              height: 1.5,
                              color: ColorConstant.kistlerTextBlack,
                              fontSize: 12),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        HtmlWidget(
                          LocaleKeys.privacy_point_12.tr(),
                          textStyle: TextStyle(
                              height: 1.5,
                              color: ColorConstant.kistlerTextBlack,
                              fontSize: 12),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        HtmlWidget(
                          LocaleKeys.privacy_point_13.tr(),
                          textStyle: TextStyle(
                              height: 1.5,
                              color: ColorConstant.kistlerTextBlack,
                              fontSize: 12),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        HtmlWidget(
                          LocaleKeys.privacy_point_14.tr(),
                          textStyle: TextStyle(
                              color: ColorConstant.kistlerTextBlack,
                              fontSize: 12),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        HtmlWidget(
                          LocaleKeys.terms_1.tr(),
                          textStyle: TextStyle(
                              height: 1.5,
                              color: ColorConstant.kistlerTextBlack,
                              fontSize: 12),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        HtmlWidget(
                          LocaleKeys.terms_2.tr(),
                          textStyle: TextStyle(
                              height: 1.5,
                              color: ColorConstant.kistlerTextBlack,
                              fontSize: 12),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        HtmlWidget(
                          LocaleKeys.terms_3.tr(),
                          textStyle: TextStyle(
                              color: ColorConstant.kistlerTextBlack,
                              fontSize: 12),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        HtmlWidget(
                          LocaleKeys.terms_4.tr(),
                          textStyle: TextStyle(
                              height: 1.5,
                              color: ColorConstant.kistlerTextBlack,
                              fontSize: 12),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        HtmlWidget(
                          LocaleKeys.terms_5.tr(),
                          textStyle: TextStyle(
                              height: 1.5,
                              color: ColorConstant.kistlerTextBlack,
                              fontSize: 12),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        HtmlWidget(
                          LocaleKeys.terms_6.tr(),
                          textStyle: TextStyle(
                              height: 1.5,
                              color: ColorConstant.kistlerTextBlack,
                              fontSize: 12),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        HtmlWidget(
                          LocaleKeys.terms_7.tr(),
                          textStyle: TextStyle(
                              height: 1.5,
                              color: ColorConstant.kistlerTextBlack,
                              fontSize: 12),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ));
  }
}

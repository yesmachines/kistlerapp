import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:kistler/core/app_utils/app_utils.dart';
import 'package:kistler/core/constants.dart/color.dart';
import 'package:kistler/generated/locale_keys.g.dart';
import 'package:kistler/global_widgets/custom_app_bar.dart';
import 'package:kistler/global_widgets/reusable_loading_widget.dart';
import 'package:kistler/global_widgets/textfield_refactor.dart';
import 'package:kistler/presentaion/profile_screen/controller/profile_screen_controller.dart';
import 'package:kistler/presentaion/profile_screen/view/profile_screen.dart';
import 'package:kistler/presentaion/profile_update_screen/controller/profile_update_screen_controller.dart';
import 'package:provider/provider.dart';

class ProfileUpdateScreen extends StatefulWidget {
  const ProfileUpdateScreen({super.key});

  @override
  State<ProfileUpdateScreen> createState() => _ProfileUpdateScreenState();
}

class _ProfileUpdateScreenState extends State<ProfileUpdateScreen> {
  TextEditingController _firstNameController = TextEditingController();
  TextEditingController _midddleNameController = TextEditingController();
  TextEditingController _lastNameController = TextEditingController();
  TextEditingController _designationNameController = TextEditingController();
  TextEditingController _contactNumberController = TextEditingController();
  TextEditingController _emailAddressController = TextEditingController();
  TextEditingController _userIdController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  bool _isPasswordVisible = false;

  final userIdFormKey = GlobalKey<FormState>();
  final passwordFormKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _firstNameController.dispose();
    _midddleNameController.dispose();
    _lastNameController.dispose();
    _designationNameController.dispose();
    _contactNumberController.dispose();
    _emailAddressController.dispose();
    _userIdController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  final picker = ImagePicker();

  void _showBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              ListTile(
                leading: Icon(Icons.camera),
                title: Text('Camera'),
                onTap: () async {},
              ),
              ListTile(
                leading: Icon(Icons.photo),
                title: Text('Gallery'),
                onTap: () async {},
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ProfileUpdateScreenController>(context);
    return Scaffold(
      appBar: CustomAppBar(),
      body: SingleChildScrollView(
        child: Column(children: [
          SizedBox(
            height: 50,
          ),
          InkWell(
            onTap: () {
              _showBottomSheet(context);
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 60,
                  backgroundColor: ColorConstant.kistlerBrandGreen,
                  child: CircleAvatar(
                    radius: 58,
                    backgroundImage: AssetImage("assets/images/dp.png"),
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Icon(Icons.add_photo_alternate,
                    color: ColorConstant.kistlerBrandGreen),
                SizedBox(
                  width: 10,
                ),
                Text(
                  LocaleKeys.change_dp.tr(),
                  style: TextStyle(
                    color: ColorConstant.kistlerBrandGreen,
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Row(
              children: [
                SizedBox(
                  width: 120,
                  child: Text(
                    LocaleKeys.First_Name.tr(),
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(width: 15),
                Expanded(
                  child: TextfieldRefactor(
                      controller: _firstNameController, name: "", length: 1),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Row(
              children: [
                SizedBox(
                  width: 120,
                  child: Text(
                    LocaleKeys.Middle_Name.tr(),
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(width: 15),
                Expanded(
                  child: TextfieldRefactor(
                      controller: _midddleNameController, name: "", length: 1),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Row(
              children: [
                SizedBox(
                  width: 120,
                  child: Text(
                    LocaleKeys.Last_Name.tr(),
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(width: 15),
                Expanded(
                  child: TextfieldRefactor(
                      controller: _lastNameController, name: "", length: 1),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Row(
              children: [
                SizedBox(
                  width: 120,
                  child: Text(
                    LocaleKeys.Designation.tr(),
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(width: 15),
                Expanded(
                  child: TextfieldRefactor(
                      controller: _designationNameController,
                      name: "",
                      length: 2),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Row(
              children: [
                SizedBox(
                  width: 120,
                  child: Text(
                    LocaleKeys.contact_number.tr(),
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(width: 15),
                Expanded(
                  child: TextfieldRefactor(
                      controller: _contactNumberController,
                      name: "",
                      length: 1),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Row(
              children: [
                SizedBox(
                  width: 120,
                  child: Text(
                    LocaleKeys.email_address.tr(),
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(width: 15),
                Expanded(
                  child: TextfieldRefactor(
                      controller: _emailAddressController, name: "", length: 1),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Text(
            LocaleKeys.Account_Details.tr(),
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 30,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Row(
              children: [
                SizedBox(
                  width: 120,
                  child: Text(
                    LocaleKeys.user_id.tr(),
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(width: 15),
                Expanded(
                  child: TextfieldRefactor(
                    formKey: userIdFormKey,
                    controller: _userIdController,
                    name: "",
                    length: 1,
                    validator: (value) {
                      if (value != null && value.isNotEmpty) {
                        return null;
                      } else {
                        return "Enter a valid data";
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Row(
              children: [
                SizedBox(
                  width: 120,
                  child: Text(
                    LocaleKeys.password.tr(),
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(width: 15),
                Expanded(
                  child: Form(
                    key: passwordFormKey,
                    child: TextFormField(
                      controller: _passwordController,
                      obscureText: !_isPasswordVisible,
                      decoration: InputDecoration(
                        //  isDense: true,
                        contentPadding: EdgeInsets.all(15),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: ColorConstant.kistlerBrandGreen),
                        ),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: ColorConstant.kistlerBrandGreen)),

                        labelStyle:
                            TextStyle(color: ColorConstant.kistlerBrandBorder),
                        alignLabelWithHint: true,

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
                            value.length > 8) {
                          return null;
                        } else {
                          return "Invalid passwoed";
                        }
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          InkWell(
            onTap: () {},
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Container(
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: ColorConstant.kistlerBrandGreen.withOpacity(.09),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.qr_code_2_outlined),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      LocaleKeys.QR.tr(),
                    ),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          provider.isLoading
              ? ReusableLoadingIndicator()
              : InkWell(
                  onTap: () {
                    //validating input fields
                    if (userIdFormKey.currentState!.validate() &&
                        passwordFormKey.currentState!.validate()) {
                      //calling api to update profile data
                      Provider.of<ProfileUpdateScreenController>(context,
                              listen: false)
                          .onProfileUpdate(language: context.locale)
                          .then((value) {
                        if (value) {
                          AppUtils.oneTimeSnackBar(
                              "Profile updated successfully",
                              context: context,
                              bgColor: ColorConstant.kistlerBrandGreen);
                          // calling api to update user  data on profile screen
                          Provider.of<ProfileScreenController>(context,
                                  listen: false)
                              .getUserData(language: context.locale);
                          Navigator.pop(context);
                        } else {
                          // showing error message if failed to update data
                          AppUtils.oneTimeSnackBar(provider.errorMessage,
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
                      border:
                          Border.all(color: ColorConstant.kistlerBrandGreen),
                      color: ColorConstant.kistlerBrandGreen,
                    ),
                    child: Center(
                      child: Text(
                        LocaleKeys.Update.tr(),
                        style: TextStyle(
                            fontSize: 14,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
          SizedBox(
            height: 50,
          ),
        ]),
      ),
    );
  }
}

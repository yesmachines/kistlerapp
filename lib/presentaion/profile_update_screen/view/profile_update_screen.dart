import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:kistler/core/app_utils/app_utils.dart';
import 'package:kistler/core/constants.dart/color.dart';
import 'package:kistler/core/image_constant/images.dart';
import 'package:kistler/generated/locale_keys.g.dart';
import 'package:kistler/global_widgets/custom_app_bar.dart';
import 'package:kistler/global_widgets/custom_password_text_field.dart';
import 'package:kistler/global_widgets/reusable_loading_widget.dart';
import 'package:kistler/global_widgets/textfield_refactor.dart';
import 'package:kistler/presentaion/profile_screen/controller/profile_screen_controller.dart';
import 'package:kistler/presentaion/profile_update_screen/controller/profile_update_screen_controller.dart';
import 'package:provider/provider.dart';

class ProfileUpdateScreen extends StatefulWidget {
  const ProfileUpdateScreen({super.key});

  @override
  State<ProfileUpdateScreen> createState() => _ProfileUpdateScreenState();
}

class _ProfileUpdateScreenState extends State<ProfileUpdateScreen> {
  TextEditingController _fullNameController = TextEditingController();
  TextEditingController _designationNameController = TextEditingController();
  TextEditingController _contactNumberController = TextEditingController();
  TextEditingController _emailAddressController = TextEditingController();
  TextEditingController _PassController = TextEditingController();
  TextEditingController _cnfrmPasswordController = TextEditingController();
  TextEditingController _linkedinController = TextEditingController();
  @override
  void initState() {
    final profileData =
        Provider.of<ProfileScreenController>(context, listen: false);

    _designationNameController.text = profileData.userData?.designation ?? "";
    _fullNameController.text = profileData.userData?.name ?? "";
    _contactNumberController.text = profileData.userData?.phone ?? "";
    _emailAddressController.text = profileData.userData?.email ?? "";
    _linkedinController.text = profileData.userData?.linkedin ?? "";
    super.initState();
  }

  final passFormKey = GlobalKey<FormState>();
  final cnfrmPasswordFormKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _fullNameController.dispose();
    _designationNameController.dispose();
    _contactNumberController.dispose();
    _emailAddressController.dispose();
    _PassController.dispose();
    _cnfrmPasswordController.dispose();
    _linkedinController.dispose();

    super.dispose();
  }

  final picker = ImagePicker();

  void _showBottomSheet(BuildContext ctx) {
    showModalBottomSheet(
      context: ctx,
      builder: (BuildContext ctx) {
        return Container(
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              ListTile(
                leading: Icon(Icons.camera),
                title: Text(LocaleKeys.camera.tr()),
                onTap: () {
                  Provider.of<ProfileUpdateScreenController>(context,
                          listen: false)
                      .selectProfileImge(
                          source: ImageSource.camera, context: context);

                  Navigator.pop(ctx);
                },
              ),
              ListTile(
                leading: Icon(Icons.photo),
                title: Text(LocaleKeys.gallery.tr()),
                onTap: () {
                  Provider.of<ProfileUpdateScreenController>(context,
                          listen: false)
                      .selectProfileImge(
                          source: ImageSource.gallery, context: context);

                  Navigator.pop(ctx);
                },
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final profileData =
        Provider.of<ProfileScreenController>(context, listen: false);

    // _designationNameController.text = profileData.userData?.designation ?? "";
    // _fullNameController.text = profileData.userData?.name ?? "";
    // _contactNumberController.text = profileData.userData?.phone ?? "";
    // _emailAddressController.text = profileData.userData?.email ?? "";
    // _linkedinController.text = profileData.userData?.linkedin ?? "";
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
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  CircleAvatar(
                    radius: 60,
                    backgroundColor: ColorConstant.kistlerBrandGreen,
                    child: CircleAvatar(
                      backgroundColor: ColorConstant.kistlerWhite,
                      radius: 58,
                      backgroundImage: provider.profileImgeFile == null
                          ? (profileData.userData?.imageUrl == null
                              ? AssetImage(ImageConstant.dpDummy)
                              : NetworkImage(profileData.userData!.imageUrl!)
                                  as ImageProvider)
                          : FileImage(provider.profileImgeFile!),
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
                    LocaleKeys.full_name.tr(),
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(width: 15),
                Expanded(
                  child: TextfieldRefactor(
                      controller: _fullNameController, name: "", maxLines: 1),
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
                      maxLines: 1),
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
                      maxLines: 1),
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
                      controller: _emailAddressController,
                      name: "",
                      maxLines: 1),
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
                    "LinkedIn",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(width: 15),
                Expanded(
                  child: TextfieldRefactor(
                      controller: _linkedinController, name: "", maxLines: 1),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Text(
            LocaleKeys.change_password.tr(),
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 30,
          ),
          CustomPasswordTextField(
            titleText: LocaleKeys.password.tr(),
            formKey: passFormKey,
            controller: _PassController,
            obscureText: provider.isPasswordVissible,
            onPassVisibilityPressed: () {
              setState(() {
                Provider.of<ProfileUpdateScreenController>(context,
                        listen: false)
                    .onPasswordVisibilityPressed();
              });
            },
          ),
          CustomPasswordTextField(
            titleText: LocaleKeys.confirm_password.tr(),
            formKey: cnfrmPasswordFormKey,
            obscureText: provider.isConfirmPasswordVisible,
            controller: _cnfrmPasswordController,
            onPassVisibilityPressed: () {
              setState(() {
                Provider.of<ProfileUpdateScreenController>(context,
                        listen: false)
                    .onConfirmPasswordVisibilityPressed();
              });
            },
          ),
          SizedBox(
            height: 20,
          ),
          InkWell(
            onTap: () async {
              await Provider.of<ProfileUpdateScreenController>(context,
                      listen: false)
                  .selectQrImage(source: ImageSource.gallery, context: context);
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Container(
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: provider.qrImgeFile == null
                      ? ColorConstant.kistlerBrandGreen.withOpacity(.09)
                      : ColorConstant.kistlerBrandGreen.withOpacity(.5),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.qr_code_2_outlined),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      provider.qrImgeFile == null
                          ? LocaleKeys.QR.tr()
                          : LocaleKeys.file_uploaded.tr(),
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
                    if (_PassController.text.isNotEmpty ||
                        _cnfrmPasswordController.text.isNotEmpty) {
                      //validating input fields
                      if (passFormKey.currentState!.validate() &&
                          cnfrmPasswordFormKey.currentState!.validate()) {
                        //calling api to update profile data
                        Provider.of<ProfileUpdateScreenController>(context,
                                listen: false)
                            .onProfileUpdate(
                                linkedin: _linkedinController.text,
                                language: context.locale,
                                fullName: _fullNameController.text,
                                email: _emailAddressController.text,
                                designation: _designationNameController.text,
                                profileiImage: provider.profileImgeFile,
                                qrImage: provider.qrImgeFile,
                                password: _PassController.text,
                                confirmPassword: _cnfrmPasswordController.text,
                                phoneNumber: _contactNumberController.text)
                            .then((value) {
                          if (value) {
                            AppUtils.oneTimeSnackBar(
                                LocaleKeys.profile_update_successfully.tr(),
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
                    } else {
                      //calling api to update profile data
                      Provider.of<ProfileUpdateScreenController>(context,
                              listen: false)
                          .onProfileUpdate(
                              linkedin: _linkedinController.text,
                              language: context.locale,
                              fullName: _fullNameController.text,
                              email: _emailAddressController.text,
                              designation: _designationNameController.text,
                              profileiImage: provider.profileImgeFile,
                              qrImage: provider.qrImgeFile,
                              password: _PassController.text,
                              confirmPassword: _cnfrmPasswordController.text,
                              phoneNumber: _contactNumberController.text)
                          .then((value) {
                        if (value) {
                          AppUtils.oneTimeSnackBar(
                              LocaleKeys.profile_update_successfully.tr(),
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

import 'package:flutter/material.dart';
import 'package:movie_app/api/api_register_screen/api_manager.dart';
import 'package:movie_app/custom_widgets/custom_elevated_button.dart';
import 'package:movie_app/custom_widgets/custom_text_form_field.dart';
import 'package:movie_app/model/register_response.dart';
import 'package:movie_app/utils/app_assets.dart';
import 'package:movie_app/utils/app_colors.dart';
import 'package:movie_app/utils/app_routes.dart';
import 'package:movie_app/utils/app_styles.dart';
import 'package:movie_app/utils/dialog-utils.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

final formKey = GlobalKey<FormState>();

class _RegisterScreenState extends State<RegisterScreen> {
  TextEditingController nameController = TextEditingController(
    text: 'GradProject'
  );
  TextEditingController emailController = TextEditingController(
    text: 'GradProject@gmail.com'
  );
  TextEditingController passwordController = TextEditingController(
    text: 'GradProject!123'
  );
  TextEditingController confirmPasswordController = TextEditingController(
     text: 'GradProject!123'
  );
  TextEditingController phoneNumberController = TextEditingController(
     text: '01015975160'
  );
  final emailRegExp = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
  final passwordRegExp =
      RegExp(r'^(?=.*[A-Z])(?=.*[0-9])(?=.*[!@#\$&*~]).{8,}$');
  final egyptPhoneRegExp = RegExp(r'^(010|011|012|015)\d{8}$');
  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    phoneNumberController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: AppColors.blackColor,
      appBar: AppBar(
        iconTheme: IconThemeData(color: AppColors.yellowColor),
        backgroundColor: AppColors.transparentColor,
        // leading: const Icon(Icons.arrow_back,
        //   color: AppColors.yellowColor,),
        title: Text(
          'Register',
          style: AppStyles.regular16Yellow,
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: height * 0.02),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Center(
                child: Image.asset(
                  AppAssets.registerScreenImage,
                ),
              ),
              SizedBox(
                height: height * 0.01,
              ),
              Text(
                'Avatar',
                textAlign: TextAlign.center,
                style: AppStyles.regular16White,
              ),
              SizedBox(
                height: height * 0.02,
              ),
              Form(
                  key: formKey,
                  child: Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            color: AppColors.darkGreyColor,
                            borderRadius: BorderRadius.circular(15)),
                        child: CustomTextFormField(
                          controller: nameController,
                          colorBorderSide: AppColors.darkGreyColor,
                          hintText: 'Name',
                          hintStyle: AppStyles.regular16White,
                          prefixIcon:
                              Image.asset(AppAssets.usernameIconRegister),
                          validator: (value) => value!.isEmpty
                              ? 'Enter Your Name'
                              : RegExp(r'[!@#<>?":_`~;[\]\\|=+)(*&^%0-9-]')
                                      .hasMatch(value)
                                  ? 'Enter a Valid Name'
                                  : null,
                        ),
                      ),
                      SizedBox(
                        height: height * 0.02,
                      ),
                      Container(
                        decoration: BoxDecoration(
                            color: AppColors.darkGreyColor,
                            borderRadius: BorderRadius.circular(15)),
                        child: CustomTextFormField(
                          controller: emailController,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Email is required";
                            } else if (!emailRegExp.hasMatch(value)) {
                              return "Enter a valid email";
                            }
                            return null;
                          },
                          colorBorderSide: AppColors.darkGreyColor,
                          hintText: 'Email',
                          hintStyle: AppStyles.regular16White,
                          prefixIcon: Image.asset(AppAssets.emailIcon),
                        ),
                      ),
                      SizedBox(
                        height: height * 0.02,
                      ),
                      Container(
                        decoration: BoxDecoration(
                            color: AppColors.darkGreyColor,
                            borderRadius: BorderRadius.circular(15)),
                        child: CustomTextFormField(
                          colorBorderSide: AppColors.darkGreyColor,
                          hintText: 'Password',
                          hintStyle: AppStyles.regular16White,
                          prefixIcon: Image.asset(AppAssets.passwordIcon),
                          suffixIcon: Image.asset(AppAssets.eyeHiddenIcon),
                          controller: passwordController,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Password is required";
                            } else if (!passwordRegExp.hasMatch(value)) {
                              return "Password must be at least 8 chars, include 1 uppercase, 1 number, 1 special character";
                            }
                            return null;
                          },
                        ),
                      ),
                      SizedBox(
                        height: height * 0.02,
                      ),
                      Container(
                        decoration: BoxDecoration(
                            color: AppColors.darkGreyColor,
                            borderRadius: BorderRadius.circular(15)),
                        child: CustomTextFormField(
                          controller: confirmPasswordController,
                          colorBorderSide: AppColors.darkGreyColor,
                          hintText: 'Confirm Password',
                          hintStyle: AppStyles.regular16White,
                          prefixIcon: Image.asset(AppAssets.passwordIcon),
                          suffixIcon: Image.asset(AppAssets.eyeHiddenIcon),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Please confirm your password";
                            } else if (value != passwordController.text) {
                              return "Passwords do not match";
                            }
                            return null;
                          },
                        ),
                      ),
                      SizedBox(
                        height: height * 0.02,
                      ),
                      Container(
                        decoration: BoxDecoration(
                            color: AppColors.darkGreyColor,
                            borderRadius: BorderRadius.circular(15)),
                        child: CustomTextFormField(
                          colorBorderSide: AppColors.darkGreyColor,
                          hintText: 'Phone Number',
                          hintStyle: AppStyles.regular16White,
                          prefixIcon: Image.asset(AppAssets.phoneIcon),
                          controller: phoneNumberController,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Phone number is required";
                            } else if (!egyptPhoneRegExp.hasMatch(value)) {
                              return "Enter a valid Egyptian phone number";
                            }
                            return null;
                          },
                        ),
                      ),
                    ],
                  )),
              SizedBox(
                height: height * 0.02,
              ),
              CustomElevatedButton(
                onPressed: () {
                  register();
                  //To Do : confirm the accounte and save in fire base
                  // Navigator.pop(context);
                },
                text: 'Create Accounte',
                backgroundColor: AppColors.yellowColor,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Already Have Accounte ?',
                    style: AppStyles.regular14White,
                  ),
                  TextButton(
                      onPressed: () {
                        //To Do : go to login screen
                        Navigator.pop(context);
                      },
                      child: Text(
                        'Login',
                        style: AppStyles.regular14Yellow,
                      ))
                ],
              ),
              SizedBox(
                height: height * 0.02,
              ),
              Align(
                  alignment: Alignment.topCenter,
                  child: Image.asset(AppAssets.languageSwitchImage))
            ],
          ),
        ),
      ),
    );
  }

  void register() async {
    if (formKey.currentState?.validate() == true) {
      final name = nameController.text.trim();
      final email = emailController.text.trim();
      final password = passwordController.text.trim();
      final confirmPassword = confirmPasswordController.text.trim();
      final phone = phoneNumberController.text.trim();
      DialogUtils.showLopading(textLoading: "Register...", context: context);
      try {
        final response = await ApiManager().register(
          name,
          email,
          password,
          confirmPassword,
          phone,
        );
        print("Register Response: $response");
        DialogUtils.hideLoading(context: context);
        DialogUtils.showMsg(
            context: context,
            title: "Success",
            msg: "Account Created !",
            posActionName: "ok",
            posAction: () {
              Navigator.pushNamedAndRemoveUntil(
                context,
                AppRoutes.loginRouteName,
                (route) => false,
              );
            });
      } catch (e) {
        if (!mounted) return;
        DialogUtils.hideLoading(context: context);
        DialogUtils.showMsg(
          context: context,
          title: "Error",
          msg: e.toString(),
          posActionName: "OK",
        );
      }
    }
  }
}

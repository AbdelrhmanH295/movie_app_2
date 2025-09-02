import 'package:flutter/material.dart';
import 'package:movie_app/custom_widgets/custom_elevated_button.dart';
import 'package:movie_app/custom_widgets/custom_text_form_field.dart';
import 'package:movie_app/utils/app_assets.dart';
import 'package:movie_app/utils/app_colors.dart';
import 'package:movie_app/utils/app_styles.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

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
              Container(
                decoration: BoxDecoration(
                    color: AppColors.darkGreyColor,
                    borderRadius: BorderRadius.circular(15)),
                child: CustomTextFormField(
                  colorBorderSide: AppColors.darkGreyColor,
                  hintText: 'Name',
                  hintStyle: AppStyles.regular16White,
                  prefixIcon: Image.asset(AppAssets.usernameIconRegister),
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
                  hintText: 'Confirm Password',
                  hintStyle: AppStyles.regular16White,
                  prefixIcon: Image.asset(AppAssets.passwordIcon),
                  suffixIcon: Image.asset(AppAssets.eyeHiddenIcon),
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
                ),
              ),
              SizedBox(
                height: height * 0.02,
              ),
              CustomElevatedButton(
                onPressed: () {
                  //To Do : confirm the accounte and save in fire base
                  Navigator.pop(context);
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
}

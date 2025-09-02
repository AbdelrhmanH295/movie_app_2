import 'package:flutter/material.dart';
import 'package:movie_app/custom_widgets/custom_bottom_sheet.dart';
import 'package:movie_app/custom_widgets/custom_elevated_button.dart';
import 'package:movie_app/custom_widgets/custom_text_form_field.dart';
import 'package:movie_app/utils/app_assets.dart';
import 'package:movie_app/utils/app_colors.dart';
import 'package:movie_app/utils/app_routes.dart';
import 'package:movie_app/utils/app_styles.dart';

class ProfileUpdateTab extends StatelessWidget {
  const ProfileUpdateTab({super.key});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: AppColors.blackColor,
      appBar: AppBar(
        iconTheme: IconThemeData(color: AppColors.yellowColor),
        centerTitle: true,
        backgroundColor: AppColors.transparentColor,
        title: Text(
          'Pick Avatar',
          style: AppStyles.regular16Yellow,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              alignment: Alignment.center,
              // color: AppColors.redColor,
              child: Image.asset(
                AppAssets.gamer1,
                alignment: Alignment.center,
              ),
            ),
            SizedBox(height: height * 0.04),
            Container(
              decoration: BoxDecoration(
                  color: AppColors.darkGreyColor,
                  borderRadius: BorderRadius.circular(16)),
              child: CustomTextFormField(
                prefixIcon: Image.asset(AppAssets.usernameIconUpdateProfile),
                hintText: 'John Safwat',
                hintStyle: AppStyles.regular20White,
                colorBorderSide: AppColors.darkGreyColor,
              ),
            ),
            SizedBox(height: height * 0.02),
            Container(
              decoration: BoxDecoration(
                  color: AppColors.darkGreyColor,
                  borderRadius: BorderRadius.circular(16)),
              child: CustomTextFormField(
                prefixIcon: Image.asset(AppAssets.phoneIcon),
                hintText: '01200000000000',
                hintStyle: AppStyles.regular20White,
                colorBorderSide: AppColors.darkGreyColor,
              ),
            ),
            SizedBox(height: height * 0.03),
            InkWell(
              onTap: () {
                Navigator.of(context)
                    .pushNamed(AppRoutes.resetpasswordRouteName);
              },
              child: Text(
                'Reset Password',
                style: AppStyles.regular20White,
              ),
            ),
            Spacer(),
            CustomElevatedButton(
              onPressed: () {},
              backgroundColor: AppColors.redColor,
              text: 'Delete Account',
              textStyle: AppStyles.regular20White,
            ),
            SizedBox(height: height * 0.02),
            CustomElevatedButton(
              onPressed: () {
                // todo : change avatar profile

                showModalBottomSheet(
                  backgroundColor: Colors.black,
                  context: context,
                  builder: (context) {
                    return Container(child: CustomBottomSheet());
                  },
                );
              },
              text: 'Update Data',
              textStyle: AppStyles.regular20Black,
            )
          ],
        ),
      ),
    );
  }
}

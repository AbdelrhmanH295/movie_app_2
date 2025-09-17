import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/cubit/profile_update/profile_update_cubit.dart';
import 'package:movie_app/cubit/profile_update/profile_update_states.dart';
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
      body: BlocBuilder<ProfileUpdateCubit, ProfileUpdateState>(
        builder: (context, state) {
          if (state is ProfileUpdateLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is ProfileUpdateFailure) {
            return Center(child: Text("Error: ${state.error}"));
          } else if (state is ProfileUpdateInitial) {
            return buildProfileContent(
              context,
              height,
              avatarPath: state.avatarPath,
              username: state.username,
              phoneNumber: state.phoneNumber,
            );
          } else if (state is ProfileUpdateAvatarChanged) {
            return buildProfileContent(
              context,
              height,
              avatarPath: state.avatarPath,
              username: "John Doe",
              phoneNumber: "01000000000",
            );
          }

          // fallback
          return const Center(child: Text("No state to display"));
        },
      ),
    );
  }

  Widget buildProfileContent(
    BuildContext context,
    double height, {
    required String avatarPath,
    required String username,
    required String phoneNumber,
  }) {
    return Padding(
      padding: const EdgeInsets.all(18),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            alignment: Alignment.center,
            child: Image.asset(
              avatarPath,
              alignment: Alignment.center,
            ),
          ),
          SizedBox(height: height * 0.04),
          Container(
            decoration: BoxDecoration(
              color: AppColors.darkGreyColor,
              borderRadius: BorderRadius.circular(16),
            ),
            child: CustomTextFormField(
              prefixIcon: Image.asset(AppAssets.usernameIconUpdateProfile),
              hintText: username,
              hintStyle: AppStyles.regular20White,
              colorBorderSide: AppColors.darkGreyColor,
            ),
          ),
          SizedBox(height: height * 0.02),
          Container(
            decoration: BoxDecoration(
              color: AppColors.darkGreyColor,
              borderRadius: BorderRadius.circular(16),
            ),
            child: CustomTextFormField(
              prefixIcon: Image.asset(AppAssets.phoneIcon),
              hintText: phoneNumber,
              hintStyle: AppStyles.regular20White,
              colorBorderSide: AppColors.darkGreyColor,
            ),
          ),
          SizedBox(height: height * 0.03),
          InkWell(
            onTap: () {
              Navigator.of(context).pushNamed(AppRoutes.resetpasswordRouteName);
            },
            child: Text(
              'Reset Password',
              style: AppStyles.regular20White,
            ),
          ),
          const Spacer(),
          CustomElevatedButton(
            onPressed: () {
              ProfileUpdateCubit().resetProfile();
              context.read<ProfileUpdateCubit>().resetProfile();

              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text("Profile Deleted successfully"),
                  backgroundColor: Colors.red,
                ),
              );
            },
            backgroundColor: AppColors.redColor,
            text: 'Delete Account',
            textStyle: AppStyles.regular20White,
          ),
          SizedBox(height: height * 0.02),
          CustomElevatedButton(
            onPressed: () {
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
    );
  }
}

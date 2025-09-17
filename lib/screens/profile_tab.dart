import 'package:flutter/material.dart';
import 'package:movie_app/custom_widgets/custom_elevated_button.dart';
import 'package:movie_app/utils/app_assets.dart';
import 'package:movie_app/utils/app_colors.dart';
import 'package:movie_app/utils/app_routes.dart';
import 'package:movie_app/utils/app_styles.dart';

class ProfileTab extends StatelessWidget {
  const ProfileTab({super.key});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    List<String> avatarUpdateList = [
      AppAssets.avatar1Image,
      AppAssets.avatar2Image,
      AppAssets.avatar3Image,
      AppAssets.avatar4Image,
      AppAssets.avatar5Image,
      AppAssets.avatar6Image,
      AppAssets.avatar7Image,
      AppAssets.avatar8Image,
      AppAssets.avatar9Image,
    ];
    return Scaffold(
      backgroundColor: AppColors.blackColor,
      body: Container(
        color: AppColors.darkGreyColor,
        height: height * 0.45,
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(
                vertical: height * 0.06, horizontal: width * 0.06),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Row(
                  children: [
                    Image.asset(avatarUpdateList[7]),
                    SizedBox(
                      width: width * 0.05,
                    ),
                    Column(
                      children: [
                        Text('12',
                            style: AppStyles.regular20White.copyWith(
                                fontSize: 36,
                                fontFamily: 'Roboto',
                                fontWeight: FontWeight.bold)),
                        Text(
                          'Wish List',
                          style: AppStyles.regular20White.copyWith(
                              fontSize: 24,
                              fontFamily: 'Roboto',
                              fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                    SizedBox(
                      width: width * 0.08,
                    ),
                    Column(
                      children: [
                        Text('10',
                            style: AppStyles.regular20White.copyWith(
                                fontSize: 36,
                                fontFamily: 'Roboto',
                                fontWeight: FontWeight.bold)),
                        Text(
                          'History',
                          style: AppStyles.regular20White.copyWith(
                              fontSize: 24,
                              fontFamily: 'Roboto',
                              fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: height * 0.02,
                ),
                Text(
                  'User Name',
                  textAlign: TextAlign.left,
                  style: AppStyles.regular20White,
                ),
                SizedBox(
                  height: height * 0.02,
                ),
                Row(
                  children: [
                    Expanded(
                      child: CustomElevatedButton(
                        onPressed: () {
                          Navigator.of(context)
                              .pushNamed(AppRoutes.profileUpdateRouteName);
                        },
                        text: 'Edit Profile',
                        backgroundColor: AppColors.yellowColor,
                      ),
                    ),
                    SizedBox(
                      width: width * 0.05,
                    ),
                    Expanded(
                      child: CustomElevatedButton(
                        onPressed: () {},
                        text: 'Exit',
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        icon: true,
                        iconWidget: Image.asset(AppAssets.exitIcon),
                        backgroundColor: AppColors.redColor,
                        textStyle: AppStyles.regular20White,
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: height * 0.02,
                ),
                Padding(
                  padding:
                      EdgeInsets.only(left: width * 0.07, right: width * 0.07),
                  child: DefaultTabController(
                    length: 2,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                          onTap: () {},
                          child: Column(
                            children: [
                              Padding(
                                padding: EdgeInsets.only(top: height * 0.02),
                                child: Image.asset(AppAssets.watchListIcon),
                              ),
                              SizedBox(
                                height: height * 0.01,
                              ),
                              Text(
                                'Watch List',
                                style: AppStyles.regular20White,
                              )
                            ],
                          ),
                        ),
                        InkWell(
                          onTap: () {},
                          child: Column(
                            children: [
                              Image.asset(AppAssets.fileIcon),
                              Text(
                                'History',
                                style: AppStyles.regular20White,
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:movie_app/custom_widgets/custom_text_form_field.dart';
import 'package:movie_app/utils/app_assets.dart';
import 'package:movie_app/utils/app_colors.dart';
import 'package:movie_app/utils/app_styles.dart';

class SearchTab extends StatelessWidget {
  const SearchTab({super.key});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
        backgroundColor: AppColors.blackColor,
        body: Padding(
          padding: const EdgeInsets.only(top: 60, left: 12, right: 12),
          child: Column(
            children: [
              CustomTextFormField(
                  prefixIcon: Image.asset(AppAssets.searchIconUnSelected),
                  hintStyle: AppStyles.regular16White,
                  hintText: "Search ..",
                  colorBorderSide: AppColors.whiteColor),
              SizedBox(
                height: 250,
              ),
              Image.asset(AppAssets.emptyListIcon)
            ],
          ),
        ));
  }
}

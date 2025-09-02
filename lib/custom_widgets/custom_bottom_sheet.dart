import 'package:flutter/material.dart';
import 'package:movie_app/utils/app_assets.dart';
import 'package:movie_app/utils/app_colors.dart';

class CustomBottomSheet extends StatelessWidget {
  const CustomBottomSheet({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
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
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Container(
      padding: EdgeInsets.symmetric(horizontal: width*0.04,vertical: height*0.02),
        decoration: BoxDecoration(
            color: AppColors.darkGreyColor,
            borderRadius: BorderRadius.circular(24)),
        child: GridView.builder(
          itemCount: avatarUpdateList.length,
          shrinkWrap: true,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            mainAxisSpacing: 18,
            crossAxisSpacing:26,
          ),
          itemBuilder: (context, index) {
            return ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Image.asset(avatarUpdateList[index],
              fit: BoxFit.cover,),
            );
          },
        ));
  }
}

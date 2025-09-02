import 'package:flutter/material.dart';
import 'package:movie_app/screens/explore_tab.dart';
import 'package:movie_app/screens/home_tab.dart';
import 'package:movie_app/screens/profile_update_tab.dart';
import 'package:movie_app/screens/search_tab.dart';
import 'package:movie_app/utils/app_assets.dart';
import 'package:movie_app/utils/app_colors.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;
  List<Widget> tabs = [
    HomeTab(),
    SearchTab(),
    ExploreTab(),
    ProfileUpdateTab()
  ];

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: AppColors.transparentColor,
      bottomNavigationBar: Container(
        color: AppColors.blackColor,
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: width * 0.015, vertical: height * 0.015),
          child: ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(16)),
            child: BottomNavigationBar(
                type: BottomNavigationBarType.fixed,
                backgroundColor: AppColors.darkGreyColor,
                currentIndex: selectedIndex,
                onTap: (index) {
                  selectedIndex = index;
                  setState(() {});
                },
                selectedItemColor: AppColors.yellowColor,
                unselectedItemColor: AppColors.whiteColor,
                items: [
                  buildBottomNavigationBarItem(
                    index: 0,
                    selectedIconName: AppAssets.homeIconSelected,
                    unSelectedIconName: AppAssets.homeIconUnSelected,
                  ),
                  buildBottomNavigationBarItem(
                    index: 1,
                    selectedIconName: AppAssets.searchIconSelected,
                    unSelectedIconName: AppAssets.searchIconUnSelected,
                  ),
                  buildBottomNavigationBarItem(
                    index: 2,
                    selectedIconName: AppAssets.exploreIconSelected,
                    unSelectedIconName: AppAssets.exploreIconUnSelected,
                  ),
                  buildBottomNavigationBarItem(
                    index: 3,
                    selectedIconName: AppAssets.profileIconSelected,
                    unSelectedIconName: AppAssets.profileIconUnSelected,
                  )
                ]),
          ),
        ),
      ),
      body: tabs[selectedIndex],
    );
  }

  BottomNavigationBarItem buildBottomNavigationBarItem(
      {required String selectedIconName,
      required String unSelectedIconName,
      String label = '',
      required int index}) {
    return BottomNavigationBarItem(
        label: label,
        icon: ImageIcon(AssetImage(
            selectedIndex == index ? selectedIconName : unSelectedIconName)));
  }
}

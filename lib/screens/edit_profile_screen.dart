import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/cubit/add_favorite_cubit/add_favorite_cubit.dart';
import 'package:movie_app/cubit/add_favorite_cubit/add_favorite_states_cubit.dart';
import 'package:movie_app/custom_widgets/custom_elevated_button.dart';
import 'package:movie_app/utils/app_assets.dart';
import 'package:movie_app/utils/app_colors.dart';
import 'package:movie_app/utils/app_routes.dart';
import 'package:movie_app/utils/app_styles.dart';

class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: AppColors.blackColor,
        body: Column(
          children: [
            Container(
              width: double.infinity,
              height: height * 0.38,
              color: AppColors.darkGreyColor,
              child: Padding(
                padding: const EdgeInsets.only(left: 10, top: 65, right: 10),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Image.asset(
                          AppAssets.gamer1,
                          height: 90,
                        ),
                        SizedBox(
                          width: width * 0.15,
                        ),
                        Column(
                          children: [
                            Text(
                              '12',
                              style: AppStyles.regular20White
                                  .copyWith(fontWeight: FontWeight.bold),
                            ),
                            Text(
                              'wishList',
                              style: AppStyles.regular20White
                                  .copyWith(fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        SizedBox(
                          width: width * 0.08,
                        ),
                        Column(
                          children: [
                            Text(
                              '10',
                              style: AppStyles.regular20White
                                  .copyWith(fontWeight: FontWeight.bold),
                            ),
                            Text(
                              'History',
                              style: AppStyles.regular20White
                                  .copyWith(fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Container(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'John Safwat',
                        style: AppStyles.regular20White
                            .copyWith(fontWeight: FontWeight.bold),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 12),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            width: width * 0.55,
                            child: CustomElevatedButton(
                              onPressed: () {
                                Navigator.of(context).pushNamed(
                                    AppRoutes.profileUpdateRouteName);
                              },
                              text: 'Edit Profile',
                            ),
                          ),
                          SizedBox(
                            width: width * 0.08,
                          ),
                          Container(
                            width: width * 0.3,
                            child: CustomElevatedButton(
                              onPressed: () {},
                              text: 'Exit',
                              textStyle: AppStyles.regular20White,
                              backgroundColor: AppColors.redColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const TabBar(
                      indicatorColor: AppColors.yellowColor,
                      dividerColor: AppColors.transparentColor,
                      tabs: [
                        Tab(
                            icon: Icon(
                          Icons.list,
                          color: Colors.yellow,
                          size: 34,
                        )),
                        Tab(
                            icon: Icon(
                          Icons.history,
                          color: Colors.yellow,
                          size: 34,
                        )),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: TabBarView(children: [
                BlocBuilder<AddFavoriteCubit, FavoritesState>(
                  builder: (context, state) {
                    if (state is FavoritesLoading) {
                      return const Center(child: CircularProgressIndicator());
                    } else if (state is FavoritesSuccess) {
                      final favorites = state.favorites;

                      if (favorites.isEmpty) {
                        return const Center(
                          child: Text(
                            'No favorites yet',
                            style: TextStyle(color: Colors.white),
                          ),
                        );
                      }

                      return ListView.builder(
                        padding: EdgeInsets.zero,
                        itemCount: favorites.length,
                        itemBuilder: (context, index) {
                          final movie = favorites[index];
                          return ListTile(
                            title: Image.network(
                              movie.largeCoverImage ?? '',
                              fit: BoxFit.cover,
                              width: double.infinity,
                            ),
                          );
                        },
                      );
                    } else if (state is FavoritesError) {
                      return Center(
                        child: Text(
                          state.message,
                          style: const TextStyle(color: Colors.red),
                        ),
                      );
                    } else {
                      return const Center(
                        child: Text(
                          'No favorites yet',
                          style: TextStyle(color: Colors.white),
                        ),
                      );
                    }
                  },
                ),

                Image.asset(AppAssets.gamer1)
              ]),
            )
          ],
        ),
      ),
    );
  }
}

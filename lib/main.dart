import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/cubit/add_favorite_cubit/add_favorite_cubit.dart';
import 'package:movie_app/cubit/profile_update/profile_update_cubit.dart';
import 'package:movie_app/screens/edit_profile_screen.dart';
import 'package:movie_app/screens/explore_tab.dart';
import 'package:movie_app/screens/Auth/forget_password.dart';
import 'package:movie_app/screens/home_screen.dart';
import 'package:movie_app/screens/home_tab.dart';
import 'package:movie_app/screens/Auth/login_screen.dart';
import 'package:movie_app/screens/movie_details_screen.dart';
import 'package:movie_app/screens/movie_suggestion.dart';
import 'package:movie_app/screens/on_boarding.dart';
import 'package:movie_app/screens/profile_update_tab.dart';
import 'package:movie_app/screens/Auth/register_screen.dart';
import 'package:movie_app/screens/Auth/reset_password_screen.dart';
import 'package:movie_app/screens/search%20tab/search_tab.dart';
import 'package:movie_app/utils/app_routes.dart';

void main() {
  runApp(MultiBlocProvider(providers: [
    BlocProvider(create: (context) => AddFavoriteCubit()),
    BlocProvider(create: (context) => ProfileUpdateCubit())
  ], child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: AppRoutes.homeScreenRouteName,
      routes: {
        AppRoutes.loginRouteName: (context) => LoginScreen(),
        AppRoutes.registerRouteName: (context) => RegisterScreen(),
        AppRoutes.forgetScreenRouteName: (context) => ForgetPassword(),
        AppRoutes.profileUpdateRouteName: (context) => BlocProvider(
              child: ProfileUpdateTab(),
              create: (context) => ProfileUpdateCubit(),
            ),
        AppRoutes.onBoarding: (context) => OnBoarding(),
        AppRoutes.homeScreenRouteName: (context) => HomeScreen(),
        AppRoutes.homeTabRouteName: (context) => HomeTab(),
        AppRoutes.searchTabRouteName: (context) => SearchTab(),
        AppRoutes.exploreTabRouteName: (context) => ExploreTab(),
        AppRoutes.resetpasswordRouteName: (context) => ResetPasswordScreen(),
        AppRoutes.movieDeatailsScreen: (context) => MovieDetailsScreen(),
        AppRoutes.editProfileScreen: (context) => EditProfileScreen()
        // AppRoutes.movieSuggestionScreen: (context) => MovieSuggestion(),
      },
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
    );
  }
}

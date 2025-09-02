import 'package:flutter/material.dart';
import 'package:movie_app/screens/explore_tab.dart';
import 'package:movie_app/screens/forget_password.dart';
import 'package:movie_app/screens/home_screen.dart';
import 'package:movie_app/screens/home_tab.dart';
import 'package:movie_app/screens/login_screen.dart';
import 'package:movie_app/screens/on_boarding.dart';
import 'package:movie_app/screens/profile_update_tab.dart';
import 'package:movie_app/screens/register_screen.dart';
import 'package:movie_app/screens/reset_password_screen.dart';
import 'package:movie_app/screens/search_tab.dart';
import 'package:movie_app/utils/app_routes.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: AppRoutes.onBoarding,
      routes: {
        AppRoutes.loginRouteName: (context) => LoginScreen(),
        AppRoutes.registerRouteName: (context) => RegisterScreen(),
        AppRoutes.forgetScreenRouteName: (context) => ForgetPassword(),
        AppRoutes.profileUpdateRouteName: (context) => ProfileUpdateTab(),
        AppRoutes.onBoarding: (context) => OnBoarding(),
        AppRoutes.homeScreenRouteName: (context) => HomeScreen(),
        AppRoutes.homeTabRouteName: (context) => HomeTab(),
        AppRoutes.searchTabRouteName: (context) => SearchTab(),
        AppRoutes.exploreTabRouteName: (context) => ExploreTab(),
        AppRoutes.resetpasswordRouteName: (context) => ResetPasswordScreen(),
      },
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
    );
  }
}

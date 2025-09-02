import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/api/api_home_screen/api_manager.dart';
import 'package:movie_app/model/movie_response.dart';
import 'package:movie_app/utils/app_assets.dart';
import 'package:movie_app/utils/app_colors.dart';
import 'package:movie_app/utils/app_styles.dart';

class HomeTab extends StatefulWidget {
  const HomeTab({super.key});

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  int currentIndex = 0;
  late Future<Movie?> moviesFuture;

  @override
  void initState() {
    moviesFuture = ApiManager.getMovies();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: AppColors.blackColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            FutureBuilder<Movie?>(
              future: moviesFuture,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                      heightFactor: 22, child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Center(child: Text("Error: ${snapshot.error}"));
                } else if (!snapshot.hasData || snapshot.data == null) {
                  return Center(child: Image.asset(AppAssets.emptyListIcon));
                }

                var movies = snapshot.data!.data!.movies!;

                return Container(
                  height: height * 0.75,
                  child: Stack(
                    children: [
                      Positioned.fill(
                        child: AnimatedSwitcher(
                          duration: const Duration(milliseconds: 600),
                          child: Image.network(
                            movies[currentIndex].mediumCoverImage ??
                                "https://via.placeholder.com/600x400",
                            key: ValueKey(movies[currentIndex].backgroundImage),
                            fit: BoxFit.cover,
                            width: double.infinity,
                            height: double.infinity,
                          ),
                        ),
                      ),
                      Positioned.fill(
                          child: Container(
                        height: 200,
                        decoration: BoxDecoration(
                            gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Colors.transparent,
                            AppColors.darkGreyColor,
                          ],
                        )),
                      )),
                      Positioned.fill(
                        child: Container(color: Colors.black.withOpacity(0.6)),
                      ),
                      Positioned(
                        top: 50,
                        left: 0,
                        right: 0,
                        child: Center(
                            child: Image.asset(AppAssets.availabelNowImage)),
                      ),
                      Center(
                        child: CarouselSlider.builder(
                          itemCount: movies.length,
                          itemBuilder: (context, index, realIndex) {
                            final movie = movies[index];
                            return ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: Stack(
                                children: [
                                  Positioned.fill(
                                    child: Image.network(
                                      movie.mediumCoverImage ??
                                          "https://via.placeholder.com/300",
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  Positioned(
                                    top: 8,
                                    left: 8,
                                    child: Container(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 6, vertical: 4),
                                      decoration: BoxDecoration(
                                        color: Colors.black.withOpacity(0.7),
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      child: Row(
                                        children: [
                                          Text(
                                            movie.rating?.toString() ?? "N/A",
                                            style: const TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          const SizedBox(width: 4),
                                          const Icon(Icons.star,
                                              color: Colors.yellow, size: 14),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                          options: CarouselOptions(
                            height: height * 0.4,
                            enlargeCenterPage: true,
                            viewportFraction: 0.6,
                            onPageChanged: (index, reason) {
                              setState(() => currentIndex = index);
                            },
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: -22,
                        left: 0,
                        right: 0,
                        child:
                            Center(child: Image.asset(AppAssets.watchNowImage)),
                      ),
                    ],
                  ),
                );
              },
            ),
            SizedBox(
              height: height * 0.02,
            ),
            FutureBuilder<Movie?>(
              future: moviesFuture,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: Text(''));
                } else if (snapshot.hasError) {
                  return Center(child: Text("Error: ${snapshot.error}"));
                } else if (!snapshot.hasData || snapshot.data == null) {
                  return Center(child: Image.asset(AppAssets.emptyListIcon));
                }

                var movies = snapshot.data!.data!.movies!;
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Row(children: [
                        Text(
                          'Action',
                          style: AppStyles.regular20White,
                        ),
                        Spacer(),
                        InkWell(
                            onTap: () {
                              // todo : see more action movies
                            },
                            child: Text(
                              'See More',
                              style: AppStyles.regular16Yellow,
                            )),
                        Icon(
                          Icons.arrow_right,
                          color: AppColors.yellowColor,
                        )
                      ]),
                      SizedBox(
                        height: height * 0.02,
                      ),
                      SizedBox(
                        height: 200,
                        child: Expanded(
                          child: ListView.separated(
                              scrollDirection: Axis.horizontal,
                              shrinkWrap: true,
                              itemBuilder: (context, index) {
                                final movie = movies[index];
                                return Container(
                                  width: 130,
                                  margin: const EdgeInsets.only(right: 8),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(12),
                                    child: Image.network(
                                      movie.mediumCoverImage ?? "",
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                );
                              },
                              separatorBuilder: (context, index) {
                                return SizedBox(
                                  width: width * 0.02,
                                );
                              },
                              itemCount: movies.length),
                        ),
                      )
                    ],
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}

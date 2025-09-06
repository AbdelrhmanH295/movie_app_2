import 'package:flutter/material.dart';
import 'package:movie_app/api/api_movie_details_screen/api_manager_movie_details.dart';
import 'package:movie_app/api/api_suggestion/api_manager.dart';
import 'package:movie_app/custom_widgets/custom_container.dart';
import 'package:movie_app/custom_widgets/custom_elevated_button.dart';
import 'package:movie_app/model/movie_details_response.dart';
import 'package:movie_app/screens/movie_suggestion.dart';
import 'package:movie_app/utils/app_assets.dart';
import 'package:movie_app/utils/app_colors.dart';
import 'package:movie_app/utils/app_styles.dart';

class MovieDetailsScreen extends StatefulWidget {
  const MovieDetailsScreen({super.key});

  @override
  State<MovieDetailsScreen> createState() => _MovieDetailsScreenState();
}

class _MovieDetailsScreenState extends State<MovieDetailsScreen> {
  @override
  void initState() {
    super.initState();
  }

  Widget buildNetworkImage(String? url,
      {BoxFit fit = BoxFit.cover, double? width, double? height}) {
    return Image.network(
      url ?? "https://via.placeholder.com/300",
      fit: fit,
      width: width,
      height: height,
      errorBuilder: (context, error, stackTrace) {
        return Image.asset(
          AppAssets.emptyListIcon,
          fit: fit,
          width: width,
          height: height,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    final movieId = ModalRoute.of(context)!.settings.arguments as int;
    return Scaffold(
        backgroundColor: AppColors.blackColor,
        body: SingleChildScrollView(
          child: Column(
            children: [
              FutureBuilder<MovieDeateailsResponse?>(
                future: ApiManagerMovieDetails.getMovieDetails(movieId),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(
                        heightFactor: 22, child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    return Center(child: Text("Error: ${snapshot.error}"));
                  } else if (!snapshot.hasData || snapshot.data == null) {
                    return Center(child: Image.asset(AppAssets.emptyListIcon));
                  }

                  var movie = snapshot.data!.data!.movie!;
                  return SingleChildScrollView(
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: width * 0.025),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Stack(
                            children: [
                              Positioned(
                                child: Opacity(
                                  opacity: 0.5,
                                  child: buildNetworkImage(
                                    movie.largeCoverImage!,
                                    fit: BoxFit.cover,
                                    width: double.infinity,
                                  ),
                                ),
                              ),
                              Positioned(
                                  top: 50,
                                  child: Row(
                                    children: [
                                      Image.asset(AppAssets.arrowBack),
                                      SizedBox(
                                        width: width * 0.8,
                                      ),
                                      const Icon(
                                        Icons.bookmark,
                                        size: 35,
                                        color: AppColors.whiteColor,
                                      )
                                    ],
                                  )),
                              Positioned.fill(
                                  top: 480,
                                  child: Center(
                                    child: Text(movie.title ?? "",
                                        style: AppStyles.regular20White
                                            .copyWith(
                                                fontSize: 24,
                                                fontWeight: FontWeight.bold,
                                                fontFamily: "Roboto"),
                                        overflow: TextOverflow.ellipsis),
                                  )),
                              Positioned.fill(
                                  top: 538,
                                  child: Center(
                                    child: Text(
                                      movie.year.toString(),
                                      style: AppStyles.regular20White.copyWith(
                                          fontSize: 24,
                                          fontWeight: FontWeight.bold,
                                          fontFamily: "Roboto"),
                                    ),
                                  )),
                            ],
                          ),
                          Container(
                            width: double.infinity,
                            child: CustomElevatedButton(
                              onPressed: () {},
                              text: 'Watch',
                              backgroundColor: AppColors.redColor,
                              textStyle: AppStyles.regular20White
                                  .copyWith(fontWeight: FontWeight.bold),
                            ),
                          ),
                          SizedBox(
                            height: height * 0.02,
                          ),
                          Row(
                            children: [
                              CustomContainer(
                                  image: AppAssets.favoriteIcon,
                                  text: movie.likeCount.toString()),
                              SizedBox(
                                width: width * 0.03,
                              ),
                              CustomContainer(
                                  image: AppAssets.timeIcon,
                                  text: movie.runtime.toString()),
                              SizedBox(
                                width: width * 0.03,
                              ),
                              CustomContainer(
                                  image: AppAssets.starIcon,
                                  text: movie.rating.toString()),
                            ],
                          ),
                          SizedBox(
                            height: height * 0.02,
                          ),
                          Text(
                            textAlign: TextAlign.start,
                            'Screen Shots',
                            style:
                                AppStyles.regular20White.copyWith(fontSize: 24),
                          ),
                          SizedBox(
                            height: height * 0.02,
                          ),
                          SizedBox(
                            height: height * 0.24,
                            width: width * 0.2,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(16),
                              clipBehavior: Clip.antiAlias,
                              child: buildNetworkImage(
                                  movie.largeScreenshotImage1),
                            ),
                          ),
                          SizedBox(
                            height: height * 0.02,
                          ),
                          SizedBox(
                            height: height * 0.24,
                            width: width * 0.2,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(16),
                              clipBehavior: Clip.antiAlias,
                              child: buildNetworkImage(
                                  movie.largeScreenshotImage2),
                            ),
                          ),
                          SizedBox(
                            height: height * 0.02,
                          ),
                          SizedBox(
                            height: height * 0.24,
                            width: width * 0.2,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(16),
                              clipBehavior: Clip.antiAlias,
                              child: buildNetworkImage(
                                  movie.largeScreenshotImage3),
                            ),
                          ),
                          SizedBox(
                            height: height * 0.02,
                          ),
                          Text(
                            'Similar',
                            style: AppStyles.regular20White.copyWith(
                                fontSize: 24, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: height * 0.02,
                          ),
                          FutureBuilder(
                            future: ApiManager.getMovieSuggestion(movieId),
                            builder: (context, snapshot) {
                              if (snapshot.connectionState ==
                                  ConnectionState.waiting) {
                                return const Center(
                                    heightFactor: 22,
                                    child: CircularProgressIndicator());
                              } else if (snapshot.hasError) {
                                return Center(
                                    child: Text("Error: ${snapshot.error}"));
                              } else if (!snapshot.hasData ||
                                  snapshot.data == null) {
                                return Center(
                                    child:
                                        Image.asset(AppAssets.emptyListIcon));
                              }
                              var movie = snapshot.data!.data!.movies!;
                              return SizedBox(
                                height: height * 0.45,
                                child: GridView.builder(
                                  padding: EdgeInsets.zero,
                                  itemCount: movie.length,
                                  gridDelegate:
                                      SliverGridDelegateWithFixedCrossAxisCount(
                                          crossAxisSpacing: 6,
                                          mainAxisSpacing: 6,
                                          crossAxisCount: 2),
                                  itemBuilder: (context, index) {
                                    final movies = movie[index];
                                    return Container(
                                      height: double.infinity,
                                      width: double.infinity,
                                      margin: EdgeInsets.all(4),
                                      child: Stack(
                                        fit: StackFit.passthrough,
                                        alignment: Alignment.center,
                                        children: [
                                          ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(16),
                                            child: buildNetworkImage(
                                              movies.mediumCoverImage ?? "",
                                              fit: BoxFit.fill,
                                            ),
                                          ),
                                          Positioned(
                                            top: 8,
                                            left: 8,
                                            child: Container(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 6,
                                                      vertical: 4),
                                              decoration: BoxDecoration(
                                                color: Colors.black
                                                    .withOpacity(0.7),
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                              ),
                                              child: Row(
                                                children: [
                                                  Text(
                                                    movies.rating?.toString() ??
                                                        "N/A",
                                                    style: const TextStyle(
                                                      color: Colors.white,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  ),
                                                  const SizedBox(width: 4),
                                                  const Icon(Icons.star,
                                                      color: Colors.yellow,
                                                      size: 14),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    );
                                  },
                                ),
                              );
                            },
                          ),
                          Text(
                            'Summary',
                            style: AppStyles.regular20White.copyWith(
                                fontSize: 24, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: height * 0.02,
                          ),
                        ],
                      ),
                    ),
                  );
                },
              )
            ],
          ),
        ));
  }
}

import 'package:flutter/material.dart';
import 'package:movie_app/api/api_home_screen/api_manager.dart';
import 'package:movie_app/model/movie_response.dart';
import 'package:movie_app/utils/app_assets.dart';
import 'package:movie_app/utils/app_colors.dart';
import 'package:movie_app/utils/app_styles.dart';

class ExploreTab extends StatefulWidget {
  const ExploreTab({super.key});

  @override
  State<ExploreTab> createState() => _ExploreTabState();
}

class _ExploreTabState extends State<ExploreTab> {
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
    return DefaultTabController(
        length: 4,
        child: Scaffold(
            appBar: AppBar(
              toolbarHeight: 20,
              automaticallyImplyLeading: false,
              backgroundColor: AppColors.blackColor,
              bottom: TabBar(
                  labelPadding: EdgeInsets.all(6),
                  tabAlignment: TabAlignment.start,
                  isScrollable: true,
                  dividerColor: AppColors.transparentColor,
                  padding: EdgeInsets.zero,
                  indicatorColor: AppColors.transparentColor,
                  onTap: (index) {
                    setState(() {
                      currentIndex = index;
                    });
                  },
                  tabs: [
                    tabBarContainer('Action', 0),
                    tabBarContainer('Adventure', 1),
                    tabBarContainer('Animation', 2),
                    tabBarContainer('Biography', 3)
                  ]),
            ),
            backgroundColor: AppColors.blackColor,
            body: FutureBuilder<Movie?>(
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
                  margin: EdgeInsets.only(top: 12),
                  width: double.infinity,
                  height: height * 0.80,
                  child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2),
                    itemBuilder: (context, index) {
                      final movie = movies[index];
                      return Container(
                        height: double.infinity,
                        // color: AppColors.greenColor,
                        width: double.infinity,
                        margin: EdgeInsets.all(4),
                        child: Stack(
                          fit: StackFit.passthrough,
                          alignment: Alignment.center,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(16),
                              child: Image.network(
                                movie.mediumCoverImage ?? "",
                                fit: BoxFit.fill,
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
                    itemCount: movies.length,
                  ),
                );
              },
            )));
  }

  Widget tabBarContainer(String text, int selectedIndex) {
    bool isSelected = currentIndex == selectedIndex;

    return Container(
      width: 100,
      height: 40,
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: isSelected ? AppColors.yellowColor : AppColors.transparentColor,
        borderRadius: BorderRadius.circular(16),
        border: isSelected
            ? null
            : Border.all(width: 2, color: AppColors.yellowColor),
      ),
      alignment: Alignment.center,
      child: Text(
        text,
        textAlign: TextAlign.center,
        overflow: TextOverflow.ellipsis,
        style: isSelected
            ? AppStyles.regular16Black.copyWith(
                fontWeight: FontWeight.bold,
                fontSize: 15,
              )
            : AppStyles.regular14Yellow.copyWith(
                fontWeight: FontWeight.bold,
                fontSize: 15,
              ),
      ),
    );
  }
}

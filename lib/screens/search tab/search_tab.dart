import 'package:flutter/material.dart';
import 'package:movie_app/api/api_search_screen/api_manager.dart';
import 'package:movie_app/custom_widgets/custom_text_form_field.dart';
import 'package:movie_app/model/movie_response.dart';
import 'package:movie_app/utils/app_assets.dart';
import 'package:movie_app/utils/app_colors.dart';
import 'package:movie_app/utils/app_styles.dart';

class SearchTab extends StatefulWidget {
  const SearchTab({super.key});

  @override
  State<SearchTab> createState() => _SearchTabState();
}

class _SearchTabState extends State<SearchTab> {
  TextEditingController searchController = TextEditingController();
  List<Movies> allMovies = [];
  List<Movies> filteredMovies = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadMovies();
  }

  void _loadMovies() async {
    final movies = await ApiManagerr.getMoviess(); 
    setState(() {
      allMovies = movies;
      filteredMovies = movies;
      isLoading = false;
    });
  }

  void _filterMovies(String query) {
    final results = allMovies.where((movie) {
      final titleMatch =
          movie.title?.toLowerCase().contains(query.toLowerCase()) ?? false;
      final idMatch = movie.id?.toString().contains(query) ?? false;
      return titleMatch || idMatch;
    }).toList();

    setState(() {
      filteredMovies = results;
    });
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

    return Scaffold(
      backgroundColor: AppColors.blackColor,
      body: Padding(
        padding: const EdgeInsets.only(top: 60, left: 12, right: 12),
        child: isLoading
            ? const Center(child: CircularProgressIndicator())
            : Column(
                children: [
                  Form(
                    child: CustomTextFormField(
                      controller: searchController,
                      prefixIcon: Image.asset(AppAssets.searchIconUnSelected),
                      hintStyle: AppStyles.regular16White,
                      hintText: "Search ..",
                      colorBorderSide: AppColors.whiteColor,
                      onChanged: _filterMovies, 
                    ),
                  ),
                  Expanded(
                    child: filteredMovies.isEmpty
                        ? Center(
                            child: Image.asset(AppAssets.emptyListIcon),
                          )
                        : GridView.builder(
                            padding: const EdgeInsets.only(top: 16),
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisSpacing: 12,
                              mainAxisSpacing: 8,
                              crossAxisCount: 2,
                            ),
                            itemCount: filteredMovies.length,
                            itemBuilder: (BuildContext context, int index) {
                              var movie = filteredMovies[index];
                              return ClipRRect(
                                borderRadius: BorderRadius.circular(16),
                                child: buildNetworkImage(
                                  movie.mediumCoverImage ?? '',
                                  fit: BoxFit.fill,
                                ),
                              );
                            },
                          ),
                  ),
                ],
              ),
      ),
    );
  }
}

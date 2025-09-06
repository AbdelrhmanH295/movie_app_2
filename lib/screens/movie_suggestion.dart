// import 'package:flutter/material.dart';
// import 'package:movie_app/api/api_suggestion/api_manager.dart';
// import 'package:movie_app/utils/app_assets.dart';

// class MovieSuggestion{
//     final movieId = ModalRoute.of(context)!.settings.arguments as int;
//     return FutureBuilder(
//       future: ApiManager.getMovieSuggestion(movieId),
//       builder: (context, snapshot) {
//         if (snapshot.connectionState == ConnectionState.waiting) {
//           return const Center(
//               heightFactor: 22, child: CircularProgressIndicator());
//         } else if (snapshot.hasError) {
//           return Center(child: Text("Error: ${snapshot.error}"));
//         } else if (!snapshot.hasData || snapshot.data == null) {
//           return Center(child: Image.asset(AppAssets.emptyListIcon));
//         }
//         var movie = snapshot.data!.data!.movies!;
//         return Expanded(
//             child: GridView.builder(
//           itemCount: movie.length,
//           gridDelegate:
//               SliverGridDelegateWithMaxCrossAxisExtent(maxCrossAxisExtent: 2),
//           itemBuilder: (context, index) {
//             final movies = movie[index];
//             return Container(
//                         height: double.infinity,
//                         width: double.infinity,
//                         margin: EdgeInsets.all(4),
//                         child: Stack(
//                           fit: StackFit.passthrough,
//                           alignment: Alignment.center,
//                           children: [
//                             ClipRRect(
//                               borderRadius: BorderRadius.circular(16),
//                               child: buildNetworkImage(
//                                 movies.mediumCoverImage ?? "",
//                                 fit: BoxFit.fill,
//                               ),
//                             ),
//                             Positioned(
//                               top: 8,
//                               left: 8,
//                               child: Container(
//                                 padding: const EdgeInsets.symmetric(
//                                     horizontal: 6, vertical: 4),
//                                 decoration: BoxDecoration(
//                                   color: Colors.black.withOpacity(0.7),
//                                   borderRadius: BorderRadius.circular(8),
//                                 ),
//                                 child: Row(
//                                   children: [
//                                     Text(
//                                       movies.rating?.toString() ?? "N/A",
//                                       style: const TextStyle(
//                                         color: Colors.white,
//                                         fontWeight: FontWeight.bold,
//                                       ),
//                                     ),
//                                     const SizedBox(width: 4),
//                                     const Icon(Icons.star,
//                                         color: Colors.yellow, size: 14),
//                                   ],
//                                 ),
//                               ),
//                             ),
//                           ],
//                         ),
//                       );
//           },
//         ));
//       },
//     );
//   }

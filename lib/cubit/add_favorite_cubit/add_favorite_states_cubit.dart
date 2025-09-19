import 'package:movie_app/model/movie_details_response.dart';
import 'package:movie_app/model/movie_response.dart' as movieResponse;
import 'package:movie_app/model/movie_details_response.dart' as movieDetails;

abstract class FavoritesState {}

class FavoritesInitial extends FavoritesState {}

class FavoritesLoading extends FavoritesState {}

class FavoritesSuccess extends FavoritesState {
  final List<Movie> favorites;

  FavoritesSuccess(this.favorites);
}

class FavoritesError extends FavoritesState {
  final String message;

  FavoritesError(this.message);
}

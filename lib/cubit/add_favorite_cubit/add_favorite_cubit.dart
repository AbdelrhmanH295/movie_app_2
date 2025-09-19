import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/cubit/add_favorite_cubit/add_favorite_states_cubit.dart';
import 'package:movie_app/model/movie_details_response.dart'; // Movie & MovieDeateailsResponse هنا

class AddFavoriteCubit extends Cubit<FavoritesState> {
  AddFavoriteCubit() : super(FavoritesInitial());

  final List<Movie> favorites = [];

  void addFavorite(Movie movie) {
    emit(FavoritesLoading());
    try {
      favorites.add(movie);
      emit(FavoritesSuccess(List.from(favorites)));
    } catch (e) {
      emit(FavoritesError('Failed to add favorite'));
    }
  }

  void addFavoriteFromDetails(MovieDeateailsResponse movieDetailsResponse) {
    emit(FavoritesLoading());
    try {
      final movie = movieDetailsResponse.data!.movie!;
      favorites.add(movie);
      emit(FavoritesSuccess(List.from(favorites)));
    } catch (e) {
      emit(FavoritesError('Failed to add favorite from details'));
    }
  }
}

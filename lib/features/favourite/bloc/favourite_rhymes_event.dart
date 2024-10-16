part of 'favourite_rhymes_bloc.dart';

sealed class FavouriteRhymesEvent extends Equatable {
  const FavouriteRhymesEvent();

  @override
  List<Object> get props => [];
}

final class LoadFavouriteRhymes extends FavouriteRhymesEvent {}

final class ToggleFavouriteRhyme extends FavouriteRhymesEvent {
  const ToggleFavouriteRhyme({
    required this.favouriteRhymes,
  });

  final FavouriteRhymes favouriteRhymes;

  @override
  List<Object> get props => super.props..add(favouriteRhymes);
}

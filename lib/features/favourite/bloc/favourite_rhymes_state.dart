part of 'favourite_rhymes_bloc.dart';

sealed class FavouriteRhymesState extends Equatable {
  const FavouriteRhymesState();

  @override
  List<Object> get props => [];
}

final class FavouriteRhymesInitial extends FavouriteRhymesState {}

final class FavouriteRhymesLoading extends FavouriteRhymesState {}

final class FavouriteRhymesLoaded extends FavouriteRhymesState {
  const FavouriteRhymesLoaded({required this.rhymes});

  final List<FavouriteRhymes> rhymes;

  @override
  List<Object> get props => super.props..add(rhymes);
}

final class FavouriteRhymesFailure extends FavouriteRhymesState {
  const FavouriteRhymesFailure({required this.error});
  final Object error;

  @override
  List<Object> get props => super.props..add(error);
}

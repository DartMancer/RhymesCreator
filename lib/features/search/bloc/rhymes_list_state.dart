part of 'rhymes_list_bloc.dart';

sealed class RhymesListState extends Equatable {
  const RhymesListState();

  @override
  List<Object> get props => [];
}

final class RhymesListInitial extends RhymesListState {}

final class RhymesListLoading extends RhymesListState {}

final class RhymesListLoaded extends RhymesListState {
  const RhymesListLoaded({
    required this.query,
    required this.rhymes,
    required List<FavouriteRhymes> favouriteRhymes,
  }) : _favouriteRhymes = favouriteRhymes;

  final String query;
  final Rhymes rhymes;
  final List<FavouriteRhymes> _favouriteRhymes;

  bool isFavourite(String rhyme) {
    return _favouriteRhymes
        .where((e) => e.favouriteWord == rhyme && e.queryWord == query)
        .isNotEmpty;
  }

  @override
  List<Object> get props => super.props..add([query, rhymes, _favouriteRhymes]);

  RhymesListLoaded copyWith({
    String? query,
    Rhymes? rhymes,
    List<FavouriteRhymes>? favouriteRhymes,
  }) {
    return RhymesListLoaded(
      query: query ?? this.query,
      rhymes: rhymes ?? this.rhymes,
      favouriteRhymes: favouriteRhymes ?? _favouriteRhymes,
    );
  }
}

final class RhymesListFailure extends RhymesListState {
  const RhymesListFailure({required this.error});
  final Object error;

  @override
  List<Object> get props => super.props..add(error);
}

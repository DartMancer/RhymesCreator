part of 'rhymes_list_bloc.dart';

sealed class RhymesListEvent extends Equatable {
  const RhymesListEvent();

  @override
  List<Object?> get props => [];
}

class SearchRhymes extends RhymesListEvent {
  const SearchRhymes({
    required this.query,
  });

  final String query;

  @override
  List<Object?> get props => super.props..addAll([query]);
}

class ToggleFavouriteRhymes extends RhymesListEvent {
  const ToggleFavouriteRhymes({
    required this.query,
    required this.favouriteWord,
    required this.rhymes,
    this.completer,
  });

  final String query;
  final String favouriteWord;
  final Rhymes rhymes;
  final Completer? completer;

  @override
  List<Object?> get props => super.props
    ..add(
      [
        query,
        favouriteWord,
        rhymes,
        completer,
      ],
    );
}

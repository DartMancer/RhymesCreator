import 'package:json_annotation/json_annotation.dart';
import 'package:realm/realm.dart';
import 'package:rhymes_creator/repositories/favourites/models/favourite_rhymes.dart';
import 'package:rhymes_creator/repositories/repositories.dart';

@JsonSerializable()
class Rhymes {
  const Rhymes({required this.words});

  final List<String> words;

  HistoryRhymes toHistory(String queryWord) => HistoryRhymes(
        Uuid.v4().toString(),
        queryWord,
        words: words,
      );

  FavouriteRhymes toFavourite(String queryWord, String favouriteWord) =>
      FavouriteRhymes(
        Uuid.v4().toString(),
        queryWord,
        favouriteWord,
        DateTime.now(),
        words: words,
      );
}

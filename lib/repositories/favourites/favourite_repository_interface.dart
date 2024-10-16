import 'package:rhymes_creator/repositories/favourites/models/favourite_rhymes.dart';

abstract interface class FavouriteRepositoryI {
  Future<List<FavouriteRhymes>> getRhymesList();
  Future<void> createOrDeleteRhymes(FavouriteRhymes rhymes);
  Future<void> clear();
}

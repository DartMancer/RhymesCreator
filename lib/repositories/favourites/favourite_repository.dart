import 'package:realm/realm.dart';
import 'package:rhymes_creator/repositories/favourites/favourite_repository_interface.dart';
import 'package:rhymes_creator/repositories/favourites/models/favourite_rhymes.dart';

class FavouriteRepositoryImpl implements FavouriteRepositoryI {
  FavouriteRepositoryImpl({required this.realm});

  final Realm realm;
  @override
  Future<List<FavouriteRhymes>> getRhymesList() async {
    return realm.all<FavouriteRhymes>().toList();
  }

  @override
  Future<void> createOrDeleteRhymes(FavouriteRhymes rhymes) async {
    final rhymesList = realm.query<FavouriteRhymes>(
      "queryWord = '${rhymes.queryWord}' AND favouriteWord = '${rhymes.favouriteWord}'",
    );

    if (rhymesList.isNotEmpty) {
      for (var rhyme in rhymesList) {
        realm.write(() => realm.delete(rhyme));
      }
      return;
    }
    realm.write(() => realm.add(rhymes));
  }

  @override
  Future<void> clear() async {
    realm.write(() => realm.deleteAll<FavouriteRhymes>());
  }
}

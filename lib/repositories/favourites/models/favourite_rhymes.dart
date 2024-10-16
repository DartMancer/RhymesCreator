import 'package:realm/realm.dart';

part 'favourite_rhymes.realm.dart';

@RealmModel()
class _FavouriteRhymes {
  @PrimaryKey()
  late String id;
  late String queryWord;
  late String favouriteWord;
  late DateTime createdAt;
  late List<String> words;
}

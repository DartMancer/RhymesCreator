import 'package:realm/realm.dart'; // import realm package

part 'history_rhymes.realm.dart'; // declare a part file.

@RealmModel() // define a data model class named `_Car`.
class _HistoryRhymes {
  @PrimaryKey()
  late String id;
  late String word;
  late List<String> words;

  @override
  String toString() => '_HistoryRhymes(id: $id, words: $words)';
}

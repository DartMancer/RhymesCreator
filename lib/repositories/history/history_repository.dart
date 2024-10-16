import 'package:realm/realm.dart';
import 'package:rhymes_creator/repositories/history/history.dart';

class HistoryRepositoryImpl implements HistoryRepositoryI {
  HistoryRepositoryImpl({required this.realm});

  final Realm realm;

  @override
  Future<List<HistoryRhymes>> getRhymesList() async {
    return realm.all<HistoryRhymes>().toList();
  }

  @override
  Future<void> setRhymes(HistoryRhymes rhymes) async {
    realm.write(() => realm.add(rhymes));
  }

  @override
  Future<void> clear() async {
    realm.write(() => realm.deleteAll<HistoryRhymes>());
  }
}

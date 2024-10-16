import 'package:rhymes_creator/repositories/repositories.dart';

abstract interface class HistoryRepositoryI {
  Future<List<HistoryRhymes>> getRhymesList();
  Future<void> setRhymes(HistoryRhymes rhymes);
  Future<void> clear();
}

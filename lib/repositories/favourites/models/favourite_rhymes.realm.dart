// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'favourite_rhymes.dart';

// **************************************************************************
// RealmObjectGenerator
// **************************************************************************

// ignore_for_file: type=lint
class FavouriteRhymes extends _FavouriteRhymes
    with RealmEntity, RealmObjectBase, RealmObject {
  FavouriteRhymes(
    String id,
    String queryWord,
    String favouriteWord,
    DateTime createdAt, {
    Iterable<String> words = const [],
  }) {
    RealmObjectBase.set(this, 'id', id);
    RealmObjectBase.set(this, 'queryWord', queryWord);
    RealmObjectBase.set(this, 'favouriteWord', favouriteWord);
    RealmObjectBase.set(this, 'createdAt', createdAt);
    RealmObjectBase.set<RealmList<String>>(
        this, 'words', RealmList<String>(words));
  }

  FavouriteRhymes._();

  @override
  String get id => RealmObjectBase.get<String>(this, 'id') as String;
  @override
  set id(String value) => RealmObjectBase.set(this, 'id', value);

  @override
  String get queryWord =>
      RealmObjectBase.get<String>(this, 'queryWord') as String;
  @override
  set queryWord(String value) => RealmObjectBase.set(this, 'queryWord', value);

  @override
  String get favouriteWord =>
      RealmObjectBase.get<String>(this, 'favouriteWord') as String;
  @override
  set favouriteWord(String value) =>
      RealmObjectBase.set(this, 'favouriteWord', value);

  @override
  DateTime get createdAt =>
      RealmObjectBase.get<DateTime>(this, 'createdAt') as DateTime;
  @override
  set createdAt(DateTime value) =>
      RealmObjectBase.set(this, 'createdAt', value);

  @override
  RealmList<String> get words =>
      RealmObjectBase.get<String>(this, 'words') as RealmList<String>;
  @override
  set words(covariant RealmList<String> value) =>
      throw RealmUnsupportedSetError();

  @override
  Stream<RealmObjectChanges<FavouriteRhymes>> get changes =>
      RealmObjectBase.getChanges<FavouriteRhymes>(this);

  @override
  Stream<RealmObjectChanges<FavouriteRhymes>> changesFor(
          [List<String>? keyPaths]) =>
      RealmObjectBase.getChangesFor<FavouriteRhymes>(this, keyPaths);

  @override
  FavouriteRhymes freeze() =>
      RealmObjectBase.freezeObject<FavouriteRhymes>(this);

  EJsonValue toEJson() {
    return <String, dynamic>{
      'id': id.toEJson(),
      'queryWord': queryWord.toEJson(),
      'favouriteWord': favouriteWord.toEJson(),
      'createdAt': createdAt.toEJson(),
      'words': words.toEJson(),
    };
  }

  static EJsonValue _toEJson(FavouriteRhymes value) => value.toEJson();
  static FavouriteRhymes _fromEJson(EJsonValue ejson) {
    if (ejson is! Map<String, dynamic>) return raiseInvalidEJson(ejson);
    return switch (ejson) {
      {
        'id': EJsonValue id,
        'queryWord': EJsonValue queryWord,
        'favouriteWord': EJsonValue favouriteWord,
        'createdAt': EJsonValue createdAt,
      } =>
        FavouriteRhymes(
          fromEJson(id),
          fromEJson(queryWord),
          fromEJson(favouriteWord),
          fromEJson(createdAt),
          words: fromEJson(ejson['words']),
        ),
      _ => raiseInvalidEJson(ejson),
    };
  }

  static final schema = () {
    RealmObjectBase.registerFactory(FavouriteRhymes._);
    register(_toEJson, _fromEJson);
    return const SchemaObject(
        ObjectType.realmObject, FavouriteRhymes, 'FavouriteRhymes', [
      SchemaProperty('id', RealmPropertyType.string, primaryKey: true),
      SchemaProperty('queryWord', RealmPropertyType.string),
      SchemaProperty('favouriteWord', RealmPropertyType.string),
      SchemaProperty('createdAt', RealmPropertyType.timestamp),
      SchemaProperty('words', RealmPropertyType.string,
          collectionType: RealmCollectionType.list),
    ]);
  }();

  @override
  SchemaObject get objectSchema => RealmObjectBase.getSchema(this) ?? schema;
}

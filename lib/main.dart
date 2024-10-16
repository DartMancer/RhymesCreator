import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:realm/realm.dart';
import 'package:rhymes_creator/repositories/favourites/favourites.dart';
import 'package:rhymes_creator/repositories/history/history.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'core/core.dart';
import 'core/rhymes_creator_app.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: ".env");

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  final realm = _initRealm();
  final prefs = await _initPrefs();

  final config = AppConfig(
    realm: realm,
    preferences: prefs,
    localNotificationsPlugin: FlutterLocalNotificationsPlugin(),
    firebaseMessaging: FirebaseMessaging.instance,
  );

  runApp(RhymesCreator(config: config));
}

Future<SharedPreferences> _initPrefs() async {
  final prefs = await SharedPreferences.getInstance();
  return prefs;
}

Realm _initRealm() {
  final realmConfig = Configuration.local([
    HistoryRhymes.schema,
    FavouriteRhymes.schema,
  ]);
  final realm = Realm(realmConfig);
  return realm;
}

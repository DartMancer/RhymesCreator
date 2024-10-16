import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rhymes_creator/api/api.dart';
import 'package:rhymes_creator/bloc/cubit/theme_cubit.dart';
import 'package:rhymes_creator/features/favourite/bloc/favourite_rhymes_bloc.dart';
import 'package:rhymes_creator/features/history/bloc/history_rhymes_bloc.dart';
import 'package:rhymes_creator/features/search/bloc/rhymes_list_bloc.dart';
import 'package:rhymes_creator/repositories/favourites/favourites.dart';
import 'package:rhymes_creator/repositories/history/history.dart';
import 'package:rhymes_creator/repositories/settings/settings.dart';

import '../repositories/notifications/notifications.dart';
import 'app_config.dart';

class AppInitializer extends StatelessWidget {
  const AppInitializer({
    super.key,
    required this.config,
    required this.child,
  });

  final AppConfig config;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<HistoryRepositoryI>(
          create: (context) => HistoryRepositoryImpl(
            realm: config.realm,
          ),
        ),
        RepositoryProvider<FavouriteRepositoryI>(
          create: (context) => FavouriteRepositoryImpl(
            realm: config.realm,
          ),
        ),
        RepositoryProvider<SettingsRepositoryI>(
          create: (context) => SettingsRepositoryImpl(
            preferences: config.preferences,
          ),
        ),
        RepositoryProvider<NotificationsRepositoryI>(
          create: (context) => NotificationsRepositoryImpl(
            localNotifications: config.localNotificationsPlugin,
            firebaseMessaging: config.firebaseMessaging,
          ),
        ),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => RhymesListBloc(
              apiClient: RhymesApiClient(),
              historyRepository: context.read<HistoryRepositoryI>(),
              favouriteRepository: context.read<FavouriteRepositoryI>(),
            ),
          ),
          BlocProvider(
            create: (context) => HistoryRhymesBloc(
              historyRepository: context.read<HistoryRepositoryI>(),
            ),
          ),
          BlocProvider(
            create: (context) => FavouriteRhymesBloc(
              favouriteRepository: context.read<FavouriteRepositoryI>(),
            ),
          ),
          BlocProvider(
            create: (context) => ThemeCubit(
              settingsRepository: context.read<SettingsRepositoryI>(),
            ),
          ),
        ],
        child: child,
      ),
    );
  }
}

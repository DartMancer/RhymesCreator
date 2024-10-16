import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rhymes_creator/bloc/cubit/theme_cubit.dart';
import 'package:rhymes_creator/config/router/router.dart';

import '../ui/ui.dart';
import 'core.dart';

class RhymesCreator extends StatefulWidget {
  const RhymesCreator({
    super.key,
    required this.config,
  });

  final AppConfig config;

  @override
  State<RhymesCreator> createState() => _RhymesCreatorState();
}

class _RhymesCreatorState extends State<RhymesCreator> {
  final _router = AppRouter();

  @override
  Widget build(BuildContext context) {
    return AppInitializer(
      config: widget.config,
      child: BlocBuilder<ThemeCubit, ThemeState>(
        builder: (context, state) {
          return MaterialApp.router(
            title: 'Rhymes Creator',
            theme: state.isDark ? darkTheme : lightTheme,
            routerConfig: _router.config(),
          );
        },
      ),
    );
  }
}

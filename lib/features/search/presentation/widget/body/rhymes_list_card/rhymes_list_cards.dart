import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rhymes_creator/features/favourite/bloc/favourite_rhymes_bloc.dart';
import 'package:rhymes_creator/features/history/bloc/history_rhymes_bloc.dart';
import 'package:rhymes_creator/features/search/bloc/rhymes_list_bloc.dart';
import 'package:rhymes_creator/ui/ui.dart';

import '../rhymes_list_initial_banner.dart';

class RhymesListCard extends StatelessWidget {
  const RhymesListCard({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return BlocConsumer<RhymesListBloc, RhymesListState>(
      listener: _handleRhymesListState,
      builder: (context, state) {
        if (state is RhymesListInitial) {
          return const SliverFillRemaining(child: RhymesListInitialBanner());
        }
        if (state is RhymesListLoaded) {
          final rhymes = state.rhymes.words;
          return SliverList.builder(
            itemCount: rhymes.length,
            itemBuilder: (context, index) {
              final currentRhyme = rhymes[index];
              return RhymeListCard(
                rhyme: currentRhyme,
                isFavourite: state.isFavourite(currentRhyme),
                onTap: () => _toggleFavourite(context, state, currentRhyme),
              );
            },
          );
        }
        return SliverFillRemaining(
          child: Center(
            child: CircularProgressIndicator(color: theme.primaryColor),
          ),
        );
      },
    );
  }

  Future<void> _toggleFavourite(
    BuildContext context,
    RhymesListLoaded state,
    String currentRhyme,
  ) async {
    final rhymesListBloc = BlocProvider.of<RhymesListBloc>(context);
    final favouritesListBloc = BlocProvider.of<FavouriteRhymesBloc>(context);

    final completer = Completer();
    rhymesListBloc.add(
      ToggleFavouriteRhymes(
        query: state.query,
        favouriteWord: currentRhyme,
        rhymes: state.rhymes,
        completer: completer,
      ),
    );

    await completer.future;
    favouritesListBloc.add(LoadFavouriteRhymes());
  }

  void _handleRhymesListState(
    BuildContext context,
    RhymesListState state,
  ) {
    if (state is RhymesListLoaded) {
      BlocProvider.of<HistoryRhymesBloc>(context).add(LoadHistoryRhymes());
    }
  }
}

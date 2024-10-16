import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rhymes_creator/features/history/bloc/history_rhymes_bloc.dart';

import '../../../../../../ui/widgets/rhyme_history_card.dart';

class RhymesHistoryCards extends StatelessWidget {
  const RhymesHistoryCards({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: BlocBuilder<HistoryRhymesBloc, HistoryRhymesState>(
        builder: (context, state) {
          if (state is! HistoryRhymesLoaded) {
            return const SizedBox();
          }
          return SizedBox(
            height: 100,
            child: ListView.separated(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              scrollDirection: Axis.horizontal,
              itemCount: state.rhymes.length,
              separatorBuilder: (context, index) => const SizedBox(width: 16),
              itemBuilder: (context, index) {
                final rhymes = state.rhymes[index];
                return RhymeHistoryCard(
                  word: rhymes.word,
                  rhymes: rhymes.words,
                );
              },
            ),
          );
        },
      ),
    );
  }
}

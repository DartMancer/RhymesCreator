import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rhymes_creator/features/favourite/bloc/favourite_rhymes_bloc.dart';
import 'package:rhymes_creator/repositories/favourites/models/favourite_rhymes.dart';
import 'package:rhymes_creator/ui/ui.dart';

@RoutePage()
class FavouriteScreen extends StatefulWidget {
  const FavouriteScreen({
    super.key,
  });

  @override
  State<FavouriteScreen> createState() => _FavouriteScreenState();
}

class _FavouriteScreenState extends State<FavouriteScreen> {
  @override
  void initState() {
    BlocProvider.of<FavouriteRhymesBloc>(context).add(LoadFavouriteRhymes());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          const AppBarWidget(title: 'Избранные'),
          const SliverToBoxAdapter(child: SizedBox(height: 16)),
          BlocBuilder<FavouriteRhymesBloc, FavouriteRhymesState>(
            builder: (context, state) {
              if (state is FavouriteRhymesLoaded) {
                return SliverList.builder(
                  itemCount: state.rhymes.length,
                  itemBuilder: (context, index) {
                    final rhyme = state.rhymes[index];
                    return RhymeListCard(
                      rhyme: rhyme.favouriteWord,
                      sourceWord: rhyme.queryWord,
                      isFavourite: true,
                      onTap: () {
                        _toggleFavouriteRhyme(context, rhyme);
                      },
                    );
                  },
                );
              }
              return const SliverFillRemaining(
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  void _toggleFavouriteRhyme(BuildContext context, FavouriteRhymes rhyme) {
    BlocProvider.of<FavouriteRhymesBloc>(context).add(
      ToggleFavouriteRhyme(favouriteRhymes: rhyme),
    );
  }
}

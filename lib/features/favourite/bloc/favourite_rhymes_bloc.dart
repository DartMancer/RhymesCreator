import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:rhymes_creator/repositories/favourites/favourite_repository_interface.dart';
import 'package:rhymes_creator/repositories/favourites/models/favourite_rhymes.dart';

part 'favourite_rhymes_event.dart';
part 'favourite_rhymes_state.dart';

class FavouriteRhymesBloc
    extends Bloc<FavouriteRhymesEvent, FavouriteRhymesState> {
  FavouriteRhymesBloc({required FavouriteRepositoryI favouriteRepository})
      : _favouriteRepository = favouriteRepository,
        super(FavouriteRhymesInitial()) {
    on<LoadFavouriteRhymes>(_load);
    on<ToggleFavouriteRhyme>(_toggleFavourite);
  }
  final FavouriteRepositoryI _favouriteRepository;

  Future<void> _load(
    LoadFavouriteRhymes event,
    Emitter<FavouriteRhymesState> emit,
  ) async {
    try {
      emit(FavouriteRhymesLoading());
      final rhymes = await _favouriteRepository.getRhymesList();
      emit(FavouriteRhymesLoaded(rhymes: rhymes));
    } on Exception catch (e) {
      emit(FavouriteRhymesFailure(error: e));
    }
  }

  Future<void> _toggleFavourite(
    ToggleFavouriteRhyme event,
    Emitter<FavouriteRhymesState> emit,
  ) async {
    try {
      await _favouriteRepository.createOrDeleteRhymes(event.favouriteRhymes);
      add(LoadFavouriteRhymes());
    } on Exception catch (e) {
      log(e.toString());
    }
  }
}

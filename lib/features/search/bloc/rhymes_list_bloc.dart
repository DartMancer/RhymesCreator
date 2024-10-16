import 'dart:async';
import 'dart:developer';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rhymes_creator/api/api.dart';
import 'package:rhymes_creator/api/models/rhymes.dart';
import 'package:rhymes_creator/repositories/favourites/favourite_repository_interface.dart';
import 'package:rhymes_creator/repositories/favourites/models/favourite_rhymes.dart';
import 'package:rhymes_creator/repositories/repositories.dart';

part 'rhymes_list_event.dart';
part 'rhymes_list_state.dart';

class RhymesListBloc extends Bloc<RhymesListEvent, RhymesListState> {
  RhymesListBloc({
    required RhymesApiClient apiClient,
    required HistoryRepositoryI historyRepository,
    required FavouriteRepositoryI favouriteRepository,
  })  : _favouriteRepository = favouriteRepository,
        _historyRepository = historyRepository,
        _apiClient = apiClient,
        super(RhymesListInitial()) {
    on<SearchRhymes>(_onSearch);
    on<ToggleFavouriteRhymes>(_onToggleFavourite);
  }

  final RhymesApiClient _apiClient;
  final HistoryRepositoryI _historyRepository;
  final FavouriteRepositoryI _favouriteRepository;

  Future<void> _onSearch(
    SearchRhymes event,
    Emitter<RhymesListState> emit,
  ) async {
    try {
      emit(RhymesListLoading());
      final rhymes = await _apiClient.getRhymesList(word: event.query);
      final historyRhymes = rhymes.toHistory(event.query);
      await _historyRepository.setRhymes(historyRhymes);
      final favouriteRhymes = await _favouriteRepository.getRhymesList();
      emit(
        RhymesListLoaded(
          rhymes: rhymes,
          query: event.query,
          favouriteRhymes: favouriteRhymes,
        ),
      );
    } on Exception catch (e) {
      emit(RhymesListFailure(error: e));
    }
  }

  Future<void> _onToggleFavourite(
    ToggleFavouriteRhymes event,
    Emitter<RhymesListState> emit,
  ) async {
    try {
      final prevState = state;
      if (prevState is! RhymesListLoaded) {
        log('state is not RhymesListLoaded');
        return;
      }
      await _favouriteRepository.createOrDeleteRhymes(
        event.rhymes.toFavourite(
          event.query,
          event.favouriteWord,
        ),
      );
      final favouriteRhymes = await _favouriteRepository.getRhymesList();
      emit(prevState.copyWith(favouriteRhymes: favouriteRhymes));
    } on Exception catch (e) {
      emit(RhymesListFailure(error: e));
    } finally {
      event.completer?.complete();
    }
  }
}

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../data/models/episode_model.dart';
import '../../../domain/episode_page_usecase.dart';

part 'data_state.dart';

class DataCubit extends Cubit<DataState> {
  DataCubit(this.getEpisodePageUc) : super(DataInitial());
  final EpisodePageUseCase getEpisodePageUc;

  List<Result> episodes = [];

  Future<void> getEpisodes() async {
    emit(DataLoading());
    try {
      final response = await getEpisodePageUc();
      episodes = response.results;
      emit(DataSuccess(episodes: response.results));
    } catch (e) {
      emit(DataError('error: ${e.toString()}'));
    }
  }
}

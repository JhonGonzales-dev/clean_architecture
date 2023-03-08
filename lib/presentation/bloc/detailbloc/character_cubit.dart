import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:giftest/data/models/character_model.dart';
import 'package:giftest/domain/character_episode_usecase.dart';

part 'character_state.dart';

class CharacterCubit extends Cubit<CharacterState> {
  CharacterCubit(this.characterEpisodeUc) : super(CharacterInitial());
  final CharacterEpisodeUseCase characterEpisodeUc;

  Future<void> getCharacterFromEpisode(List<String> url) async {
    emit(CharacterLoading());
    List<String> iDs = [];
    url.where(
      (element) {
        final data = element.split('/');
        iDs.add(data.last);
        return true;
      },
    ).toList();

    try {
      final response = await characterEpisodeUc(iDs);

      emit(CharacterSuccess(response.data));
    } catch (e) {
      emit(CharacterError('error: ${e.toString()}'));
    }
  }

  Future<void> selectedItem(Character itemSelected) async {
    emit(CharacterSelected(itemSelected));
  }
}

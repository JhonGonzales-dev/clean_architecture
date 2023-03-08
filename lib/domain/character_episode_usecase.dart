import '../data/models/character_model.dart';
import '../data/repository/data_repository.dart';

class CharacterEpisodeUseCase {
  final DataRepository _dataRepository;

  CharacterEpisodeUseCase(this._dataRepository);

  Future<CharacterModel> call(List<String> ids) async =>
      await _dataRepository.getCharactersEpisode(ids);
}

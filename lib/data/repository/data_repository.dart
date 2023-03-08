import '../models/character_model.dart';
import '../models/episode_model.dart';

abstract class DataRepository {
  Future<EpisodeModel> getEpisodePage();
  Future<CharacterModel> getCharactersEpisode(List<String> ids);
}

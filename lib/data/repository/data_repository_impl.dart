import 'package:giftest/data/models/character_model.dart';

import '../models/episode_model.dart';
import '../service/api_service.dart';
import 'data_repository.dart';

class DataRepositoryImpl extends DataRepository {
  final ApiService _apiService;

  DataRepositoryImpl(this._apiService);
  @override
  Future<EpisodeModel> getEpisodePage() async {
    return await _apiService.getEpisodepage();
  }

  @override
  Future<CharacterModel> getCharactersEpisode(List<String> ids) async {
    return await _apiService.getCharactersFromEpisode(ids);
  }
}

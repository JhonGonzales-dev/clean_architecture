import '../data/models/episode_model.dart';
import '../data/repository/data_repository.dart';

class EpisodePageUseCase {
  final DataRepository _dataRepository;
  EpisodePageUseCase(this._dataRepository);

  Future<EpisodeModel> call() async => await _dataRepository.getEpisodePage();
}

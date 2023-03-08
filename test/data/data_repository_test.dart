/* import 'package:flutter_test/flutter_test.dart';
import 'package:giftest/data/models/episode_model.dart';
import 'package:giftest/data/repository/data_repository.dart';
import 'package:giftest/data/repository/data_repository_impl.dart';
import 'package:giftest/data/service/api_service.dart';
import 'package:mockito/mockito.dart';

class MockDataApiService extends Mock implements ApiService {}

void main() {
  late MockDataApiService mockDataApiService;
  late DataRepository dataRepository;
  group('Data repository', () {
    setUp(() {
      mockDataApiService = MockDataApiService();
      dataRepository = DataRepositoryImpl(mockDataApiService);
    });

    test('should get episodes', () async {
      var info = Info(count: 1, pages: 1, next: '1', prev: null);
      var resultsEpisode = List.generate(
        3,
        (index) => Result(
            id: index,
            name: null,
            airDate: null,
            episode: null,
            characters: null,
            url: null,
            created: null),
      );
      var episodePage = EpisodeModel(info: info, results: resultsEpisode);
      when(mockDataApiService.getEpisodepage())
          .thenAnswer((_) async => episodePage);

      final result = await dataRepository.getEpisodePage();
      expect(result, isA<EpisodeModel>());
    });
  });
}
 */
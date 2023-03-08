import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:giftest/data/repository/data_repository.dart';
import 'package:giftest/data/repository/data_repository_impl.dart';
import 'package:giftest/data/service/api_service.dart';
import 'package:giftest/presentation/bloc/detailbloc/character_cubit.dart';

import 'domain/character_episode_usecase.dart';
import 'domain/episode_page_usecase.dart';

import 'presentation/bloc/homebloc/data_cubit.dart';

final injector = GetIt.instance;

Future<void> init() async {
  // Bloc
  injector.registerFactory(() => DataCubit(injector()));
  injector.registerFactory(() => CharacterCubit(injector()));

  // Use cases
  injector.registerLazySingleton(() => EpisodePageUseCase(injector()));
  injector.registerLazySingleton(() => CharacterEpisodeUseCase(injector()));

  // Repository

  injector.registerLazySingleton<DataRepository>(
      () => DataRepositoryImpl(injector()));

  // Data sources
  injector.registerLazySingleton(() => ApiService(injector()));

  //! External

  injector.registerLazySingleton(() => Dio(BaseOptions(
      baseUrl: 'https://rickandmortyapi.com',
      headers: {
        'Content-Type': 'application/json',
        'Accept': '*/*',
      },
      receiveTimeout: const Duration(seconds: 3),
      connectTimeout: const Duration(seconds: 5))));
}

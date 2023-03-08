import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:giftest/data/models/character_model.dart';

import '../../core/error/exception_error.dart';
import '../models/episode_model.dart';

class ApiService {
  final Dio dio;

  ApiService(this.dio);
  Future<EpisodeModel> getEpisodepage() async {
    try {
      final response = await dio.get('/api/episode');
      if (response.statusCode == 200) {
        return EpisodeModel.fromJson(response.data);
      } else {
        throw ServerException();
      }
    } catch (e) {
      throw ServerException();
    }
  }

  Future<CharacterModel> getCharactersFromEpisode(List<String> ids) async {
    try {
      final map = <String, dynamic>{};

      final response = await dio.get('/api/character/$ids');

      if (response.statusCode == 200) {
        map["data"] = response.data;
        return CharacterModel.fromJson(map);
      } else {
        throw ServerException();
      }
    } catch (e) {
      throw ServerException();
    }
  }
}

import 'package:built_collection/built_collection.dart';
import 'package:dartz/dartz.dart';
import 'package:rick_and_morty/domain/common/failure.dart';
import 'package:rick_and_morty/domain/models/rick_morty_models.dart';

abstract class IRickMortyFacade {
  Future<Either<ResponseFailure, CharactersResponse>> getCharacters({
    int? page,
    String? name,
    String? status,
    String? species,
    String? type,
    String? gender,
  });

  Future<Either<ResponseFailure, Character>> getCharacter(int id);

  Future<Either<ResponseFailure, BuiltList<Character>>> getMultipleCharacters(
    List<int> ids,
  );

  Future<Either<ResponseFailure, LocationsResponse>> getLocations({
    int? page,
    String? name,
    String? type,
    String? dimension,
  });

  Future<Either<ResponseFailure, Location>> getLocation(int id);

  Future<Either<ResponseFailure, BuiltList<Location>>> getMultipleLocations(
    List<int> ids,
  );

  Future<Either<ResponseFailure, EpisodesResponse>> getEpisodes({
    int? page,
    String? name,
    String? episode,
  });

  Future<Either<ResponseFailure, Episode>> getEpisode(int id);

  Future<Either<ResponseFailure, BuiltList<Episode>>> getMultipleEpisodes(
    List<int> ids,
  );

  Future<Either<ResponseFailure, Map<String, dynamic>>> getApiInfo();
}

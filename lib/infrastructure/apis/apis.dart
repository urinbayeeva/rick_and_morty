import 'package:chopper/chopper.dart';
import 'package:built_collection/built_collection.dart';
import 'package:rick_and_morty/domain/models/rick_morty_models.dart';
import 'package:rick_and_morty/infrastructure/services/local_database/db_service.dart';
import 'package:rick_and_morty/utils/app_config.dart';

import '../../domain/serializers/built_value_converter.dart';

part 'apis.chopper.dart';

@ChopperApi(baseUrl: '/api')
abstract class RickMortyService extends ChopperService {
  @GET(path: '/character')
  Future<Response<CharactersResponse>> getCharacters({
    @Query('page') int? page,
    @Query('name') String? name,
    @Query('status') String? status,
    @Query('species') String? species,
    @Query('type') String? type,
    @Query('gender') String? gender,
  });

  @GET(path: '/character/{id}')
  Future<Response<Character>> getCharacter(@Path('id') int id);

  @GET(path: '/character/{ids}')
  Future<Response<BuiltList<Character>>> getMultipleCharacters(
    @Path('ids') String ids,
  );

  @GET(path: '/location')
  Future<Response<LocationsResponse>> getLocations({
    @Query('page') int? page,
    @Query('name') String? name,
    @Query('type') String? type,
    @Query('dimension') String? dimension,
  });

  @GET(path: '/location/{id}')
  Future<Response<Location>> getLocation(@Path('id') int id);

  @GET(path: '/location/{ids}')
  Future<Response<BuiltList<Location>>> getMultipleLocations(
    @Path('ids') String ids,
  );

  @GET(path: '/episode')
  Future<Response<EpisodesResponse>> getEpisodes({
    @Query('page') int? page,
    @Query('name') String? name,
    @Query('episode') String? episode,
  });

  @GET(path: '/episode/{id}')
  Future<Response<Episode>> getEpisode(@Path('id') int id);

  @GET(path: '/episode/{ids}')
  Future<Response<BuiltList<Episode>>> getMultipleEpisodes(
    @Path('ids') String ids,
  );

  @GET(path: '/')
  Future<Response<Map<String, dynamic>>> getApiInfo();

  static RickMortyService create(DBService dbService) {
    return _$RickMortyService(_RickMortyClient(dbService));
  }
}

base class _RickMortyClient extends ChopperClient {
  _RickMortyClient(DBService dbService)
    : super(
        baseUrl: Uri.parse('https://rickandmortyapi.com'),
        interceptors: [HttpLoggingInterceptor()],
        converter: BuiltValueConverter(),
      );
}

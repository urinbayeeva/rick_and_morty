import 'package:built_collection/built_collection.dart';
import 'package:chopper/chopper.dart';
import 'package:dartz/dartz.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:rick_and_morty/domain/common/failure.dart';
import 'package:rick_and_morty/domain/failurs/rick_morty_facade.dart';
import 'package:rick_and_morty/domain/models/rick_morty_models.dart';
import 'package:rick_and_morty/infrastructure/apis/apis.dart';
import 'package:rick_and_morty/utils/log_service.dart';

class RickMortyRepository implements IRickMortyFacade {
  final RickMortyService _rickMortyService;

  RickMortyRepository(this._rickMortyService);

  @override
  Future<Either<ResponseFailure, CharactersResponse>> getCharacters({
    int? page,
    String? name,
    String? status,
    String? species,
    String? type,
    String? gender,
  }) async {
    Response<CharactersResponse>? response;

    try {
      response = await _rickMortyService.getCharacters(
        page: page,
        name: name,
        status: status,
        species: species,
        type: type,
        gender: gender,
      );

      LogService.d('Characters Response Status: ${response.statusCode}');
      LogService.d('Characters Count: ${response.body?.info.count}');

      if (response.isSuccessful && response.body != null) {
        return right(response.body!);
      } else {
        return left(
          InvalidCredentials(message: 'failed_to_fetch_characters'.tr()),
        );
      }
    } catch (e, stack) {
      LogService.e('❌ Characters Exception: ${e.toString()}');
      if (response != null) {
        LogService.e('❌ Error Response Status: ${response.statusCode}');
      }
      return left(handleError(e));
    }
  }

  @override
  Future<Either<ResponseFailure, Character>> getCharacter(int id) async {
    Response<Character>? response;

    try {
      response = await _rickMortyService.getCharacter(id);

      LogService.d('Character Response Status: ${response.statusCode}');
      LogService.d('Character Name: ${response.body?.name}');

      if (response.isSuccessful && response.body != null) {
        return right(response.body!);
      } else {
        return left(InvalidCredentials(message: 'character_not_found'.tr()));
      }
    } catch (e, stack) {
      LogService.e('❌ Character Exception: ${e.toString()}');
      if (response != null) {
        LogService.e('❌ Error Response Status: ${response.statusCode}');
      }
      return left(handleError(e));
    }
  }

  @override
  Future<Either<ResponseFailure, BuiltList<Character>>> getMultipleCharacters(
    List<int> ids,
  ) async {
    Response<BuiltList<Character>>? response;

    try {
      final idsString = ids.join(',');
      response = await _rickMortyService.getMultipleCharacters(idsString);

      LogService.d(
        'Multiple Characters Response Status: ${response.statusCode}',
      );
      LogService.d('Multiple Characters Count: ${response.body?.length}');

      if (response.isSuccessful && response.body != null) {
        return right(response.body!);
      } else {
        return left(
          InvalidCredentials(message: 'failed_to_fetch_characters'.tr()),
        );
      }
    } catch (e, stack) {
      LogService.e('❌ Multiple Characters Exception: ${e.toString()}');
      if (response != null) {
        LogService.e('❌ Error Response Status: ${response.statusCode}');
      }
      return left(handleError(e));
    }
  }

  @override
  Future<Either<ResponseFailure, LocationsResponse>> getLocations({
    int? page,
    String? name,
    String? type,
    String? dimension,
  }) async {
    Response<LocationsResponse>? response;

    try {
      response = await _rickMortyService.getLocations(
        page: page,
        name: name,
        type: type,
        dimension: dimension,
      );

      LogService.d('Locations Response Status: ${response.statusCode}');
      LogService.d('Locations Count: ${response.body?.info.count}');

      if (response.isSuccessful && response.body != null) {
        return right(response.body!);
      } else {
        return left(
          InvalidCredentials(message: 'failed_to_fetch_locations'.tr()),
        );
      }
    } catch (e, stack) {
      LogService.e('❌ Locations Exception: ${e.toString()}');
      if (response != null) {
        LogService.e('❌ Error Response Status: ${response.statusCode}');
      }
      return left(handleError(e));
    }
  }

  @override
  Future<Either<ResponseFailure, Location>> getLocation(int id) async {
    Response<Location>? response;

    try {
      response = await _rickMortyService.getLocation(id);

      LogService.d('Location Response Status: ${response.statusCode}');
      LogService.d('Location Name: ${response.body?.name}');

      if (response.isSuccessful && response.body != null) {
        return right(response.body!);
      } else {
        return left(InvalidCredentials(message: 'location_not_found'.tr()));
      }
    } catch (e, stack) {
      LogService.e('❌ Location Exception: ${e.toString()}');
      if (response != null) {
        LogService.e('❌ Error Response Status: ${response.statusCode}');
      }
      return left(handleError(e));
    }
  }

  @override
  Future<Either<ResponseFailure, BuiltList<Location>>> getMultipleLocations(
    List<int> ids,
  ) async {
    Response<BuiltList<Location>>? response;

    try {
      final idsString = ids.join(',');
      response = await _rickMortyService.getMultipleLocations(idsString);

      LogService.d(
        'Multiple Locations Response Status: ${response.statusCode}',
      );
      LogService.d('Multiple Locations Count: ${response.body?.length}');

      if (response.isSuccessful && response.body != null) {
        return right(response.body!);
      } else {
        return left(
          InvalidCredentials(message: 'failed_to_fetch_locations'.tr()),
        );
      }
    } catch (e, stack) {
      LogService.e('❌ Multiple Locations Exception: ${e.toString()}');
      if (response != null) {
        LogService.e('❌ Error Response Status: ${response.statusCode}');
      }
      return left(handleError(e));
    }
  }

  @override
  Future<Either<ResponseFailure, EpisodesResponse>> getEpisodes({
    int? page,
    String? name,
    String? episode,
  }) async {
    Response<EpisodesResponse>? response;

    try {
      response = await _rickMortyService.getEpisodes(
        page: page,
        name: name,
        episode: episode,
      );

      LogService.d('Episodes Response Status: ${response.statusCode}');
      LogService.d('Episodes Count: ${response.body?.info.count}');

      if (response.isSuccessful && response.body != null) {
        return right(response.body!);
      } else {
        return left(
          InvalidCredentials(message: 'failed_to_fetch_episodes'.tr()),
        );
      }
    } catch (e, stack) {
      LogService.e('❌ Episodes Exception: ${e.toString()}');
      if (response != null) {
        LogService.e('❌ Error Response Status: ${response.statusCode}');
      }
      return left(handleError(e));
    }
  }

  @override
  Future<Either<ResponseFailure, Episode>> getEpisode(int id) async {
    Response<Episode>? response;

    try {
      response = await _rickMortyService.getEpisode(id);

      LogService.d('Episode Response Status: ${response.statusCode}');
      LogService.d('Episode Name: ${response.body?.name}');

      if (response.isSuccessful && response.body != null) {
        return right(response.body!);
      } else {
        return left(InvalidCredentials(message: 'episode_not_found'.tr()));
      }
    } catch (e, stack) {
      LogService.e('❌ Episode Exception: ${e.toString()}');
      if (response != null) {
        LogService.e('❌ Error Response Status: ${response.statusCode}');
      }
      return left(handleError(e));
    }
  }

  @override
  Future<Either<ResponseFailure, BuiltList<Episode>>> getMultipleEpisodes(
    List<int> ids,
  ) async {
    Response<BuiltList<Episode>>? response;

    try {
      final idsString = ids.join(',');
      response = await _rickMortyService.getMultipleEpisodes(idsString);

      LogService.d('Multiple Episodes Response Status: ${response.statusCode}');
      LogService.d('Multiple Episodes Count: ${response.body?.length}');

      if (response.isSuccessful && response.body != null) {
        return right(response.body!);
      } else {
        return left(
          InvalidCredentials(message: 'failed_to_fetch_episodes'.tr()),
        );
      }
    } catch (e, stack) {
      LogService.e('❌ Multiple Episodes Exception: ${e.toString()}');
      if (response != null) {
        LogService.e('❌ Error Response Status: ${response.statusCode}');
      }
      return left(handleError(e));
    }
  }

  @override
  Future<Either<ResponseFailure, Map<String, dynamic>>> getApiInfo() async {
    Response<Map<String, dynamic>>? response;

    try {
      response = await _rickMortyService.getApiInfo();

      LogService.d('API Info Response Status: ${response.statusCode}');

      if (response.isSuccessful && response.body != null) {
        return right(response.body!);
      } else {
        return left(
          InvalidCredentials(message: 'failed_to_fetch_api_info'.tr()),
        );
      }
    } catch (e, stack) {
      LogService.e('❌ API Info Exception: ${e.toString()}');
      if (response != null) {
        LogService.e('❌ Error Response Status: ${response.statusCode}');
      }
      return left(handleError(e));
    }
  }
}

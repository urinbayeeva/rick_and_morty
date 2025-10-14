// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'apis.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
final class _$RickMortyService extends RickMortyService {
  _$RickMortyService([ChopperClient? client]) {
    if (client == null) return;
    this.client = client;
  }

  @override
  final Type definitionType = RickMortyService;

  @override
  Future<Response<CharactersResponse>> getCharacters({
    int? page,
    String? name,
    String? status,
    String? species,
    String? type,
    String? gender,
  }) {
    final Uri $url = Uri.parse('/api/character');
    final Map<String, dynamic> $params = <String, dynamic>{
      'page': page,
      'name': name,
      'status': status,
      'species': species,
      'type': type,
      'gender': gender,
    };
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
      parameters: $params,
    );
    return client.send<CharactersResponse, CharactersResponse>($request);
  }

  @override
  Future<Response<Character>> getCharacter(int id) {
    final Uri $url = Uri.parse('/api/character/${id}');
    final Request $request = Request('GET', $url, client.baseUrl);
    return client.send<Character, Character>($request);
  }

  @override
  Future<Response<BuiltList<Character>>> getMultipleCharacters(String ids) {
    final Uri $url = Uri.parse('/api/character/${ids}');
    final Request $request = Request('GET', $url, client.baseUrl);
    return client.send<BuiltList<Character>, Character>($request);
  }

  @override
  Future<Response<LocationsResponse>> getLocations({
    int? page,
    String? name,
    String? type,
    String? dimension,
  }) {
    final Uri $url = Uri.parse('/api/location');
    final Map<String, dynamic> $params = <String, dynamic>{
      'page': page,
      'name': name,
      'type': type,
      'dimension': dimension,
    };
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
      parameters: $params,
    );
    return client.send<LocationsResponse, LocationsResponse>($request);
  }

  @override
  Future<Response<Location>> getLocation(int id) {
    final Uri $url = Uri.parse('/api/location/${id}');
    final Request $request = Request('GET', $url, client.baseUrl);
    return client.send<Location, Location>($request);
  }

  @override
  Future<Response<BuiltList<Location>>> getMultipleLocations(String ids) {
    final Uri $url = Uri.parse('/api/location/${ids}');
    final Request $request = Request('GET', $url, client.baseUrl);
    return client.send<BuiltList<Location>, Location>($request);
  }

  @override
  Future<Response<EpisodesResponse>> getEpisodes({
    int? page,
    String? name,
    String? episode,
  }) {
    final Uri $url = Uri.parse('/api/episode');
    final Map<String, dynamic> $params = <String, dynamic>{
      'page': page,
      'name': name,
      'episode': episode,
    };
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
      parameters: $params,
    );
    return client.send<EpisodesResponse, EpisodesResponse>($request);
  }

  @override
  Future<Response<Episode>> getEpisode(int id) {
    final Uri $url = Uri.parse('/api/episode/${id}');
    final Request $request = Request('GET', $url, client.baseUrl);
    return client.send<Episode, Episode>($request);
  }

  @override
  Future<Response<BuiltList<Episode>>> getMultipleEpisodes(String ids) {
    final Uri $url = Uri.parse('/api/episode/${ids}');
    final Request $request = Request('GET', $url, client.baseUrl);
    return client.send<BuiltList<Episode>, Episode>($request);
  }

  @override
  Future<Response<Map<String, dynamic>>> getApiInfo() {
    final Uri $url = Uri.parse('/api/');
    final Request $request = Request('GET', $url, client.baseUrl);
    return client.send<Map<String, dynamic>, Map<String, dynamic>>($request);
  }
}

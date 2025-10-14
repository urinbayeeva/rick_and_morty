import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:built_collection/built_collection.dart';

part 'rick_morty_models.g.dart';

abstract class ResponseInfo
    implements Built<ResponseInfo, ResponseInfoBuilder> {
  @BuiltValueField(wireName: 'count')
  int get count;

  @BuiltValueField(wireName: 'pages')
  int get pages;

  @BuiltValueField(wireName: 'next')
  String? get next;

  @BuiltValueField(wireName: 'prev')
  String? get prev;

  ResponseInfo._();

  factory ResponseInfo([void Function(ResponseInfoBuilder) updates]) =
      _$ResponseInfo;

  static Serializer<ResponseInfo> get serializer => _$responseInfoSerializer;
}

// Character models
abstract class CharactersResponse
    implements Built<CharactersResponse, CharactersResponseBuilder> {
  @BuiltValueField(wireName: 'info')
  ResponseInfo get info;

  @BuiltValueField(wireName: 'results')
  BuiltList<Character> get results;

  CharactersResponse._();

  factory CharactersResponse([
    void Function(CharactersResponseBuilder) updates,
  ]) = _$CharactersResponse;

  static Serializer<CharactersResponse> get serializer =>
      _$charactersResponseSerializer;
}

abstract class CharacterLocation
    implements Built<CharacterLocation, CharacterLocationBuilder> {
  @BuiltValueField(wireName: 'name')
  String get name;

  @BuiltValueField(wireName: 'url')
  String get url;

  CharacterLocation._();

  factory CharacterLocation([void Function(CharacterLocationBuilder) updates]) =
      _$CharacterLocation;

  static Serializer<CharacterLocation> get serializer =>
      _$characterLocationSerializer;
}

abstract class Character implements Built<Character, CharacterBuilder> {
  @BuiltValueField(wireName: 'id')
  int get id;

  @BuiltValueField(wireName: 'name')
  String get name;

  @BuiltValueField(wireName: 'status')
  String get status;

  @BuiltValueField(wireName: 'species')
  String get species;

  @BuiltValueField(wireName: 'type')
  String get type;

  @BuiltValueField(wireName: 'gender')
  String get gender;

  @BuiltValueField(wireName: 'origin')
  CharacterLocation get origin;

  @BuiltValueField(wireName: 'location')
  CharacterLocation get location;

  @BuiltValueField(wireName: 'image')
  String get image;

  @BuiltValueField(wireName: 'episode')
  BuiltList<String> get episode;

  @BuiltValueField(wireName: 'url')
  String get url;

  @BuiltValueField(wireName: 'created')
  String get created;

  Character._();

  factory Character([void Function(CharacterBuilder) updates]) = _$Character;

  static Serializer<Character> get serializer => _$characterSerializer;
}

abstract class LocationsResponse
    implements Built<LocationsResponse, LocationsResponseBuilder> {
  @BuiltValueField(wireName: 'info')
  ResponseInfo get info;

  @BuiltValueField(wireName: 'results')
  BuiltList<Location> get results;

  LocationsResponse._();

  factory LocationsResponse([void Function(LocationsResponseBuilder) updates]) =
      _$LocationsResponse;

  static Serializer<LocationsResponse> get serializer =>
      _$locationsResponseSerializer;
}

abstract class Location implements Built<Location, LocationBuilder> {
  @BuiltValueField(wireName: 'id')
  int get id;

  @BuiltValueField(wireName: 'name')
  String get name;

  @BuiltValueField(wireName: 'type')
  String get type;

  @BuiltValueField(wireName: 'dimension')
  String get dimension;

  @BuiltValueField(wireName: 'residents')
  BuiltList<String> get residents;

  @BuiltValueField(wireName: 'url')
  String get url;

  @BuiltValueField(wireName: 'created')
  String get created;

  Location._();

  factory Location([void Function(LocationBuilder) updates]) = _$Location;

  static Serializer<Location> get serializer => _$locationSerializer;
}

abstract class EpisodesResponse
    implements Built<EpisodesResponse, EpisodesResponseBuilder> {
  @BuiltValueField(wireName: 'info')
  ResponseInfo get info;

  @BuiltValueField(wireName: 'results')
  BuiltList<Episode> get results;

  EpisodesResponse._();

  factory EpisodesResponse([void Function(EpisodesResponseBuilder) updates]) =
      _$EpisodesResponse;

  static Serializer<EpisodesResponse> get serializer =>
      _$episodesResponseSerializer;
}

abstract class Episode implements Built<Episode, EpisodeBuilder> {
  @BuiltValueField(wireName: 'id')
  int get id;

  @BuiltValueField(wireName: 'name')
  String get name;

  @BuiltValueField(wireName: 'air_date')
  String get airDate;

  @BuiltValueField(wireName: 'episode')
  String get episode;

  @BuiltValueField(wireName: 'characters')
  BuiltList<String> get characters;

  @BuiltValueField(wireName: 'url')
  String get url;

  @BuiltValueField(wireName: 'created')
  String get created;

  Episode._();

  factory Episode([void Function(EpisodeBuilder) updates]) = _$Episode;

  static Serializer<Episode> get serializer => _$episodeSerializer;
}

abstract class CharacterFilter
    implements Built<CharacterFilter, CharacterFilterBuilder> {
  @BuiltValueField(wireName: 'name')
  String? get name;

  @BuiltValueField(wireName: 'status')
  String? get status;

  @BuiltValueField(wireName: 'species')
  String? get species;

  @BuiltValueField(wireName: 'type')
  String? get type;

  @BuiltValueField(wireName: 'gender')
  String? get gender;

  @BuiltValueField(wireName: 'page')
  int? get page;

  CharacterFilter._();

  factory CharacterFilter([void Function(CharacterFilterBuilder) updates]) =
      _$CharacterFilter;

  static Serializer<CharacterFilter> get serializer =>
      _$characterFilterSerializer;
}

abstract class LocationFilter
    implements Built<LocationFilter, LocationFilterBuilder> {
  @BuiltValueField(wireName: 'name')
  String? get name;

  @BuiltValueField(wireName: 'type')
  String? get type;

  @BuiltValueField(wireName: 'dimension')
  String? get dimension;

  @BuiltValueField(wireName: 'page')
  int? get page;

  LocationFilter._();

  factory LocationFilter([void Function(LocationFilterBuilder) updates]) =
      _$LocationFilter;

  static Serializer<LocationFilter> get serializer =>
      _$locationFilterSerializer;
}

abstract class EpisodeFilter
    implements Built<EpisodeFilter, EpisodeFilterBuilder> {
  @BuiltValueField(wireName: 'name')
  String? get name;

  @BuiltValueField(wireName: 'episode')
  String? get episode;

  @BuiltValueField(wireName: 'page')
  int? get page;

  EpisodeFilter._();

  factory EpisodeFilter([void Function(EpisodeFilterBuilder) updates]) =
      _$EpisodeFilter;

  static Serializer<EpisodeFilter> get serializer => _$episodeFilterSerializer;
}

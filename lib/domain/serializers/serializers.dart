import 'package:built_value/serializer.dart';
import 'package:built_collection/built_collection.dart';
import 'package:rick_and_morty/domain/models/rick_morty_models.dart';

part 'serializers.g.dart';

@SerializersFor([
  CharactersResponse,
  Character,
  CharacterLocation,
  LocationsResponse,
  Location,
  EpisodesResponse,
  Episode,
  ResponseInfo,
  CharacterFilter,
  LocationFilter,
  EpisodeFilter,
])
final Serializers serializers = _$serializers;

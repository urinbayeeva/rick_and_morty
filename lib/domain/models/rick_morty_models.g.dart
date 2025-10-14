// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rick_morty_models.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<ResponseInfo> _$responseInfoSerializer = _$ResponseInfoSerializer();
Serializer<CharactersResponse> _$charactersResponseSerializer =
    _$CharactersResponseSerializer();
Serializer<CharacterLocation> _$characterLocationSerializer =
    _$CharacterLocationSerializer();
Serializer<Character> _$characterSerializer = _$CharacterSerializer();
Serializer<LocationsResponse> _$locationsResponseSerializer =
    _$LocationsResponseSerializer();
Serializer<Location> _$locationSerializer = _$LocationSerializer();
Serializer<EpisodesResponse> _$episodesResponseSerializer =
    _$EpisodesResponseSerializer();
Serializer<Episode> _$episodeSerializer = _$EpisodeSerializer();
Serializer<CharacterFilter> _$characterFilterSerializer =
    _$CharacterFilterSerializer();
Serializer<LocationFilter> _$locationFilterSerializer =
    _$LocationFilterSerializer();
Serializer<EpisodeFilter> _$episodeFilterSerializer =
    _$EpisodeFilterSerializer();

class _$ResponseInfoSerializer implements StructuredSerializer<ResponseInfo> {
  @override
  final Iterable<Type> types = const [ResponseInfo, _$ResponseInfo];
  @override
  final String wireName = 'ResponseInfo';

  @override
  Iterable<Object?> serialize(
    Serializers serializers,
    ResponseInfo object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[
      'count',
      serializers.serialize(object.count, specifiedType: const FullType(int)),
      'pages',
      serializers.serialize(object.pages, specifiedType: const FullType(int)),
    ];
    Object? value;
    value = object.next;
    if (value != null) {
      result
        ..add('next')
        ..add(
          serializers.serialize(value, specifiedType: const FullType(String)),
        );
    }
    value = object.prev;
    if (value != null) {
      result
        ..add('prev')
        ..add(
          serializers.serialize(value, specifiedType: const FullType(String)),
        );
    }
    return result;
  }

  @override
  ResponseInfo deserialize(
    Serializers serializers,
    Iterable<Object?> serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = ResponseInfoBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'count':
          result.count =
              serializers.deserialize(
                    value,
                    specifiedType: const FullType(int),
                  )!
                  as int;
          break;
        case 'pages':
          result.pages =
              serializers.deserialize(
                    value,
                    specifiedType: const FullType(int),
                  )!
                  as int;
          break;
        case 'next':
          result.next =
              serializers.deserialize(
                    value,
                    specifiedType: const FullType(String),
                  )
                  as String?;
          break;
        case 'prev':
          result.prev =
              serializers.deserialize(
                    value,
                    specifiedType: const FullType(String),
                  )
                  as String?;
          break;
      }
    }

    return result.build();
  }
}

class _$CharactersResponseSerializer
    implements StructuredSerializer<CharactersResponse> {
  @override
  final Iterable<Type> types = const [CharactersResponse, _$CharactersResponse];
  @override
  final String wireName = 'CharactersResponse';

  @override
  Iterable<Object?> serialize(
    Serializers serializers,
    CharactersResponse object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[
      'info',
      serializers.serialize(
        object.info,
        specifiedType: const FullType(ResponseInfo),
      ),
      'results',
      serializers.serialize(
        object.results,
        specifiedType: const FullType(BuiltList, const [
          const FullType(Character),
        ]),
      ),
    ];

    return result;
  }

  @override
  CharactersResponse deserialize(
    Serializers serializers,
    Iterable<Object?> serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = CharactersResponseBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'info':
          result.info.replace(
            serializers.deserialize(
                  value,
                  specifiedType: const FullType(ResponseInfo),
                )!
                as ResponseInfo,
          );
          break;
        case 'results':
          result.results.replace(
            serializers.deserialize(
                  value,
                  specifiedType: const FullType(BuiltList, const [
                    const FullType(Character),
                  ]),
                )!
                as BuiltList<Object?>,
          );
          break;
      }
    }

    return result.build();
  }
}

class _$CharacterLocationSerializer
    implements StructuredSerializer<CharacterLocation> {
  @override
  final Iterable<Type> types = const [CharacterLocation, _$CharacterLocation];
  @override
  final String wireName = 'CharacterLocation';

  @override
  Iterable<Object?> serialize(
    Serializers serializers,
    CharacterLocation object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[
      'name',
      serializers.serialize(object.name, specifiedType: const FullType(String)),
      'url',
      serializers.serialize(object.url, specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  CharacterLocation deserialize(
    Serializers serializers,
    Iterable<Object?> serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = CharacterLocationBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'name':
          result.name =
              serializers.deserialize(
                    value,
                    specifiedType: const FullType(String),
                  )!
                  as String;
          break;
        case 'url':
          result.url =
              serializers.deserialize(
                    value,
                    specifiedType: const FullType(String),
                  )!
                  as String;
          break;
      }
    }

    return result.build();
  }
}

class _$CharacterSerializer implements StructuredSerializer<Character> {
  @override
  final Iterable<Type> types = const [Character, _$Character];
  @override
  final String wireName = 'Character';

  @override
  Iterable<Object?> serialize(
    Serializers serializers,
    Character object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[
      'id',
      serializers.serialize(object.id, specifiedType: const FullType(int)),
      'name',
      serializers.serialize(object.name, specifiedType: const FullType(String)),
      'status',
      serializers.serialize(
        object.status,
        specifiedType: const FullType(String),
      ),
      'species',
      serializers.serialize(
        object.species,
        specifiedType: const FullType(String),
      ),
      'type',
      serializers.serialize(object.type, specifiedType: const FullType(String)),
      'gender',
      serializers.serialize(
        object.gender,
        specifiedType: const FullType(String),
      ),
      'origin',
      serializers.serialize(
        object.origin,
        specifiedType: const FullType(CharacterLocation),
      ),
      'location',
      serializers.serialize(
        object.location,
        specifiedType: const FullType(CharacterLocation),
      ),
      'image',
      serializers.serialize(
        object.image,
        specifiedType: const FullType(String),
      ),
      'episode',
      serializers.serialize(
        object.episode,
        specifiedType: const FullType(BuiltList, const [
          const FullType(String),
        ]),
      ),
      'url',
      serializers.serialize(object.url, specifiedType: const FullType(String)),
      'created',
      serializers.serialize(
        object.created,
        specifiedType: const FullType(String),
      ),
    ];

    return result;
  }

  @override
  Character deserialize(
    Serializers serializers,
    Iterable<Object?> serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = CharacterBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'id':
          result.id =
              serializers.deserialize(
                    value,
                    specifiedType: const FullType(int),
                  )!
                  as int;
          break;
        case 'name':
          result.name =
              serializers.deserialize(
                    value,
                    specifiedType: const FullType(String),
                  )!
                  as String;
          break;
        case 'status':
          result.status =
              serializers.deserialize(
                    value,
                    specifiedType: const FullType(String),
                  )!
                  as String;
          break;
        case 'species':
          result.species =
              serializers.deserialize(
                    value,
                    specifiedType: const FullType(String),
                  )!
                  as String;
          break;
        case 'type':
          result.type =
              serializers.deserialize(
                    value,
                    specifiedType: const FullType(String),
                  )!
                  as String;
          break;
        case 'gender':
          result.gender =
              serializers.deserialize(
                    value,
                    specifiedType: const FullType(String),
                  )!
                  as String;
          break;
        case 'origin':
          result.origin.replace(
            serializers.deserialize(
                  value,
                  specifiedType: const FullType(CharacterLocation),
                )!
                as CharacterLocation,
          );
          break;
        case 'location':
          result.location.replace(
            serializers.deserialize(
                  value,
                  specifiedType: const FullType(CharacterLocation),
                )!
                as CharacterLocation,
          );
          break;
        case 'image':
          result.image =
              serializers.deserialize(
                    value,
                    specifiedType: const FullType(String),
                  )!
                  as String;
          break;
        case 'episode':
          result.episode.replace(
            serializers.deserialize(
                  value,
                  specifiedType: const FullType(BuiltList, const [
                    const FullType(String),
                  ]),
                )!
                as BuiltList<Object?>,
          );
          break;
        case 'url':
          result.url =
              serializers.deserialize(
                    value,
                    specifiedType: const FullType(String),
                  )!
                  as String;
          break;
        case 'created':
          result.created =
              serializers.deserialize(
                    value,
                    specifiedType: const FullType(String),
                  )!
                  as String;
          break;
      }
    }

    return result.build();
  }
}

class _$LocationsResponseSerializer
    implements StructuredSerializer<LocationsResponse> {
  @override
  final Iterable<Type> types = const [LocationsResponse, _$LocationsResponse];
  @override
  final String wireName = 'LocationsResponse';

  @override
  Iterable<Object?> serialize(
    Serializers serializers,
    LocationsResponse object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[
      'info',
      serializers.serialize(
        object.info,
        specifiedType: const FullType(ResponseInfo),
      ),
      'results',
      serializers.serialize(
        object.results,
        specifiedType: const FullType(BuiltList, const [
          const FullType(Location),
        ]),
      ),
    ];

    return result;
  }

  @override
  LocationsResponse deserialize(
    Serializers serializers,
    Iterable<Object?> serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = LocationsResponseBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'info':
          result.info.replace(
            serializers.deserialize(
                  value,
                  specifiedType: const FullType(ResponseInfo),
                )!
                as ResponseInfo,
          );
          break;
        case 'results':
          result.results.replace(
            serializers.deserialize(
                  value,
                  specifiedType: const FullType(BuiltList, const [
                    const FullType(Location),
                  ]),
                )!
                as BuiltList<Object?>,
          );
          break;
      }
    }

    return result.build();
  }
}

class _$LocationSerializer implements StructuredSerializer<Location> {
  @override
  final Iterable<Type> types = const [Location, _$Location];
  @override
  final String wireName = 'Location';

  @override
  Iterable<Object?> serialize(
    Serializers serializers,
    Location object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[
      'id',
      serializers.serialize(object.id, specifiedType: const FullType(int)),
      'name',
      serializers.serialize(object.name, specifiedType: const FullType(String)),
      'type',
      serializers.serialize(object.type, specifiedType: const FullType(String)),
      'dimension',
      serializers.serialize(
        object.dimension,
        specifiedType: const FullType(String),
      ),
      'residents',
      serializers.serialize(
        object.residents,
        specifiedType: const FullType(BuiltList, const [
          const FullType(String),
        ]),
      ),
      'url',
      serializers.serialize(object.url, specifiedType: const FullType(String)),
      'created',
      serializers.serialize(
        object.created,
        specifiedType: const FullType(String),
      ),
    ];

    return result;
  }

  @override
  Location deserialize(
    Serializers serializers,
    Iterable<Object?> serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = LocationBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'id':
          result.id =
              serializers.deserialize(
                    value,
                    specifiedType: const FullType(int),
                  )!
                  as int;
          break;
        case 'name':
          result.name =
              serializers.deserialize(
                    value,
                    specifiedType: const FullType(String),
                  )!
                  as String;
          break;
        case 'type':
          result.type =
              serializers.deserialize(
                    value,
                    specifiedType: const FullType(String),
                  )!
                  as String;
          break;
        case 'dimension':
          result.dimension =
              serializers.deserialize(
                    value,
                    specifiedType: const FullType(String),
                  )!
                  as String;
          break;
        case 'residents':
          result.residents.replace(
            serializers.deserialize(
                  value,
                  specifiedType: const FullType(BuiltList, const [
                    const FullType(String),
                  ]),
                )!
                as BuiltList<Object?>,
          );
          break;
        case 'url':
          result.url =
              serializers.deserialize(
                    value,
                    specifiedType: const FullType(String),
                  )!
                  as String;
          break;
        case 'created':
          result.created =
              serializers.deserialize(
                    value,
                    specifiedType: const FullType(String),
                  )!
                  as String;
          break;
      }
    }

    return result.build();
  }
}

class _$EpisodesResponseSerializer
    implements StructuredSerializer<EpisodesResponse> {
  @override
  final Iterable<Type> types = const [EpisodesResponse, _$EpisodesResponse];
  @override
  final String wireName = 'EpisodesResponse';

  @override
  Iterable<Object?> serialize(
    Serializers serializers,
    EpisodesResponse object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[
      'info',
      serializers.serialize(
        object.info,
        specifiedType: const FullType(ResponseInfo),
      ),
      'results',
      serializers.serialize(
        object.results,
        specifiedType: const FullType(BuiltList, const [
          const FullType(Episode),
        ]),
      ),
    ];

    return result;
  }

  @override
  EpisodesResponse deserialize(
    Serializers serializers,
    Iterable<Object?> serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = EpisodesResponseBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'info':
          result.info.replace(
            serializers.deserialize(
                  value,
                  specifiedType: const FullType(ResponseInfo),
                )!
                as ResponseInfo,
          );
          break;
        case 'results':
          result.results.replace(
            serializers.deserialize(
                  value,
                  specifiedType: const FullType(BuiltList, const [
                    const FullType(Episode),
                  ]),
                )!
                as BuiltList<Object?>,
          );
          break;
      }
    }

    return result.build();
  }
}

class _$EpisodeSerializer implements StructuredSerializer<Episode> {
  @override
  final Iterable<Type> types = const [Episode, _$Episode];
  @override
  final String wireName = 'Episode';

  @override
  Iterable<Object?> serialize(
    Serializers serializers,
    Episode object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[
      'id',
      serializers.serialize(object.id, specifiedType: const FullType(int)),
      'name',
      serializers.serialize(object.name, specifiedType: const FullType(String)),
      'air_date',
      serializers.serialize(
        object.airDate,
        specifiedType: const FullType(String),
      ),
      'episode',
      serializers.serialize(
        object.episode,
        specifiedType: const FullType(String),
      ),
      'characters',
      serializers.serialize(
        object.characters,
        specifiedType: const FullType(BuiltList, const [
          const FullType(String),
        ]),
      ),
      'url',
      serializers.serialize(object.url, specifiedType: const FullType(String)),
      'created',
      serializers.serialize(
        object.created,
        specifiedType: const FullType(String),
      ),
    ];

    return result;
  }

  @override
  Episode deserialize(
    Serializers serializers,
    Iterable<Object?> serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = EpisodeBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'id':
          result.id =
              serializers.deserialize(
                    value,
                    specifiedType: const FullType(int),
                  )!
                  as int;
          break;
        case 'name':
          result.name =
              serializers.deserialize(
                    value,
                    specifiedType: const FullType(String),
                  )!
                  as String;
          break;
        case 'air_date':
          result.airDate =
              serializers.deserialize(
                    value,
                    specifiedType: const FullType(String),
                  )!
                  as String;
          break;
        case 'episode':
          result.episode =
              serializers.deserialize(
                    value,
                    specifiedType: const FullType(String),
                  )!
                  as String;
          break;
        case 'characters':
          result.characters.replace(
            serializers.deserialize(
                  value,
                  specifiedType: const FullType(BuiltList, const [
                    const FullType(String),
                  ]),
                )!
                as BuiltList<Object?>,
          );
          break;
        case 'url':
          result.url =
              serializers.deserialize(
                    value,
                    specifiedType: const FullType(String),
                  )!
                  as String;
          break;
        case 'created':
          result.created =
              serializers.deserialize(
                    value,
                    specifiedType: const FullType(String),
                  )!
                  as String;
          break;
      }
    }

    return result.build();
  }
}

class _$CharacterFilterSerializer
    implements StructuredSerializer<CharacterFilter> {
  @override
  final Iterable<Type> types = const [CharacterFilter, _$CharacterFilter];
  @override
  final String wireName = 'CharacterFilter';

  @override
  Iterable<Object?> serialize(
    Serializers serializers,
    CharacterFilter object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[];
    Object? value;
    value = object.name;
    if (value != null) {
      result
        ..add('name')
        ..add(
          serializers.serialize(value, specifiedType: const FullType(String)),
        );
    }
    value = object.status;
    if (value != null) {
      result
        ..add('status')
        ..add(
          serializers.serialize(value, specifiedType: const FullType(String)),
        );
    }
    value = object.species;
    if (value != null) {
      result
        ..add('species')
        ..add(
          serializers.serialize(value, specifiedType: const FullType(String)),
        );
    }
    value = object.type;
    if (value != null) {
      result
        ..add('type')
        ..add(
          serializers.serialize(value, specifiedType: const FullType(String)),
        );
    }
    value = object.gender;
    if (value != null) {
      result
        ..add('gender')
        ..add(
          serializers.serialize(value, specifiedType: const FullType(String)),
        );
    }
    value = object.page;
    if (value != null) {
      result
        ..add('page')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    return result;
  }

  @override
  CharacterFilter deserialize(
    Serializers serializers,
    Iterable<Object?> serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = CharacterFilterBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'name':
          result.name =
              serializers.deserialize(
                    value,
                    specifiedType: const FullType(String),
                  )
                  as String?;
          break;
        case 'status':
          result.status =
              serializers.deserialize(
                    value,
                    specifiedType: const FullType(String),
                  )
                  as String?;
          break;
        case 'species':
          result.species =
              serializers.deserialize(
                    value,
                    specifiedType: const FullType(String),
                  )
                  as String?;
          break;
        case 'type':
          result.type =
              serializers.deserialize(
                    value,
                    specifiedType: const FullType(String),
                  )
                  as String?;
          break;
        case 'gender':
          result.gender =
              serializers.deserialize(
                    value,
                    specifiedType: const FullType(String),
                  )
                  as String?;
          break;
        case 'page':
          result.page =
              serializers.deserialize(value, specifiedType: const FullType(int))
                  as int?;
          break;
      }
    }

    return result.build();
  }
}

class _$LocationFilterSerializer
    implements StructuredSerializer<LocationFilter> {
  @override
  final Iterable<Type> types = const [LocationFilter, _$LocationFilter];
  @override
  final String wireName = 'LocationFilter';

  @override
  Iterable<Object?> serialize(
    Serializers serializers,
    LocationFilter object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[];
    Object? value;
    value = object.name;
    if (value != null) {
      result
        ..add('name')
        ..add(
          serializers.serialize(value, specifiedType: const FullType(String)),
        );
    }
    value = object.type;
    if (value != null) {
      result
        ..add('type')
        ..add(
          serializers.serialize(value, specifiedType: const FullType(String)),
        );
    }
    value = object.dimension;
    if (value != null) {
      result
        ..add('dimension')
        ..add(
          serializers.serialize(value, specifiedType: const FullType(String)),
        );
    }
    value = object.page;
    if (value != null) {
      result
        ..add('page')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    return result;
  }

  @override
  LocationFilter deserialize(
    Serializers serializers,
    Iterable<Object?> serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = LocationFilterBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'name':
          result.name =
              serializers.deserialize(
                    value,
                    specifiedType: const FullType(String),
                  )
                  as String?;
          break;
        case 'type':
          result.type =
              serializers.deserialize(
                    value,
                    specifiedType: const FullType(String),
                  )
                  as String?;
          break;
        case 'dimension':
          result.dimension =
              serializers.deserialize(
                    value,
                    specifiedType: const FullType(String),
                  )
                  as String?;
          break;
        case 'page':
          result.page =
              serializers.deserialize(value, specifiedType: const FullType(int))
                  as int?;
          break;
      }
    }

    return result.build();
  }
}

class _$EpisodeFilterSerializer implements StructuredSerializer<EpisodeFilter> {
  @override
  final Iterable<Type> types = const [EpisodeFilter, _$EpisodeFilter];
  @override
  final String wireName = 'EpisodeFilter';

  @override
  Iterable<Object?> serialize(
    Serializers serializers,
    EpisodeFilter object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[];
    Object? value;
    value = object.name;
    if (value != null) {
      result
        ..add('name')
        ..add(
          serializers.serialize(value, specifiedType: const FullType(String)),
        );
    }
    value = object.episode;
    if (value != null) {
      result
        ..add('episode')
        ..add(
          serializers.serialize(value, specifiedType: const FullType(String)),
        );
    }
    value = object.page;
    if (value != null) {
      result
        ..add('page')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    return result;
  }

  @override
  EpisodeFilter deserialize(
    Serializers serializers,
    Iterable<Object?> serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = EpisodeFilterBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'name':
          result.name =
              serializers.deserialize(
                    value,
                    specifiedType: const FullType(String),
                  )
                  as String?;
          break;
        case 'episode':
          result.episode =
              serializers.deserialize(
                    value,
                    specifiedType: const FullType(String),
                  )
                  as String?;
          break;
        case 'page':
          result.page =
              serializers.deserialize(value, specifiedType: const FullType(int))
                  as int?;
          break;
      }
    }

    return result.build();
  }
}

class _$ResponseInfo extends ResponseInfo {
  @override
  final int count;
  @override
  final int pages;
  @override
  final String? next;
  @override
  final String? prev;

  factory _$ResponseInfo([void Function(ResponseInfoBuilder)? updates]) =>
      (ResponseInfoBuilder()..update(updates))._build();

  _$ResponseInfo._({
    required this.count,
    required this.pages,
    this.next,
    this.prev,
  }) : super._();
  @override
  ResponseInfo rebuild(void Function(ResponseInfoBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ResponseInfoBuilder toBuilder() => ResponseInfoBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ResponseInfo &&
        count == other.count &&
        pages == other.pages &&
        next == other.next &&
        prev == other.prev;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, count.hashCode);
    _$hash = $jc(_$hash, pages.hashCode);
    _$hash = $jc(_$hash, next.hashCode);
    _$hash = $jc(_$hash, prev.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ResponseInfo')
          ..add('count', count)
          ..add('pages', pages)
          ..add('next', next)
          ..add('prev', prev))
        .toString();
  }
}

class ResponseInfoBuilder
    implements Builder<ResponseInfo, ResponseInfoBuilder> {
  _$ResponseInfo? _$v;

  int? _count;
  int? get count => _$this._count;
  set count(int? count) => _$this._count = count;

  int? _pages;
  int? get pages => _$this._pages;
  set pages(int? pages) => _$this._pages = pages;

  String? _next;
  String? get next => _$this._next;
  set next(String? next) => _$this._next = next;

  String? _prev;
  String? get prev => _$this._prev;
  set prev(String? prev) => _$this._prev = prev;

  ResponseInfoBuilder();

  ResponseInfoBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _count = $v.count;
      _pages = $v.pages;
      _next = $v.next;
      _prev = $v.prev;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ResponseInfo other) {
    _$v = other as _$ResponseInfo;
  }

  @override
  void update(void Function(ResponseInfoBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ResponseInfo build() => _build();

  _$ResponseInfo _build() {
    final _$result =
        _$v ??
        _$ResponseInfo._(
          count: BuiltValueNullFieldError.checkNotNull(
            count,
            r'ResponseInfo',
            'count',
          ),
          pages: BuiltValueNullFieldError.checkNotNull(
            pages,
            r'ResponseInfo',
            'pages',
          ),
          next: next,
          prev: prev,
        );
    replace(_$result);
    return _$result;
  }
}

class _$CharactersResponse extends CharactersResponse {
  @override
  final ResponseInfo info;
  @override
  final BuiltList<Character> results;

  factory _$CharactersResponse([
    void Function(CharactersResponseBuilder)? updates,
  ]) => (CharactersResponseBuilder()..update(updates))._build();

  _$CharactersResponse._({required this.info, required this.results})
    : super._();
  @override
  CharactersResponse rebuild(
    void Function(CharactersResponseBuilder) updates,
  ) => (toBuilder()..update(updates)).build();

  @override
  CharactersResponseBuilder toBuilder() =>
      CharactersResponseBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is CharactersResponse &&
        info == other.info &&
        results == other.results;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, info.hashCode);
    _$hash = $jc(_$hash, results.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'CharactersResponse')
          ..add('info', info)
          ..add('results', results))
        .toString();
  }
}

class CharactersResponseBuilder
    implements Builder<CharactersResponse, CharactersResponseBuilder> {
  _$CharactersResponse? _$v;

  ResponseInfoBuilder? _info;
  ResponseInfoBuilder get info => _$this._info ??= ResponseInfoBuilder();
  set info(ResponseInfoBuilder? info) => _$this._info = info;

  ListBuilder<Character>? _results;
  ListBuilder<Character> get results =>
      _$this._results ??= ListBuilder<Character>();
  set results(ListBuilder<Character>? results) => _$this._results = results;

  CharactersResponseBuilder();

  CharactersResponseBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _info = $v.info.toBuilder();
      _results = $v.results.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(CharactersResponse other) {
    _$v = other as _$CharactersResponse;
  }

  @override
  void update(void Function(CharactersResponseBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  CharactersResponse build() => _build();

  _$CharactersResponse _build() {
    _$CharactersResponse _$result;
    try {
      _$result =
          _$v ??
          _$CharactersResponse._(info: info.build(), results: results.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'info';
        info.build();
        _$failedField = 'results';
        results.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
          r'CharactersResponse',
          _$failedField,
          e.toString(),
        );
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$CharacterLocation extends CharacterLocation {
  @override
  final String name;
  @override
  final String url;

  factory _$CharacterLocation([
    void Function(CharacterLocationBuilder)? updates,
  ]) => (CharacterLocationBuilder()..update(updates))._build();

  _$CharacterLocation._({required this.name, required this.url}) : super._();
  @override
  CharacterLocation rebuild(void Function(CharacterLocationBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  CharacterLocationBuilder toBuilder() =>
      CharacterLocationBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is CharacterLocation && name == other.name && url == other.url;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jc(_$hash, url.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'CharacterLocation')
          ..add('name', name)
          ..add('url', url))
        .toString();
  }
}

class CharacterLocationBuilder
    implements Builder<CharacterLocation, CharacterLocationBuilder> {
  _$CharacterLocation? _$v;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  String? _url;
  String? get url => _$this._url;
  set url(String? url) => _$this._url = url;

  CharacterLocationBuilder();

  CharacterLocationBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _name = $v.name;
      _url = $v.url;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(CharacterLocation other) {
    _$v = other as _$CharacterLocation;
  }

  @override
  void update(void Function(CharacterLocationBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  CharacterLocation build() => _build();

  _$CharacterLocation _build() {
    final _$result =
        _$v ??
        _$CharacterLocation._(
          name: BuiltValueNullFieldError.checkNotNull(
            name,
            r'CharacterLocation',
            'name',
          ),
          url: BuiltValueNullFieldError.checkNotNull(
            url,
            r'CharacterLocation',
            'url',
          ),
        );
    replace(_$result);
    return _$result;
  }
}

class _$Character extends Character {
  @override
  final int id;
  @override
  final String name;
  @override
  final String status;
  @override
  final String species;
  @override
  final String type;
  @override
  final String gender;
  @override
  final CharacterLocation origin;
  @override
  final CharacterLocation location;
  @override
  final String image;
  @override
  final BuiltList<String> episode;
  @override
  final String url;
  @override
  final String created;

  factory _$Character([void Function(CharacterBuilder)? updates]) =>
      (CharacterBuilder()..update(updates))._build();

  _$Character._({
    required this.id,
    required this.name,
    required this.status,
    required this.species,
    required this.type,
    required this.gender,
    required this.origin,
    required this.location,
    required this.image,
    required this.episode,
    required this.url,
    required this.created,
  }) : super._();
  @override
  Character rebuild(void Function(CharacterBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  CharacterBuilder toBuilder() => CharacterBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Character &&
        id == other.id &&
        name == other.name &&
        status == other.status &&
        species == other.species &&
        type == other.type &&
        gender == other.gender &&
        origin == other.origin &&
        location == other.location &&
        image == other.image &&
        episode == other.episode &&
        url == other.url &&
        created == other.created;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jc(_$hash, status.hashCode);
    _$hash = $jc(_$hash, species.hashCode);
    _$hash = $jc(_$hash, type.hashCode);
    _$hash = $jc(_$hash, gender.hashCode);
    _$hash = $jc(_$hash, origin.hashCode);
    _$hash = $jc(_$hash, location.hashCode);
    _$hash = $jc(_$hash, image.hashCode);
    _$hash = $jc(_$hash, episode.hashCode);
    _$hash = $jc(_$hash, url.hashCode);
    _$hash = $jc(_$hash, created.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'Character')
          ..add('id', id)
          ..add('name', name)
          ..add('status', status)
          ..add('species', species)
          ..add('type', type)
          ..add('gender', gender)
          ..add('origin', origin)
          ..add('location', location)
          ..add('image', image)
          ..add('episode', episode)
          ..add('url', url)
          ..add('created', created))
        .toString();
  }
}

class CharacterBuilder implements Builder<Character, CharacterBuilder> {
  _$Character? _$v;

  int? _id;
  int? get id => _$this._id;
  set id(int? id) => _$this._id = id;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  String? _status;
  String? get status => _$this._status;
  set status(String? status) => _$this._status = status;

  String? _species;
  String? get species => _$this._species;
  set species(String? species) => _$this._species = species;

  String? _type;
  String? get type => _$this._type;
  set type(String? type) => _$this._type = type;

  String? _gender;
  String? get gender => _$this._gender;
  set gender(String? gender) => _$this._gender = gender;

  CharacterLocationBuilder? _origin;
  CharacterLocationBuilder get origin =>
      _$this._origin ??= CharacterLocationBuilder();
  set origin(CharacterLocationBuilder? origin) => _$this._origin = origin;

  CharacterLocationBuilder? _location;
  CharacterLocationBuilder get location =>
      _$this._location ??= CharacterLocationBuilder();
  set location(CharacterLocationBuilder? location) =>
      _$this._location = location;

  String? _image;
  String? get image => _$this._image;
  set image(String? image) => _$this._image = image;

  ListBuilder<String>? _episode;
  ListBuilder<String> get episode => _$this._episode ??= ListBuilder<String>();
  set episode(ListBuilder<String>? episode) => _$this._episode = episode;

  String? _url;
  String? get url => _$this._url;
  set url(String? url) => _$this._url = url;

  String? _created;
  String? get created => _$this._created;
  set created(String? created) => _$this._created = created;

  CharacterBuilder();

  CharacterBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _name = $v.name;
      _status = $v.status;
      _species = $v.species;
      _type = $v.type;
      _gender = $v.gender;
      _origin = $v.origin.toBuilder();
      _location = $v.location.toBuilder();
      _image = $v.image;
      _episode = $v.episode.toBuilder();
      _url = $v.url;
      _created = $v.created;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Character other) {
    _$v = other as _$Character;
  }

  @override
  void update(void Function(CharacterBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  Character build() => _build();

  _$Character _build() {
    _$Character _$result;
    try {
      _$result =
          _$v ??
          _$Character._(
            id: BuiltValueNullFieldError.checkNotNull(id, r'Character', 'id'),
            name: BuiltValueNullFieldError.checkNotNull(
              name,
              r'Character',
              'name',
            ),
            status: BuiltValueNullFieldError.checkNotNull(
              status,
              r'Character',
              'status',
            ),
            species: BuiltValueNullFieldError.checkNotNull(
              species,
              r'Character',
              'species',
            ),
            type: BuiltValueNullFieldError.checkNotNull(
              type,
              r'Character',
              'type',
            ),
            gender: BuiltValueNullFieldError.checkNotNull(
              gender,
              r'Character',
              'gender',
            ),
            origin: origin.build(),
            location: location.build(),
            image: BuiltValueNullFieldError.checkNotNull(
              image,
              r'Character',
              'image',
            ),
            episode: episode.build(),
            url: BuiltValueNullFieldError.checkNotNull(
              url,
              r'Character',
              'url',
            ),
            created: BuiltValueNullFieldError.checkNotNull(
              created,
              r'Character',
              'created',
            ),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'origin';
        origin.build();
        _$failedField = 'location';
        location.build();

        _$failedField = 'episode';
        episode.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
          r'Character',
          _$failedField,
          e.toString(),
        );
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$LocationsResponse extends LocationsResponse {
  @override
  final ResponseInfo info;
  @override
  final BuiltList<Location> results;

  factory _$LocationsResponse([
    void Function(LocationsResponseBuilder)? updates,
  ]) => (LocationsResponseBuilder()..update(updates))._build();

  _$LocationsResponse._({required this.info, required this.results})
    : super._();
  @override
  LocationsResponse rebuild(void Function(LocationsResponseBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  LocationsResponseBuilder toBuilder() =>
      LocationsResponseBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is LocationsResponse &&
        info == other.info &&
        results == other.results;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, info.hashCode);
    _$hash = $jc(_$hash, results.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'LocationsResponse')
          ..add('info', info)
          ..add('results', results))
        .toString();
  }
}

class LocationsResponseBuilder
    implements Builder<LocationsResponse, LocationsResponseBuilder> {
  _$LocationsResponse? _$v;

  ResponseInfoBuilder? _info;
  ResponseInfoBuilder get info => _$this._info ??= ResponseInfoBuilder();
  set info(ResponseInfoBuilder? info) => _$this._info = info;

  ListBuilder<Location>? _results;
  ListBuilder<Location> get results =>
      _$this._results ??= ListBuilder<Location>();
  set results(ListBuilder<Location>? results) => _$this._results = results;

  LocationsResponseBuilder();

  LocationsResponseBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _info = $v.info.toBuilder();
      _results = $v.results.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(LocationsResponse other) {
    _$v = other as _$LocationsResponse;
  }

  @override
  void update(void Function(LocationsResponseBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  LocationsResponse build() => _build();

  _$LocationsResponse _build() {
    _$LocationsResponse _$result;
    try {
      _$result =
          _$v ??
          _$LocationsResponse._(info: info.build(), results: results.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'info';
        info.build();
        _$failedField = 'results';
        results.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
          r'LocationsResponse',
          _$failedField,
          e.toString(),
        );
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$Location extends Location {
  @override
  final int id;
  @override
  final String name;
  @override
  final String type;
  @override
  final String dimension;
  @override
  final BuiltList<String> residents;
  @override
  final String url;
  @override
  final String created;

  factory _$Location([void Function(LocationBuilder)? updates]) =>
      (LocationBuilder()..update(updates))._build();

  _$Location._({
    required this.id,
    required this.name,
    required this.type,
    required this.dimension,
    required this.residents,
    required this.url,
    required this.created,
  }) : super._();
  @override
  Location rebuild(void Function(LocationBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  LocationBuilder toBuilder() => LocationBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Location &&
        id == other.id &&
        name == other.name &&
        type == other.type &&
        dimension == other.dimension &&
        residents == other.residents &&
        url == other.url &&
        created == other.created;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jc(_$hash, type.hashCode);
    _$hash = $jc(_$hash, dimension.hashCode);
    _$hash = $jc(_$hash, residents.hashCode);
    _$hash = $jc(_$hash, url.hashCode);
    _$hash = $jc(_$hash, created.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'Location')
          ..add('id', id)
          ..add('name', name)
          ..add('type', type)
          ..add('dimension', dimension)
          ..add('residents', residents)
          ..add('url', url)
          ..add('created', created))
        .toString();
  }
}

class LocationBuilder implements Builder<Location, LocationBuilder> {
  _$Location? _$v;

  int? _id;
  int? get id => _$this._id;
  set id(int? id) => _$this._id = id;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  String? _type;
  String? get type => _$this._type;
  set type(String? type) => _$this._type = type;

  String? _dimension;
  String? get dimension => _$this._dimension;
  set dimension(String? dimension) => _$this._dimension = dimension;

  ListBuilder<String>? _residents;
  ListBuilder<String> get residents =>
      _$this._residents ??= ListBuilder<String>();
  set residents(ListBuilder<String>? residents) =>
      _$this._residents = residents;

  String? _url;
  String? get url => _$this._url;
  set url(String? url) => _$this._url = url;

  String? _created;
  String? get created => _$this._created;
  set created(String? created) => _$this._created = created;

  LocationBuilder();

  LocationBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _name = $v.name;
      _type = $v.type;
      _dimension = $v.dimension;
      _residents = $v.residents.toBuilder();
      _url = $v.url;
      _created = $v.created;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Location other) {
    _$v = other as _$Location;
  }

  @override
  void update(void Function(LocationBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  Location build() => _build();

  _$Location _build() {
    _$Location _$result;
    try {
      _$result =
          _$v ??
          _$Location._(
            id: BuiltValueNullFieldError.checkNotNull(id, r'Location', 'id'),
            name: BuiltValueNullFieldError.checkNotNull(
              name,
              r'Location',
              'name',
            ),
            type: BuiltValueNullFieldError.checkNotNull(
              type,
              r'Location',
              'type',
            ),
            dimension: BuiltValueNullFieldError.checkNotNull(
              dimension,
              r'Location',
              'dimension',
            ),
            residents: residents.build(),
            url: BuiltValueNullFieldError.checkNotNull(url, r'Location', 'url'),
            created: BuiltValueNullFieldError.checkNotNull(
              created,
              r'Location',
              'created',
            ),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'residents';
        residents.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
          r'Location',
          _$failedField,
          e.toString(),
        );
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$EpisodesResponse extends EpisodesResponse {
  @override
  final ResponseInfo info;
  @override
  final BuiltList<Episode> results;

  factory _$EpisodesResponse([
    void Function(EpisodesResponseBuilder)? updates,
  ]) => (EpisodesResponseBuilder()..update(updates))._build();

  _$EpisodesResponse._({required this.info, required this.results}) : super._();
  @override
  EpisodesResponse rebuild(void Function(EpisodesResponseBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  EpisodesResponseBuilder toBuilder() =>
      EpisodesResponseBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is EpisodesResponse &&
        info == other.info &&
        results == other.results;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, info.hashCode);
    _$hash = $jc(_$hash, results.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'EpisodesResponse')
          ..add('info', info)
          ..add('results', results))
        .toString();
  }
}

class EpisodesResponseBuilder
    implements Builder<EpisodesResponse, EpisodesResponseBuilder> {
  _$EpisodesResponse? _$v;

  ResponseInfoBuilder? _info;
  ResponseInfoBuilder get info => _$this._info ??= ResponseInfoBuilder();
  set info(ResponseInfoBuilder? info) => _$this._info = info;

  ListBuilder<Episode>? _results;
  ListBuilder<Episode> get results =>
      _$this._results ??= ListBuilder<Episode>();
  set results(ListBuilder<Episode>? results) => _$this._results = results;

  EpisodesResponseBuilder();

  EpisodesResponseBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _info = $v.info.toBuilder();
      _results = $v.results.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(EpisodesResponse other) {
    _$v = other as _$EpisodesResponse;
  }

  @override
  void update(void Function(EpisodesResponseBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  EpisodesResponse build() => _build();

  _$EpisodesResponse _build() {
    _$EpisodesResponse _$result;
    try {
      _$result =
          _$v ??
          _$EpisodesResponse._(info: info.build(), results: results.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'info';
        info.build();
        _$failedField = 'results';
        results.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
          r'EpisodesResponse',
          _$failedField,
          e.toString(),
        );
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$Episode extends Episode {
  @override
  final int id;
  @override
  final String name;
  @override
  final String airDate;
  @override
  final String episode;
  @override
  final BuiltList<String> characters;
  @override
  final String url;
  @override
  final String created;

  factory _$Episode([void Function(EpisodeBuilder)? updates]) =>
      (EpisodeBuilder()..update(updates))._build();

  _$Episode._({
    required this.id,
    required this.name,
    required this.airDate,
    required this.episode,
    required this.characters,
    required this.url,
    required this.created,
  }) : super._();
  @override
  Episode rebuild(void Function(EpisodeBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  EpisodeBuilder toBuilder() => EpisodeBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Episode &&
        id == other.id &&
        name == other.name &&
        airDate == other.airDate &&
        episode == other.episode &&
        characters == other.characters &&
        url == other.url &&
        created == other.created;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jc(_$hash, airDate.hashCode);
    _$hash = $jc(_$hash, episode.hashCode);
    _$hash = $jc(_$hash, characters.hashCode);
    _$hash = $jc(_$hash, url.hashCode);
    _$hash = $jc(_$hash, created.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'Episode')
          ..add('id', id)
          ..add('name', name)
          ..add('airDate', airDate)
          ..add('episode', episode)
          ..add('characters', characters)
          ..add('url', url)
          ..add('created', created))
        .toString();
  }
}

class EpisodeBuilder implements Builder<Episode, EpisodeBuilder> {
  _$Episode? _$v;

  int? _id;
  int? get id => _$this._id;
  set id(int? id) => _$this._id = id;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  String? _airDate;
  String? get airDate => _$this._airDate;
  set airDate(String? airDate) => _$this._airDate = airDate;

  String? _episode;
  String? get episode => _$this._episode;
  set episode(String? episode) => _$this._episode = episode;

  ListBuilder<String>? _characters;
  ListBuilder<String> get characters =>
      _$this._characters ??= ListBuilder<String>();
  set characters(ListBuilder<String>? characters) =>
      _$this._characters = characters;

  String? _url;
  String? get url => _$this._url;
  set url(String? url) => _$this._url = url;

  String? _created;
  String? get created => _$this._created;
  set created(String? created) => _$this._created = created;

  EpisodeBuilder();

  EpisodeBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _name = $v.name;
      _airDate = $v.airDate;
      _episode = $v.episode;
      _characters = $v.characters.toBuilder();
      _url = $v.url;
      _created = $v.created;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Episode other) {
    _$v = other as _$Episode;
  }

  @override
  void update(void Function(EpisodeBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  Episode build() => _build();

  _$Episode _build() {
    _$Episode _$result;
    try {
      _$result =
          _$v ??
          _$Episode._(
            id: BuiltValueNullFieldError.checkNotNull(id, r'Episode', 'id'),
            name: BuiltValueNullFieldError.checkNotNull(
              name,
              r'Episode',
              'name',
            ),
            airDate: BuiltValueNullFieldError.checkNotNull(
              airDate,
              r'Episode',
              'airDate',
            ),
            episode: BuiltValueNullFieldError.checkNotNull(
              episode,
              r'Episode',
              'episode',
            ),
            characters: characters.build(),
            url: BuiltValueNullFieldError.checkNotNull(url, r'Episode', 'url'),
            created: BuiltValueNullFieldError.checkNotNull(
              created,
              r'Episode',
              'created',
            ),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'characters';
        characters.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
          r'Episode',
          _$failedField,
          e.toString(),
        );
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$CharacterFilter extends CharacterFilter {
  @override
  final String? name;
  @override
  final String? status;
  @override
  final String? species;
  @override
  final String? type;
  @override
  final String? gender;
  @override
  final int? page;

  factory _$CharacterFilter([void Function(CharacterFilterBuilder)? updates]) =>
      (CharacterFilterBuilder()..update(updates))._build();

  _$CharacterFilter._({
    this.name,
    this.status,
    this.species,
    this.type,
    this.gender,
    this.page,
  }) : super._();
  @override
  CharacterFilter rebuild(void Function(CharacterFilterBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  CharacterFilterBuilder toBuilder() => CharacterFilterBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is CharacterFilter &&
        name == other.name &&
        status == other.status &&
        species == other.species &&
        type == other.type &&
        gender == other.gender &&
        page == other.page;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jc(_$hash, status.hashCode);
    _$hash = $jc(_$hash, species.hashCode);
    _$hash = $jc(_$hash, type.hashCode);
    _$hash = $jc(_$hash, gender.hashCode);
    _$hash = $jc(_$hash, page.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'CharacterFilter')
          ..add('name', name)
          ..add('status', status)
          ..add('species', species)
          ..add('type', type)
          ..add('gender', gender)
          ..add('page', page))
        .toString();
  }
}

class CharacterFilterBuilder
    implements Builder<CharacterFilter, CharacterFilterBuilder> {
  _$CharacterFilter? _$v;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  String? _status;
  String? get status => _$this._status;
  set status(String? status) => _$this._status = status;

  String? _species;
  String? get species => _$this._species;
  set species(String? species) => _$this._species = species;

  String? _type;
  String? get type => _$this._type;
  set type(String? type) => _$this._type = type;

  String? _gender;
  String? get gender => _$this._gender;
  set gender(String? gender) => _$this._gender = gender;

  int? _page;
  int? get page => _$this._page;
  set page(int? page) => _$this._page = page;

  CharacterFilterBuilder();

  CharacterFilterBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _name = $v.name;
      _status = $v.status;
      _species = $v.species;
      _type = $v.type;
      _gender = $v.gender;
      _page = $v.page;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(CharacterFilter other) {
    _$v = other as _$CharacterFilter;
  }

  @override
  void update(void Function(CharacterFilterBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  CharacterFilter build() => _build();

  _$CharacterFilter _build() {
    final _$result =
        _$v ??
        _$CharacterFilter._(
          name: name,
          status: status,
          species: species,
          type: type,
          gender: gender,
          page: page,
        );
    replace(_$result);
    return _$result;
  }
}

class _$LocationFilter extends LocationFilter {
  @override
  final String? name;
  @override
  final String? type;
  @override
  final String? dimension;
  @override
  final int? page;

  factory _$LocationFilter([void Function(LocationFilterBuilder)? updates]) =>
      (LocationFilterBuilder()..update(updates))._build();

  _$LocationFilter._({this.name, this.type, this.dimension, this.page})
    : super._();
  @override
  LocationFilter rebuild(void Function(LocationFilterBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  LocationFilterBuilder toBuilder() => LocationFilterBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is LocationFilter &&
        name == other.name &&
        type == other.type &&
        dimension == other.dimension &&
        page == other.page;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jc(_$hash, type.hashCode);
    _$hash = $jc(_$hash, dimension.hashCode);
    _$hash = $jc(_$hash, page.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'LocationFilter')
          ..add('name', name)
          ..add('type', type)
          ..add('dimension', dimension)
          ..add('page', page))
        .toString();
  }
}

class LocationFilterBuilder
    implements Builder<LocationFilter, LocationFilterBuilder> {
  _$LocationFilter? _$v;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  String? _type;
  String? get type => _$this._type;
  set type(String? type) => _$this._type = type;

  String? _dimension;
  String? get dimension => _$this._dimension;
  set dimension(String? dimension) => _$this._dimension = dimension;

  int? _page;
  int? get page => _$this._page;
  set page(int? page) => _$this._page = page;

  LocationFilterBuilder();

  LocationFilterBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _name = $v.name;
      _type = $v.type;
      _dimension = $v.dimension;
      _page = $v.page;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(LocationFilter other) {
    _$v = other as _$LocationFilter;
  }

  @override
  void update(void Function(LocationFilterBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  LocationFilter build() => _build();

  _$LocationFilter _build() {
    final _$result =
        _$v ??
        _$LocationFilter._(
          name: name,
          type: type,
          dimension: dimension,
          page: page,
        );
    replace(_$result);
    return _$result;
  }
}

class _$EpisodeFilter extends EpisodeFilter {
  @override
  final String? name;
  @override
  final String? episode;
  @override
  final int? page;

  factory _$EpisodeFilter([void Function(EpisodeFilterBuilder)? updates]) =>
      (EpisodeFilterBuilder()..update(updates))._build();

  _$EpisodeFilter._({this.name, this.episode, this.page}) : super._();
  @override
  EpisodeFilter rebuild(void Function(EpisodeFilterBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  EpisodeFilterBuilder toBuilder() => EpisodeFilterBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is EpisodeFilter &&
        name == other.name &&
        episode == other.episode &&
        page == other.page;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jc(_$hash, episode.hashCode);
    _$hash = $jc(_$hash, page.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'EpisodeFilter')
          ..add('name', name)
          ..add('episode', episode)
          ..add('page', page))
        .toString();
  }
}

class EpisodeFilterBuilder
    implements Builder<EpisodeFilter, EpisodeFilterBuilder> {
  _$EpisodeFilter? _$v;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  String? _episode;
  String? get episode => _$this._episode;
  set episode(String? episode) => _$this._episode = episode;

  int? _page;
  int? get page => _$this._page;
  set page(int? page) => _$this._page = page;

  EpisodeFilterBuilder();

  EpisodeFilterBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _name = $v.name;
      _episode = $v.episode;
      _page = $v.page;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(EpisodeFilter other) {
    _$v = other as _$EpisodeFilter;
  }

  @override
  void update(void Function(EpisodeFilterBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  EpisodeFilter build() => _build();

  _$EpisodeFilter _build() {
    final _$result =
        _$v ?? _$EpisodeFilter._(name: name, episode: episode, page: page);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint

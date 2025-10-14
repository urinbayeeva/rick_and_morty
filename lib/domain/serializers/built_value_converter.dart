import 'dart:convert';

import 'package:chopper/chopper.dart';
import 'package:built_collection/built_collection.dart';
import 'package:built_value/serializer.dart';
import 'package:rick_and_morty/domain/models/rick_morty_models.dart';

import 'dart:async';
import 'dart:developer';

import 'package:built_collection/built_collection.dart';
import 'package:built_value/serializer.dart';
import 'package:chopper/chopper.dart';
import 'package:http/http.dart' as http;
import 'package:rick_and_morty/domain/serializers/serializers.dart';
import 'package:rick_and_morty/infrastructure/core/exceptions.dart';

import 'package:sentry_flutter/sentry_flutter.dart';

class BuiltValueConverter extends JsonConverter {
  @override
  Request convertRequest(Request request) {
    Request req = super.convertRequest(
      request.copyWith(
        body: serializers.serializeWith(
          serializers.serializerForType(request.body.runtimeType)!,
          request.body,
        ),
      ),
    );
    if (request.body is List<http.MultipartFile>) {
      final List<http.MultipartFile> files =
          request.body as List<http.MultipartFile>;
      final newRequest =
          http.MultipartRequest(request.method, request.url)
            ..fields.addAll(Map<String, String>.from(request.parameters))
            ..files.addAll(files);

      return super.convertRequest(request.copyWith(body: newRequest));
    }
    return req;
  }

  @override
  Future<Response<D>> convertResponse<D, T>(Response response) async {
    late Response res;
    if (response.bodyString.isEmpty) {
      res = Response(response.base, '{"detail":"Success"}');
    } else {
      res = response;
    }
    final dynamicResponse = await super.convertResponse(res);
    final customBody = _convertToObject<T>(dynamicResponse.body) as D;
    return dynamicResponse.copyWith<D>(body: customBody);
  }

  dynamic _convertToObject<T>(element) {
    if (element is T) {
      return element;
    }
    if (element is List) {
      return _deserializeListOf<T>(element);
    }
    return _deserialize<T>(element as Map<String, dynamic>);
  }

  BuiltList<T> _deserializeListOf<T>(List dynamicList) => BuiltList<T>(
    dynamicList.map(
      (element) => _deserialize<T>(element as Map<String, dynamic>),
    ),
  );

  T _deserialize<T>(Map<String, dynamic> value) =>
      serializers.deserializeWith(
        serializers.serializerForType(T) as Serializer<T>,
        value,
      )!;
}

class ErrorMyConverter implements ErrorConverter {
  @override
  FutureOr<Response> convertError<Detail, PaymentResult>(Response response) {
    BackendExceptionForSentry exceptionForSentry = BackendExceptionForSentry(
      response,
    );
    errorHandle(exceptionForSentry);
    // throw exceptionForSentry;
    // return response;
    throw exceptionForSentry;
  }

  Future<void> errorHandle(BackendExceptionForSentry response) async {
    Sentry.captureException(
      response.toString(),
      stackTrace: StackTrace.current,
    );
  }
}

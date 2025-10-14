import 'dart:async';
import 'dart:convert' show utf8;
import 'dart:io' show HttpHeaders;

import 'package:chopper/chopper.dart';
import 'package:http/http.dart' as http;
import 'package:rick_and_morty/infrastructure/services/alice/core/alice_adapter.dart';
import 'package:rick_and_morty/infrastructure/services/alice/core/alice_utils.dart';
import 'package:rick_and_morty/infrastructure/services/alice/model/alice_http_call.dart';
import 'package:rick_and_morty/infrastructure/services/alice/model/alice_http_error.dart';
import 'package:rick_and_morty/infrastructure/services/alice/model/alice_http_request.dart';
import 'package:rick_and_morty/infrastructure/services/alice/model/alice_http_response.dart';
import 'package:uuid/uuid.dart';

import 'exceptions.dart';

class AliceChopperAdapter with AliceAdapter implements Interceptor {
  /// Creates hashcode based on request
  int getRequestHashCode(http.BaseRequest baseRequest) {
    final int hashCodeSum =
        baseRequest.url.hashCode +
        baseRequest.method.hashCode +
        baseRequest.headers.entries.fold<int>(
          0,
          (int previousValue, MapEntry<String, String> header) =>
              previousValue + header.key.hashCode + header.value.hashCode,
        ) +
        (baseRequest.contentLength?.hashCode ?? 0);

    return hashCodeSum.hashCode;
  }

  /// Handles chopper request and creates alice http call
  @override
  FutureOr<Response<T>> intercept<T>(Chain<T> chain) async {
    final int requestId = getRequestHashCode(
      /// The alice_token header is added to the request in order to keep track
      /// of the request in the AliceCore instance.
      applyHeader(chain.request, 'alice_token', const Uuid().v4()),
    );
    aliceCore.addCall(
      AliceHttpCall(requestId)
        ..method = chain.request.method
        ..endpoint =
            chain.request.url.path.isEmpty ? '/' : chain.request.url.path
        ..server = chain.request.url.host
        ..secure = chain.request.url.scheme == 'https'
        ..uri = chain.request.url.toString()
        ..client = 'Chopper'
        ..request =
            (AliceHttpRequest()
              ..size = switch (chain.request.body) {
                dynamic body when body is String => utf8.encode(body).length,
                dynamic body when body is List<int> => body.length,
                dynamic body when body == null => 0,
                _ => utf8.encode(body.toString()).length,
              }
              ..body = chain.request.body ?? ''
              ..time = DateTime.now()
              ..headers = chain.request.headers
              ..contentType =
                  chain.request.headers[HttpHeaders.contentTypeHeader] ??
                  'unknown'
              ..queryParameters = chain.request.parameters)
        ..response = AliceHttpResponse(),
    );
    try {
      final Response<T> response = await chain.proceed(chain.request);
      aliceCore.addResponse(
        AliceHttpResponse()
          ..status = response.statusCode
          ..body = response.body ?? ''
          ..size = switch (response.body) {
            dynamic body when body is String => utf8.encode(body).length,
            dynamic body when body is List<int> => body.length,
            dynamic body when body == null => 0,
            _ => utf8.encode(body.toString()).length,
          }
          ..time = DateTime.now()
          ..headers = <String, String>{
            for (final MapEntry<String, String> entry
                in response.headers.entries)
              entry.key: entry.value,
          },
        requestId,
      );

      if (!response.isSuccessful || response.error != null) {
        aliceCore.addError(AliceHttpError()..error = response.error, requestId);
      }

      return response;
    } catch (error, stackTrace) {
      AliceUtils.log(error.toString());

      aliceCore.addResponse(AliceHttpResponse(), requestId);

      /// Add error to Alice core
      if (error is BackendExceptionForSentry) {
        Response response = error.response;
        aliceCore.addResponse(
          AliceHttpResponse()
            ..status = response.statusCode
            ..body = response.body ?? ''
            ..size = switch (response.body) {
              dynamic body when body is String => utf8.encode(body).length,
              dynamic body when body is List<int> => body.length,
              dynamic body when body == null => 0,
              _ => utf8.encode(body.toString()).length,
            }
            ..time = DateTime.now()
            ..headers = <String, String>{
              for (final MapEntry<String, String> entry
                  in response.headers.entries)
                entry.key: entry.value,
            },
          requestId,
        );
      } else {
        aliceCore.addError(
          AliceHttpError()
            ..error = error
            ..stackTrace = stackTrace,
          requestId,
        );
      }

      /// Rethrow error
      rethrow;
    }
  }
}

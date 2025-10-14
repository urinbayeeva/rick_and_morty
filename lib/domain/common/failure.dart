import 'dart:async';
import 'dart:convert';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:rick_and_morty/infrastructure/core/exceptions.dart';

part 'failure.freezed.dart';

@freezed
abstract class ResponseFailure with _$ResponseFailure {
  const factory ResponseFailure.invalidCredential({required String message}) =
      InvalidCredentials;

  const factory ResponseFailure.noAdminAccess({required String message}) =
      NoAdminAccess;

  const factory ResponseFailure.networkFailure({required String message}) =
      NetworkFailure;

  const factory ResponseFailure.unknown({required String message}) = Unknown;
}

ResponseFailure handleError(dynamic e) {
  if (e is NetworkException) {
    return NetworkFailure(message: e.message);
  } else if (e is BackendExceptionForSentry) {
    try {
      Map<String, dynamic> res = jsonDecode(utf8.decode(e.response.bodyBytes));
      if (res.containsKey('detail')) {
        return Unknown(message: res['detail']);
      } else if (res.containsKey('error')) {
        return Unknown(message: res['error']);
      } else {
        return Unknown(
          message:
              e.response.body?.toString().replaceAll("\n", " ") ??
              'unknown_error',
        );
      }
    } catch (error) {
      return Unknown(message: e.response.body ?? 'unknown_error');
    }
  } else if (e is TimeoutException) {
    return const NetworkFailure(message: "low_connection_internet");
  } else if (e is BackendException) {
    return NetworkFailure(message: e.message);
  } else {
    return const Unknown(message: 'unknown_error');
  }
}

import 'package:chopper/chopper.dart';


class NetworkException implements Exception {
  final message = "connection_is_afk";

  @override
  String toString() => message;
}

class BackendException implements Exception {
  final message = "backend_exception";

  @override
  String toString() => message;
}

class BackendExceptionForSentry implements Exception {
  final Response response;

  BackendExceptionForSentry(this.response);

  @override
  String toString() => "API Error: ${response.base.request?.url} "
      "Status Code: ${response.statusCode} "
      "Response: ${response.body} "
      "Headers: ${response.headers} ";
}

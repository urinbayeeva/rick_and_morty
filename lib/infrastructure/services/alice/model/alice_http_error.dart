import 'package:equatable/equatable.dart';

/// Definition of http error data holder.
class AliceHttpError with EquatableMixin {
  dynamic error;
  StackTrace? stackTrace;
  int? status = 0;
  int size = 0;
  DateTime time = DateTime.now();
  Map<String, String>? headers;

  @override
  List<Object?> get props => [error, stackTrace, status, size, time, headers];
}

import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

class LogService {
  static Logger? _logger;

  LogService._();

  static LogService get create {
    _logger ??= Logger(filter: DevelopmentFilter(), printer: PrettyPrinter());
    return LogService._();
  }

  static void d(dynamic message) {
    // alice.addLogs([
    //   AliceLog(
    //     level: DiagnosticLevel.debug,
    //     timestamp: DateTime.now(),
    //     message: message.toString(),
    //   ),
    // ]);
    _logger?.d(message);
  }

  static void i(dynamic message) {
    // alice.addLogs([
    //   AliceLog(
    //     level: DiagnosticLevel.info,
    //     timestamp: DateTime.now(),
    //     message: message.toString(),
    //   ),
    // ]);
    _logger?.i(message);
  }

  static void w(dynamic message) {
    // alice.addLogs([
    //   AliceLog(
    //     level: DiagnosticLevel.warning,
    //     timestamp: DateTime.now(),
    //     message: message.toString(),
    //   ),
    // ]);
    _logger?.w(message);
  }

  static void e(dynamic message) {
    // alice.addLogs([
    //   AliceLog(
    //     level: DiagnosticLevel.error,
    //     timestamp: DateTime.now(),
    //     message: message.toString(),
    //   ),
    // ]);
    _logger?.e(message);
  }
}

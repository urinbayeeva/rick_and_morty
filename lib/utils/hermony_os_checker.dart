import 'package:flutter/services.dart';

class HarmonyOsChecker {
  static const MethodChannel _channel = MethodChannel('device_info_channel');

  static Future<bool> isHarmonyOS() async {
    try {
      final result = await _channel.invokeMethod<bool>('isHarmonyOS');
      return result ?? false;
    } catch (_) {
      return false;
    }
  }
}

import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rick_and_morty/infrastructure/services/connectivity.dart';
import 'package:rick_and_morty/infrastructure/services/local_database/db_service.dart';
import 'package:rick_and_morty/presentation/styles/style.dart';
import 'package:rick_and_morty/utils/log_service.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:logging/logging.dart';

class AppInit {
  static bool? connectivityX;

  static DBService? dbService;

  AppInit._();

  static Future<AppInit> get create async {
    await appInitialized();
    connectivityX ??= await ConnectivityX().create();
    dbService ??= await DBService.create;

    return AppInit._();
  }

  static Future<void> appInitialized() async {
    await Hive.initFlutter();

    /// LogService Create
    LogService.create;

    /// Easy Localization
    await EasyLocalization.ensureInitialized();

    /// Device Orientation
    await SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    SystemChrome.setSystemUIOverlayStyle(Style.dark);
    _setupLogging();
    if (kDebugMode) {
      Bloc.observer = LogBlocObserver();
    }
    HttpOverrides.global = MyHttpOverrides();
    await ScreenUtil.ensureScreenSize();
  }

  static void _setupLogging() =>
      Logger.root
        ..level = kDebugMode ? Level.ALL : Level.WARNING
        ..onRecord.listen(
          (record) => debugPrint(
            '${record.level.name}: '
            '${record.time} '
            '${record.loggerName}: '
            '${record.message}',
          ),
        );
}

/// bloc logger
class LogBlocObserver extends BlocObserver {
  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);
    if (kDebugMode) {
      print("\n----------$bloc Changed-----------\n");
    }
  }

  @override
  void onClose(BlocBase bloc) {
    super.onClose(bloc);
    if (kDebugMode) {
      print("$bloc closed---------------------");
    }
  }

  @override
  void onCreate(BlocBase bloc) {
    super.onCreate(bloc);
    if (kDebugMode) {
      LogService.d("$bloc created---------------------");
    }
  }

  @override
  void onEvent(Bloc bloc, Object? event) {
    super.onEvent(bloc, event);
    if (kDebugMode) {
      LogService.d('---------Event------------${bloc.runtimeType} $event');
    }
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    super.onError(bloc, error, stackTrace);
    if (kDebugMode) {
      LogService.d('---------Error------------${bloc.runtimeType} $error');
    }
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);
    if (kDebugMode) {
      print("--------------$bloc Transition---------------------");
    }
  }
}

/// ssl
class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      // ..findProxy = (uri) {
      //   return "PROXY  192.168.101.22:8888";
      // }
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}

// /// Allows you to set and enable a proxy for your app
// class CustomProxy {
//   /// A string representing an IP address for the proxy server
//   final String ipAddress;

//   /// The port number for the proxy server
//   /// Can be null if port is default.
//   final int? port;

//   /// Set this to true
//   /// - Warning: Setting this to true in production apps can be dangerous. Use with care!
//   bool allowBadCertificates;

//   /// Initializer
//   CustomProxy({required this.ipAddress, this.port, this.allowBadCertificates = false});

//   /// Initializer from string
//   /// Note: Uses static method, rather than named init to allow final properties.
//   static CustomProxy? fromString({required String? proxy}) {
//     // Check if valid
//     if (proxy == null || proxy == "") {
//       assert(false, "Proxy string passed to CustomProxy.fromString() is invalid.");
//       return null;
//     }

//     // Build and return
//     final proxyParts = proxy.split(":");
//     final ipAddress = proxyParts[0];
//     final port = proxyParts.isNotEmpty ? int.tryParse(proxyParts[1]) : null;
//     return CustomProxy(
//       ipAddress: ipAddress,
//       port: port ?? 0,
//     );
//   }

//   /// Enable the proxy
//   void enable() {
//     HttpOverrides.global = CustomProxyHttpOverride.withProxy(toString());
//   }

//   /// Disable the proxy
//   void disable() {
//     HttpOverrides.global = null;
//   }

//   @override
//   String toString() {
//     String proxy = ipAddress;
//     if (port != null) {
//       proxy += ":$port";
//     }
//     return proxy;
//   }
// }

// /// This class overrides the global proxy settings.
// class CustomProxyHttpOverride extends HttpOverrides {
//   /// The entire proxy server
//   /// Format: "localhost:8888"
//   final String proxyString;

//   /// Set this to true
//   /// - Warning: Setting this to true in production apps can be dangerous. Use with care!
//   final bool allowBadCertificates;

//   /// Initializer
//   CustomProxyHttpOverride.withProxy(
//     this.proxyString, {
//     this.allowBadCertificates = false,
//   });

//   @override
//   HttpClient createHttpClient(SecurityContext? context) {
//     return super.createHttpClient(context)
//       ..findProxy = (uri) {
//         assert(proxyString.isNotEmpty, 'You must set a valid proxy if you enable it!');
//         return "PROXY $proxyString;";
//       }
//       ..badCertificateCallback = allowBadCertificates ? (X509Certificate cert, String host, int port) => true : null;
//   }
// }

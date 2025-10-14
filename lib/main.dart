import 'dart:async';
import 'dart:io';
import 'dart:ui';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rick_and_morty/presentation/pages/core/app_init.dart';
import 'package:rick_and_morty/presentation/pages/core/my_app.dart';
import 'package:rick_and_morty/utils/app_config.dart';
import 'package:rick_and_morty/utils/constants.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

Future<void> main() async {
  debugDisableShadows = true;

  HttpOverrides.global = MyHttpOverrides();

  runZonedGuarded(
    () async {
      WidgetsFlutterBinding.ensureInitialized();

      await Hive.initFlutter();
      await AppInit.create;
      await initializeDateFormatting('ru', null);
      await SentryFlutter.init((options) {
        options.dsn =
            'https://cd927ec80e2acd5006fb11c41b42a0ff@o482110.ingest.us.sentry.io/4508839849689088';
        options.tracesSampleRate = 1.0;
        options.profilesSampleRate = 1.0;
      });
      FlutterError.onError = (FlutterErrorDetails details) {
        FlutterError.presentError(details);
        Sentry.captureException(details.exception, stackTrace: details.stack);
      };

      AppConfig.create(
        appName: Constants.appName,
        baseUrl: Constants.baseUrlP,
        primaryColor: Colors.yellow,
        flavor: Flavor.prod,
      );

      // await AppInit.create;
      Locale defaultLocale = const Locale('uz', 'UZ');

      try {
        String languageCode = Platform.localeName.split('_')[0];
        if (languageCode == "ru") {
          defaultLocale = const Locale('ru', 'RU');
        }
      } catch (e) {
        debugPrint(e.toString());
      }

      runApp(
        EasyLocalization(
          supportedLocales: const [Locale('uz', 'UZ'), Locale('ru', 'RU')],
          path: 'assets/translation',
          startLocale: defaultLocale,
          fallbackLocale: const Locale('uz', 'UZ'),
          child: ScreenUtilInit(
            designSize: const Size(375, 812),
            builder:
                (context, child) => MyApp(
                  dbService: AppInit.dbService!,
                  connectivityX: AppInit.connectivityX!,
                ),
          ),
        ),
      );
    },
    (exception, stackTrace) async {
      debugPrint("\n\n\nException: $exception\n");
      debugPrint("\nPath Exception: $stackTrace\n\n\n");
      await Sentry.captureException(exception, stackTrace: stackTrace);
    },
  );
}

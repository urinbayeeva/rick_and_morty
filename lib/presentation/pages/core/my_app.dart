import 'dart:developer';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:rick_and_morty/infrastructure/core/alice_chopper_adapter.dart';
import 'package:rick_and_morty/infrastructure/services/alice/alice.dart';
import 'package:rick_and_morty/infrastructure/services/alice/model/alice_configuration.dart';
import 'package:rick_and_morty/infrastructure/services/local_database/db_service.dart';
import 'package:rick_and_morty/presentation/component/un_focus_widget.dart';
import 'package:rick_and_morty/presentation/routes/routes.dart';
import 'package:rick_and_morty/presentation/styles/theme.dart';
import 'package:rick_and_morty/utils/app_config.dart';

import 'package:provider/provider.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

final AliceChopperAdapter aliceChopperAdapter = AliceChopperAdapter();
Alice alice = Alice(
  configuration: AliceConfiguration(
    showNotification: true,
    showInspectorOnShake: false,
  ),
)..addAdapter(aliceChopperAdapter);

class MyApp extends StatelessWidget {
  final DBService dbService;
  final bool connectivityX;
  final Function(BuildContext context)? onGetContext;

  const MyApp({
    super.key,
    required this.dbService,
    required this.connectivityX,
    this.onGetContext,
  });

  @override
  Widget build(BuildContext context) {
    FlutterNativeSplash.remove();

    return MultiProvider(
      providers: [
        Provider<DBService>(create: (_) => dbService),

        ChangeNotifierProvider(
          create: (_) => GlobalController.create(dbService),
        ),
        ChangeNotifierProvider(create: (_) => BottomNavBarController.create()),
      ],
      child: OnUnFocusTap(
        child: MaterialApp(
          navigatorKey: alice.getNavigatorKey(),
          debugShowCheckedModeBanner: false,
          builder: (context, child) {
            child = FlutterSmartDialog.init()(context, child);
            return FlavorBanner(child: child);
          },
          navigatorObservers: [
            FlutterSmartDialog.observer,
            // AnalyticsService().getAnalyticsObserver(),
            SentryNavigatorObserver(),
          ],
          localizationsDelegates: context.localizationDelegates,
          supportedLocales: context.supportedLocales,
          locale: context.locale,
          onGenerateRoute: (_) {
            log("Languageee: ${dbService.getLang}");

            if (onGetContext != null) {
              onGetContext!(context);
            }
            return AppRoutes.onGenerateRoute(
              context: context,
              notConnection: !connectivityX,
              isLang: dbService.getLang ?? true,
            );
          },
        ),
      ),
    );
  }
}

class FlavorBanner extends StatelessWidget {
  final Widget child;

  const FlavorBanner({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    if (AppConfig.shared.flavor == Flavor.prod) {
      return child;
    }
    return Stack(
      clipBehavior: Clip.none,
      children: [child, _buildBanner(context)],
    );
  }

  Widget _buildBanner(BuildContext context) {
    return Banner(
      message: AppConfig.shared.flavor.name,
      location: BannerLocation.topStart,
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rick_and_morty/presentation/pages/core/no_connection.dart';
import 'package:rick_and_morty/presentation/pages/main/main_screen.dart';
import 'package:rick_and_morty/presentation/pages/splash/splash_screen.dart';

class AppRoutes {
  static PageRoute onGenerateRoute({
    required BuildContext context,
    required bool notConnection,
    required bool isLang,
    Uri? initLink,
  }) {
    ScreenUtil.init(context, designSize: const Size(390, 846));

    if (notConnection) {
      return getNetworkNotFound();
    } else if (!isLang) {
      return getMainPage();
    } else {
      return getMainPage();
    }
  }

  static MaterialPageRoute getOnboardingPage() {
    // AnalyticsService().analyzeScreenView('getNetworkNotFound');
    return MaterialPageRoute(builder: (_) => const Scaffold());
  }

  static MaterialPageRoute getNetworkNotFound() {
    // AnalyticsService().analyzeScreenView('getNetworkNotFound');
    return MaterialPageRoute(builder: (_) => const NoConnection());
  }

  static MaterialPageRoute getLangPage() {
    // AnalyticsService().analyzeScreenView('getLangPage');
    return MaterialPageRoute(builder: (_) => const Scaffold());
  }

  static MaterialPageRoute getMainPage() {
    // AnalyticsService().analyzeScreenView('getLangPage');
    return MaterialPageRoute(builder: (_) => const MainScreen());
  }
}

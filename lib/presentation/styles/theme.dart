import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:rick_and_morty/presentation/styles/style.dart';

import './custom_theme_mode.dart';
import './custom_theme_mode_ext.dart';
import '../../infrastructure/services/local_database/db_service.dart';

part 'color_set.dart';
part 'font_set.dart';
part 'icon_set.dart';
part 'theme_preference.dart';

class GlobalController with ChangeNotifier {
  final _ThemePreference _themePreference;
  final IconSet _iconSet;
  FontSet _fontSet;
  CustomColorSet _colorSet;
  CustomThemeMode _mode;

  CustomColorSet get colors => _colorSet;

  CustomThemeMode get mode => _mode;

  bool get isDark => _mode.isDark;

  IconSet get icons => _iconSet;

  FontSet get fonts => _fontSet;

  DBService get dbService => _themePreference._dbService;

  GlobalController._(
    this._colorSet,
    this._themePreference,
    this._mode,
    this._iconSet,
    this._fontSet,
  );

  static GlobalController create(DBService dbService) {
    final themePreference = _ThemePreference.create(dbService);
    final mode = themePreference.getMode();
    final colorSet = CustomColorSet.createOrUpdate(mode);
    final iconSet = IconSet.create;
    final fontSet = FontSet.createOrUpdate(colorSet);

    return GlobalController._(
      colorSet,
      themePreference,
      mode,
      iconSet,
      fontSet,
    );
  }

  Future<void> setLight() async {
    await _update(CustomThemeMode.light);
  }

  Future<void> setDark() async {
    await _update(CustomThemeMode.dark);
  }

  Future<void> clean() async {
    await _themePreference.clean();
  }

  Future<void> toggle() async {
    if (_mode.isLight) {
      await setDark();
    } else {
      await setLight();
    }
  }

  Future<void> _update(CustomThemeMode mode) async {
    _colorSet = CustomColorSet.createOrUpdate(mode);
    _fontSet = FontSet.createOrUpdate(_colorSet);
    _mode = mode;
    notifyListeners();
    await _themePreference.setMode(mode);
  }
}

class BottomNavBarController with ChangeNotifier {
  bool hiddenNavBar = false;
  int _currentIndex = 0;
  int _pageIndex = 0;

  BottomNavBarController._();

  static BottomNavBarController create() {
    return BottomNavBarController._();
  }

  int get currentIndex => _currentIndex;
  int get pageIndex => _pageIndex;

  void changeNavBar(bool enabled) {
    if (enabled != hiddenNavBar) {
      hiddenNavBar = enabled;
      notifyListeners();
    }
  }

  void setIndex(int index, {int? pageIndex}) {
    bool indexChanged = _currentIndex != index;
    bool pageChanged = pageIndex != null && _pageIndex != pageIndex;

    if (indexChanged || pageChanged) {
      _currentIndex = index;

      if (pageIndex != null) {
        _pageIndex = pageIndex;
      } else if (indexChanged && index != 2) {
        _pageIndex = 0;
      }

      notifyListeners();
    }
  }

  void setPageIndex(int pageIndex) {
    if (_pageIndex != pageIndex) {
      _pageIndex = pageIndex;
      notifyListeners();
    }
  }

  // New method to set both indices at once
  void setIndices({required int navIndex, required int pageIndex}) {
    bool changed = false;

    if (_currentIndex != navIndex) {
      _currentIndex = navIndex;
      changed = true;
    }

    if (_pageIndex != pageIndex) {
      _pageIndex = pageIndex;
      changed = true;
    }

    if (changed) {
      notifyListeners();
    }
  }
}

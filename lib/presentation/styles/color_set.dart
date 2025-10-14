part of 'theme.dart';

class CustomColorSet {
  final Color iconGreyColor;
  final Color transparent;
  final Color neutral50;
  final Color neutral100;
  final Color neutral200;
  final Color neutral300;
  final Color neutral400;
  final Color neutral500;
  final Color neutral600;
  final Color neutral700;
  final Color neutral800;
  final Color neutral900;
  final Color backgroundColor;

  final Color primary50;
  final Color primary100;
  final Color primary200;
  final Color primary300;
  final Color primary400;
  final Color primary500;
  final Color primary600;
  final Color primary700;
  final Color primary800;
  final Color primary900;

  final Color secondary50;
  final Color secondary100;
  final Color secondary200;
  final Color secondary300;
  final Color secondary400;
  final Color secondary500;
  final Color secondary600;
  final Color secondary700;
  final Color secondary800;
  final Color secondary900;

  final Color success50;
  final Color success100;
  final Color success200;
  final Color success300;
  final Color success400;
  final Color success500;
  final Color success600;
  final Color success700;
  final Color success800;
  final Color success900;

  final Color warning50;
  final Color warning100;
  final Color warning200;
  final Color warning300;
  final Color warning400;
  final Color warning500;
  final Color warning600;
  final Color warning700;
  final Color warning800;
  final Color warning900;

  final Color error50;
  final Color error100;
  final Color error200;
  final Color error300;
  final Color error400;
  final Color error500;
  final Color error600;
  final Color error700;
  final Color error800;
  final Color error900;

  final Color shade100;
  final Color shade0;

  final Color darkMode50;
  final Color darkMode100;
  final Color darkMode200;
  final Color darkMode300;
  final Color darkMode400;
  final Color darkMode500;
  final Color darkMode600;
  final Color darkMode700;
  final Color darkMode800;
  final Color darkMode900;
  final Color med1BoxColor;
  final Color blue;

  final List<BoxShadow> shadowS;
  final List<BoxShadow> shadowM;
  final List<BoxShadow> shadowMM;
  final List<BoxShadow> shadowSSSS;
  final List<BoxShadow> shadowMMMM;

  CustomColorSet._({
    required this.transparent,
    required this.med1BoxColor,
    //
    required this.backgroundColor,
    required this.neutral50,
    required this.neutral100,
    required this.neutral200,
    required this.neutral300,
    required this.neutral400,
    required this.neutral500,
    required this.neutral600,
    required this.neutral700,
    required this.neutral800,
    required this.neutral900,
    //
    required this.primary50,
    required this.primary100,
    required this.primary200,
    required this.primary300,
    required this.primary400,
    required this.primary500,
    required this.primary600,
    required this.primary700,
    required this.primary800,
    required this.primary900,
    //
    required this.secondary50,
    required this.secondary100,
    required this.secondary200,
    required this.secondary300,
    required this.secondary400,
    required this.secondary500,
    required this.secondary600,
    required this.secondary700,
    required this.secondary800,
    required this.secondary900,
    //
    required this.success50,
    required this.success100,
    required this.success200,
    required this.success300,
    required this.success400,
    required this.success500,
    required this.success600,
    required this.success700,
    required this.success800,
    required this.success900,
    //
    required this.warning50,
    required this.warning100,
    required this.warning200,
    required this.warning300,
    required this.warning400,
    required this.warning500,
    required this.warning600,
    required this.warning700,
    required this.warning800,
    required this.warning900,
    //
    required this.error50,
    required this.error100,
    required this.error200,
    required this.error300,
    required this.error400,
    required this.error500,
    required this.error600,
    required this.error700,
    required this.error800,
    required this.error900,
    //
    required this.shade100,
    required this.shade0,
    //
    required this.darkMode50,
    required this.darkMode100,
    required this.darkMode200,
    required this.darkMode300,
    required this.darkMode400,
    required this.darkMode500,
    required this.darkMode600,
    required this.darkMode700,
    required this.darkMode800,
    required this.darkMode900,
    required this.iconGreyColor,
    required this.shadowS,
    required this.shadowSSSS,
    required this.shadowM,
    required this.shadowMM,
    required this.shadowMMMM,
    required this.blue,
  });

  factory CustomColorSet._create(CustomThemeMode mode) {
    const transparent = Style.transparent;
    const med1BoxColor = Style.med1BoxColor;
    final neutral50 = mode.isLight ? Style.neutral50 : Style.darkMode50;
    final neutral100 = mode.isLight ? Style.neutral100 : Style.darkMode100;
    final neutral200 = mode.isLight ? Style.neutral200 : Style.darkMode200;
    final neutral300 = mode.isLight ? Style.neutral300 : Style.darkMode300;
    final neutral400 = mode.isLight ? Style.neutral400 : Style.darkMode400;
    final neutral500 = mode.isLight ? Style.neutral500 : Style.darkMode500;
    final neutral600 = mode.isLight ? Style.neutral600 : Style.darkMode600;
    final neutral700 = mode.isLight ? Style.neutral700 : Style.darkMode700;
    final neutral800 = mode.isLight ? Style.neutral800 : Style.darkMode800;
    final neutral900 = mode.isLight ? Style.neutral900 : Style.darkMode900;

    const backgroundColor = Style.background;
    const primary50 = Style.primary50;
    const primary100 = Style.primary100;
    const primary200 = Style.primary200;
    const primary300 = Style.primary300;
    const primary400 = Style.primary400;
    const primary500 = Style.primary500;
    const primary600 = Style.primary600;
    const primary700 = Style.primary700;
    const primary800 = Style.primary800;
    const primary900 = Style.primary900;

    const secondary50 = Style.secondary50;
    const secondary100 = Style.secondary100;
    const secondary200 = Style.secondary200;
    const secondary300 = Style.secondary300;
    const secondary400 = Style.secondary400;
    const secondary500 = Style.secondary500;
    const secondary600 = Style.secondary600;
    const secondary700 = Style.secondary700;
    const secondary800 = Style.secondary800;
    const secondary900 = Style.secondary900;

    const success50 = Style.success50;
    const success100 = Style.success100;
    const success200 = Style.success200;
    const success300 = Style.success300;
    const success400 = Style.success400;
    const success500 = Style.success500;
    const success600 = Style.success600;
    const success700 = Style.success700;
    const success800 = Style.success800;
    const success900 = Style.success900;

    const warning50 = Style.warning50;
    const warning100 = Style.warning100;
    const warning200 = Style.warning200;
    const warning300 = Style.warning300;
    const warning400 = Style.warning400;
    const warning500 = Style.warning500;
    const warning600 = Style.warning600;
    const warning700 = Style.warning700;
    const warning800 = Style.warning800;
    const warning900 = Style.warning900;

    const error50 = Style.error50;
    const error100 = Style.error100;
    const error200 = Style.error200;
    const error300 = Style.error300;
    const error400 = Style.error400;
    const error500 = Style.error500;
    const error600 = Style.error600;
    const error700 = Style.error700;
    const error800 = Style.error800;
    const error900 = Style.error900;

    const shade100 = Style.shade100;
    const shade0 = Style.shade0;

    const darkMode50 = Style.darkMode50;
    const darkMode100 = Style.darkMode100;
    const darkMode200 = Style.darkMode200;
    const darkMode300 = Style.darkMode300;
    const darkMode400 = Style.darkMode400;
    const darkMode500 = Style.darkMode500;
    const darkMode600 = Style.darkMode600;
    const darkMode700 = Style.darkMode700;
    const darkMode800 = Style.darkMode800;
    const darkMode900 = Style.darkMode900;
    const iconGreyColor = Style.iconGreyColor;
    const blue = Style.blue;

    const shadowS = Style.shadowS;
    const shadowSSSS = Style.shadowSSSS;
    const shadowM = Style.shadowM;
    const shadowMM = Style.shadowMM;
    const shadowMMMM = Style.shadowMMMM;

    return CustomColorSet._(
      blue: blue,
      med1BoxColor: med1BoxColor,
      transparent: transparent,
      neutral50: neutral50,
      neutral100: neutral100,
      neutral200: neutral200,
      neutral300: neutral300,
      neutral400: neutral400,
      neutral500: neutral500,
      neutral600: neutral600,
      neutral700: neutral700,
      neutral800: neutral800,
      neutral900: neutral900,
      //
      primary50: primary50,
      primary100: primary100,
      primary200: primary200,
      primary300: primary300,
      primary400: primary400,
      primary500: primary500,
      primary600: primary600,
      primary700: primary700,
      primary800: primary800,
      primary900: primary900,
      //
      secondary50: secondary50,
      secondary100: secondary100,
      secondary200: secondary200,
      secondary300: secondary300,
      secondary400: secondary400,
      secondary500: secondary500,
      secondary600: secondary600,
      secondary700: secondary700,
      secondary800: secondary800,
      secondary900: secondary900,
      //
      success50: success50,
      success100: success100,
      success200: success200,
      success300: success300,
      success400: success400,
      success500: success500,
      success600: success600,
      success700: success700,
      success800: success800,
      success900: success900,
      //
      warning50: warning50,
      warning100: warning100,
      warning200: warning200,
      warning300: warning300,
      warning400: warning400,
      warning500: warning500,
      warning600: warning600,
      warning700: warning700,
      warning800: warning800,
      warning900: warning900,
      //
      error50: error50,
      error100: error100,
      error200: error200,
      error300: error300,
      error400: error400,
      error500: error500,
      error600: error600,
      error700: error700,
      error800: error800,
      error900: error900,
      //
      shade0: shade0,
      shade100: shade100,
      //
      darkMode50: darkMode50,
      darkMode100: darkMode100,
      darkMode200: darkMode200,
      darkMode300: darkMode300,
      darkMode400: darkMode400,
      darkMode500: darkMode500,
      darkMode600: darkMode600,
      darkMode700: darkMode700,
      darkMode800: darkMode800,
      darkMode900: darkMode900,
      backgroundColor: backgroundColor,
      iconGreyColor: iconGreyColor,
      //

      shadowS: shadowS,
      shadowSSSS: shadowSSSS,
      shadowM: shadowM,
      shadowMM: shadowMM,
      shadowMMMM: shadowMMMM,
    );
  }

  static CustomColorSet createOrUpdate(CustomThemeMode mode) {
    return CustomColorSet._create(mode);
  }
}

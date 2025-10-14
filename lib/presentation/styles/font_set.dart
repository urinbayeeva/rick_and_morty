part of "theme.dart";

class FontSet {
  final TextStyle largeTitle;
  final TextStyle displayFirst;
  final TextStyle displaySecond;
  final TextStyle headlineMain;
  final TextStyle headlineSecondary;
  final TextStyle headlineText;
  final TextStyle mediumMain;
  final TextStyle mediumLink;
  final TextStyle mediumText;
  final TextStyle regularMain;
  final TextStyle regularLink;
  final TextStyle regularSemLink;
  final TextStyle regularText;
  final TextStyle smallMain;
  final TextStyle smallLink;
  final TextStyle smallSemLink;
  final TextStyle smallTagFirst;
  final TextStyle smallTagSecond;
  final TextStyle smallText;
  final TextStyle xSmallMain;
  final TextStyle xSmallLink;
  final TextStyle xSmallText;
  final TextStyle xxSmallText;
  final TextStyle xxSmallTagFirst;
  final TextStyle xxSmallTagSecond;
  final TextStyle xxSmallestText;
    final TextStyle captionSemiBold;


  FontSet._({
    required this.largeTitle,
    required this.displayFirst,
    required this.displaySecond,
    required this.headlineMain,
    required this.headlineSecondary,
    required this.headlineText,
    required this.mediumMain,
    required this.mediumLink,
    required this.mediumText,
    required this.regularMain,
    required this.regularLink,
    required this.regularSemLink,
    required this.regularText,
    required this.smallMain,
    required this.smallLink,
    required this.smallSemLink,
    required this.smallTagFirst,
    required this.smallTagSecond,
    required this.smallText,
    required this.xSmallMain,
    required this.xSmallLink,
    required this.xSmallText,
    required this.xxSmallText,
    required this.xxSmallTagFirst,
    required this.xxSmallTagSecond,
    required this.xxSmallestText,
        required this.captionSemiBold,

  });

  static FontSet createOrUpdate(CustomColorSet colorSet) {
    return FontSet._(
      largeTitle: Style.largeTitle(),
      displayFirst: Style.displayFirst(),
      displaySecond: Style.displaySecond(),
      headlineMain: Style.headlineMain(),
      headlineSecondary: Style.headlineSecondary(),
      headlineText: Style.headlineText(),
      mediumMain: Style.mediumMain(),
      mediumLink: Style.mediumLink(),
      mediumText: Style.mediumText(),
      regularMain: Style.regularMain(),
      regularLink: Style.regularLink(),
      regularSemLink: Style.regularSemLink(),
      regularText: Style.regularText(),
      smallMain: Style.smallMain(),
      smallLink: Style.smallLink(),
      smallSemLink: Style.smallSemLink(),
      smallTagFirst: Style.smallTagFirst(),
      smallTagSecond: Style.smallTagSecond(),
      smallText: Style.smallText(),
      xSmallMain: Style.xSmallMain(),
      xSmallLink: Style.xSmallLink(),
      xSmallText: Style.xSmallText(),
      xxSmallText: Style.xxSmallText(),
      xxSmallTagFirst: Style.xxSmallTagFirst(),
      xxSmallTagSecond: Style.xxSmallTagSecond(),
      xxSmallestText: Style.xxSmallestText(),
            captionSemiBold: Style.semiBold14(size: 12.sp),

    );
  }
}

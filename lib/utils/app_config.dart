import 'package:flutter/material.dart';
import 'package:rick_and_morty/utils/constants.dart';

enum Flavor { prod, dev, beta }

class AppConfig {
  String appName = "";
  String baseUrl = "";
  MaterialColor primaryColor = Colors.blue;
  Flavor flavor = Flavor.dev;

  static AppConfig shared = AppConfig.create();

  factory AppConfig.create({
    String appName = Constants.appNameDev,
    String baseUrl = Constants.baseUrlP,
    MaterialColor primaryColor = Colors.blue,
    Flavor flavor = Flavor.dev,
  }) {
    shared = AppConfig(appName, baseUrl, primaryColor, flavor);
    return shared;
  }

  AppConfig(this.appName, this.baseUrl, this.primaryColor, this.flavor);
}

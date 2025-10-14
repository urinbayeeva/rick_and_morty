import 'package:flutter/material.dart';
import 'package:rick_and_morty/presentation/styles/theme_wrapper.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return ThemeWrapper(
      builder: (context, colors, fonts, icons, controller) {
        return Scaffold(backgroundColor: colors.backgroundColor);
      },
    );
  }
}

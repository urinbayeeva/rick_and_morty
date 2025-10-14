import 'package:flutter/material.dart';
import 'package:rick_and_morty/presentation/styles/theme_wrapper.dart';

class UpdatingAlertionPage extends StatefulWidget {
  const UpdatingAlertionPage({super.key});

  @override
  State<UpdatingAlertionPage> createState() => _UpdatingAlertionPageState();
}

class _UpdatingAlertionPageState extends State<UpdatingAlertionPage> {
  @override
  Widget build(BuildContext context) {
    return ThemeWrapper(
      builder: (context, colors, fonts, icons, controller) {
        return Scaffold(
          backgroundColor: colors.backgroundColor,
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [],
          ),
        );
      },
    );
  }
}

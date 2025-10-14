import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rick_and_morty/presentation/component/c_appbar.dart';
import 'package:rick_and_morty/presentation/styles/theme.dart';
import 'package:rick_and_morty/presentation/styles/theme_wrapper.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ThemeWrapper(
      builder: (context, colors, fonts, icons, controller) {
        return Scaffold(
          backgroundColor: colors.backgroundColor,
          body: Column(
            children: [
              CAppBar(
                title: "Rick And Morty",
                centerTitle: true,
                isBack: false,
                trailing: icons.search.svg(color: colors.primary900),
              ),
            ],
          ),
        );
      },
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:rick_and_morty/presentation/styles/theme_wrapper.dart';

class CNotAvailable extends StatelessWidget {
  const CNotAvailable({super.key});

  @override
  Widget build(BuildContext context) {
    return ThemeWrapper(
      builder: (context, colors, fonts, icons, controller) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          // spacing: 8,
          children: [
            Center(child: Lottie.asset("assets/anim/sad.json")),
            Text(
              textAlign: TextAlign.center,
              "В настоящее время эта функция недоступна\n",
              style: fonts.smallMain.copyWith(
                fontSize: 18.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        );
      },
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rick_and_morty/presentation/styles/theme_wrapper.dart';

class CBottomsheetLine extends StatelessWidget {
  const CBottomsheetLine({super.key});

  @override
  Widget build(BuildContext context) {
    return ThemeWrapper(
      builder: (context, colors, fonts, icons, controller) {
        return Container(
          width: 40.w,
          height: 3.h,
          decoration: BoxDecoration(
            color: const Color(0xFFE6E6E6),
            borderRadius: BorderRadius.circular(8.r),
          ),
        );
      },
    );
  }
}

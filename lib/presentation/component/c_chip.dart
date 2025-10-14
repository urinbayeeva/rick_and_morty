import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rick_and_morty/presentation/styles/theme_wrapper.dart';

class CChip extends StatelessWidget {
  final String title;
  final TextStyle? style;
  const CChip(this.title, {super.key, this.style});

  @override
  Widget build(BuildContext context) {
    return ThemeWrapper(
      builder: (context, colors, fonts, icons, controller) {
        return DecoratedBox(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4),
            color: colors.neutral50,
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 2.h, horizontal: 4.w),
            child: Text(
              semanticsLabel: title,
              title,
              style:
                  style ?? fonts.smallMain.copyWith(color: colors.neutral500),
            ),
          ),
        );
      },
    );
  }
}

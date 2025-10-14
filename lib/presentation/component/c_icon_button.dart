import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rick_and_morty/presentation/component/animation_effect.dart';
import 'package:rick_and_morty/presentation/styles/theme_wrapper.dart';

class CIconButton extends StatelessWidget {
  final Color? color;
  final VoidCallback onTap;
  final String title;
  final String iconPath;
  final TextStyle? style;
  const CIconButton({
    super.key,
    this.color,
    required this.onTap,
    required this.title,
    required this.iconPath,
    this.style,
  });

  @override
  Widget build(BuildContext context) {
    return ThemeWrapper(
      builder: (context, colors, fonts, icons, controller) {
        return AnimationButtonEffect(
          onTap: onTap,
          child: Container(
            height: 48.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.r),
              color: color ?? colors.neutral200,
            ),
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(iconPath, width: 24.w, height: 24.h),
                  12.w.horizontalSpace,
                  Text(title, style: style ?? fonts.smallSemLink),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

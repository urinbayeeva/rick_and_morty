import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:rick_and_morty/presentation/component/animation_effect.dart';
import 'package:rick_and_morty/presentation/styles/theme_wrapper.dart';

class CSmallContainer extends StatelessWidget {
  final Color color;
  final String icon;
  final VoidCallback onTap;

  const CSmallContainer({
    super.key,
    required this.color,
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ThemeWrapper(
      builder: (context, colors, fonts, icons, controller) {
        return AnimationButtonEffect(
          onTap: onTap,
          child: Container(
            padding: EdgeInsets.all(4.w),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.r),
              color: color,
            ),
            child: SvgPicture.asset(icon, width: 24.w, height: 24),
          ),
        );
      },
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rick_and_morty/presentation/component/animation_effect.dart';
import 'package:rick_and_morty/presentation/styles/theme.dart';
import 'package:rick_and_morty/presentation/styles/theme_wrapper.dart';

class CustomListTile extends StatelessWidget {
  final String icon, title;
  final VoidCallback? onTap;

  const CustomListTile({
    super.key,
    required this.icon,
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ThemeWrapper(
      builder: (ctx, colors, fonts, icons, controller) {
        return AnimationButtonEffect(
          onTap: onTap,
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(color: colors.neutral100),
              borderRadius: BorderRadius.circular(8.r),
            ),
            child: ListTile(
              contentPadding: EdgeInsets.symmetric(
                horizontal: 12.w,
                vertical: 8.h,
              ),
              leading: Container(
                width: 40.r,
                height: 40.r,
                decoration: BoxDecoration(
                  color: colors.neutral50,
                  borderRadius: BorderRadius.circular(8.r),
                ),
                child: Center(child: icon.svg(height: 24.r, width: 24.r)),
              ),
              title: Text(semanticsLabel: title, title, style: fonts.smallLink),
            ),
          ),
        );
      },
    );
  }
}

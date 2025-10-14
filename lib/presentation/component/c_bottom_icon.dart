import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:rick_and_morty/presentation/component/animation_effect.dart';
import 'package:rick_and_morty/presentation/styles/theme_wrapper.dart';

class CButtonIcon extends StatelessWidget {
  final String title;
  final double? height;
  final double? width;
  final Color? backgroundColor;
  final Color? textColor;
  final Color? iconColor;
  final bool hasBorderRadius;
  final double borderRadius;
  final VoidCallback onTap;
  final String? iconPath;
  final EdgeInsetsGeometry? padding;

  const CButtonIcon({
    super.key,
    required this.title,
    this.height,
    this.width,
    required this.onTap,
    this.backgroundColor,
    this.textColor,
    this.hasBorderRadius = true,
    this.borderRadius = 8.0,
    this.iconPath,
    this.iconColor,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    return ThemeWrapper(
      builder: (context, colors, fonts, icons, controller) {
        return AnimationButtonEffect(
          onTap: onTap,
          child: Container(
            margin: padding,
            width: width?.w ?? double.infinity,
            height: height?.h ?? 48.h,
            decoration: BoxDecoration(
              color: backgroundColor ?? colors.error500,
              borderRadius:
                  hasBorderRadius
                      ? BorderRadius.circular(borderRadius.r)
                      : null,
            ),
            padding: EdgeInsets.symmetric(
              horizontal: iconPath != null ? 16.w : 0,
            ),
            child: Row(
              mainAxisAlignment:
                  MainAxisAlignment.center, // Center the content horizontally
              crossAxisAlignment:
                  CrossAxisAlignment.center, // Center the content vertically
              children: [
                if (iconPath != null)
                  SvgPicture.asset(
                    iconPath!,
                    height: 20.h,
                    width: 20.w,
                    // ignore: deprecated_member_use
                    color: iconColor ?? colors.primary900,
                    // color: colors.shade0,
                  ),
                if (iconPath != null) 4.w.horizontalSpace,
                Flexible(
                  child: Text(
                    title,
                    style: fonts.smallLink.copyWith(
                      color: textColor ?? colors.primary900,
                    ),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

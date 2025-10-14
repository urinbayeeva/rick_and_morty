import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:rick_and_morty/presentation/component/animation_effect.dart';
import 'package:rick_and_morty/presentation/styles/style.dart';
import 'package:rick_and_morty/presentation/styles/theme_wrapper.dart';

class CButton extends StatelessWidget {
  final String title;
  final double? height;
  final double? width;
  final Color? backgroundColor;
  final Color? textColor;
  final bool hasBorderRadius;
  final double borderRadius;
  final VoidCallback onTap;
  final String? iconPath;
  final Widget? child;

  const CButton({
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
    this.child,
  });

  @override
  Widget build(BuildContext context) {
    return ThemeWrapper(
      builder: (context, colors, fonts, icons, controller) {
        return AnimationButtonEffect(
          onTap: onTap,
          child: Container(
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
            child:
                child ??
                Row(
                  mainAxisAlignment:
                      MainAxisAlignment
                          .center, // Center the content horizontally
                  crossAxisAlignment:
                      CrossAxisAlignment
                          .center, // Center the content vertically
                  children: [
                    Flexible(
                      child: Text(
                        title,
                        style: Style.smallMain(
                          color: textColor ?? Colors.white,
                          size: 14.sp,
                        ),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                        textAlign: TextAlign.center,
                      ),
                    ),
                    if (iconPath != null) 4.w.horizontalSpace,
                    if (iconPath != null)
                      SvgPicture.asset(
                        iconPath!,
                        height: 20.h,
                        width: 20.w,
                        // color: colors.shade0,
                      ),
                  ],
                ),
          ),
        );
      },
    );
  }
}

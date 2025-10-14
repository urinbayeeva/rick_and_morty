import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../styles/style.dart';
import '../styles/theme_wrapper.dart';
import 'animation_effect.dart';

class CustomOutlinedButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String title;
  final bool isDisabled;
  final double? verticalPadding;
  final double? horizontalPadding;
  final Color? backgroundColor;
  final Color? textColor;
  final Color? borderColor;
  final Color? disableColor;
  final double? borderRadius;
  final Widget? titleWidget;
  final TextStyle? style;

  const CustomOutlinedButton({
    super.key,
    required this.onPressed,
    this.isDisabled = false,
    required this.title,
    this.verticalPadding,
    this.horizontalPadding,
    this.backgroundColor,
    this.textColor,
    this.borderColor,
    this.borderRadius,
    this.titleWidget,
    this.disableColor,
    this.style,
  });

  @override
  Widget build(BuildContext context) {
    return ThemeWrapper(
      builder: (context, colors, fonts, _, __) {
        return OutlinedButton(
          onPressed: onPressed,
          style: ButtonStyle(
            backgroundColor: WidgetStateColor.resolveWith(
                (states) => backgroundColor ?? Colors.transparent),
            shape: WidgetStateProperty.all(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(borderRadius ?? 32.r),
              ),
            ),
            side: WidgetStateProperty.all<BorderSide>(
              BorderSide(color: borderColor ?? Style.primary500, width: 1),
            ),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(
                vertical: verticalPadding ?? 12.h,
                horizontal: horizontalPadding ?? 42.w),
            child: titleWidget ??
                Text(
                  semanticsLabel: title,
                  title,
                  style: style ??
                      fonts.smallMain.copyWith(
                          color: textColor ?? colors.primary900,
                          fontSize: 12.sp),
                ),
          ),
        );
      },
    );
  }
}

class CustomButton extends StatelessWidget {
  final VoidCallback onPressed;
  final Color? backgroundColor;
  final String title;
  final TextStyle? titleStyle;
  final Color? titleColor;
  final bool isDisabled;
  final double borderWidth;
  final Color? disableColor;
  final double? verticalPadding;
  final double? horizontalPadding;
  final bool haveBorder;
  final bool isInfinityWidth;
  final Color? borderColor;
  final Widget? titleWidget;
  final List<BoxShadow>? shadow;
  final double? borderRadius;

  const CustomButton({
    super.key,
    this.shadow,
    required this.onPressed,
    this.isDisabled = false,
    this.haveBorder = true,
    required this.title,
    this.titleStyle,
    this.titleColor,
    this.backgroundColor,
    this.borderColor,
    this.borderWidth = 1,
    this.verticalPadding,
    this.horizontalPadding,
    this.isInfinityWidth = true,
    this.titleWidget,
    this.borderRadius,
    this.disableColor,
  });

  @override
  Widget build(BuildContext context) {
    return ThemeWrapper(builder: (context, colors, fonts, __, ___) {
      return AnimationButtonEffect(
        onTap: isDisabled ? null : onPressed,
        child: Container(
          width: isInfinityWidth ? double.infinity : null,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(borderRadius ?? 8.r),
            border: haveBorder
                ? Border.all(
                    color: borderColor ??
                        (isDisabled
                            ? disableColor ?? colors.shade0
                            : colors.primary500),
                    width: borderWidth,
                  )
                : null,
            color: isDisabled
                ? disableColor ?? colors.neutral200
                : backgroundColor ?? colors.primary500,
            boxShadow: isDisabled ? null : shadow,
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(
                vertical: verticalPadding ?? 16.h,
                horizontal: horizontalPadding ?? 8.w),
            child: titleWidget ??
                Text(
                  semanticsLabel: title,
                  title,
                  textAlign: TextAlign.center,
                  style: titleStyle ??
                      fonts.smallMain.copyWith(
                        color: isDisabled
                            ? disableColor ?? Color(0xFFC1C1C1)
                            : titleColor ?? colors.neutral50,
                      ),
                ),
          ),
        ),
      );
    });
  }
}

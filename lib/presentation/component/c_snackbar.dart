import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rick_and_morty/presentation/component/animation_effect.dart';
import 'package:rick_and_morty/presentation/styles/theme.dart';
import 'package:rick_and_morty/presentation/styles/theme_wrapper.dart';

class CustomSnackbar extends StatelessWidget {
  final String message;
  final VoidCallback onDismissed;
  const CustomSnackbar({
    super.key,
    required this.message,
    required this.onDismissed,
  });

  @override
  Widget build(BuildContext context) {
    return ThemeWrapper(
      builder: (context, colors, fonts, icons, controller) {
        return Container(
          height: 48.h,
          margin: EdgeInsets.symmetric(horizontal: 16.w),
          width: double.infinity,
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                // ignore: deprecated_member_use
                color: Colors.black.withOpacity(0.12),
                blurRadius: 25.0,
                spreadRadius: 0.0,
                offset: const Offset(0.0, 4.0),
              ),
            ],
            borderRadius: BorderRadius.circular(6.r),
            color: colors.shade0,
          ),
          child: Row(
            children: [
              Container(
                width: 8.w,
                height: 48.h,
                decoration: BoxDecoration(
                  color: const Color(0xFF0ACE58),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(6.r),
                    bottomLeft: Radius.circular(6.r),
                  ),
                ),
              ),
              16.w.horizontalSpace,
              Text(
                message,
                style: fonts.smallMain.copyWith(
                  fontSize: 15.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const Spacer(),
              AnimationButtonEffect(
                onTap: onDismissed,
                child: icons.cancel.svg(
                  width: 12.w,
                  height: 12.h,
                  color: const Color(0xFFACACAC),
                ),
              ),
              4.w.horizontalSpace,
            ],
          ),
        );
      },
    );
  }
}

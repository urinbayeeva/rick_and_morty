import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rick_and_morty/presentation/styles/theme_wrapper.dart';

class CustomCheckBoxComponent extends StatelessWidget {
  const CustomCheckBoxComponent({
    super.key,
    required this.isCheck,
    required this.onChanged,
    this.horizontalMargin = 12,
  });

  final bool isCheck;
  final Function() onChanged;
  final double horizontalMargin;

  @override
  Widget build(BuildContext context) {
    return ThemeWrapper(
      builder: (context, colors, fonts, icons, controller) {
        return GestureDetector(
          onTap: onChanged,
          child: Container(
            height: 20.w,
            width: 20.w,
            margin: EdgeInsets.symmetric(horizontal: horizontalMargin.w),
            decoration: ShapeDecoration(
              color: colors.shade0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50.r),
                side: BorderSide(width: 1.w, color: colors.neutral500),
              ),
            ),
            child:
                isCheck
                    ? Container(
                      height: 10.w,
                      width: 10.w,
                      margin: EdgeInsets.all(3.r),
                      decoration: ShapeDecoration(
                        color: colors.error500,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50.r),
                        ),
                      ),
                    )
                    : null,
          ),
        );
      },
    );
  }
}

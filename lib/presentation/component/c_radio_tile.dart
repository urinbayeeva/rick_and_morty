import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rick_and_morty/presentation/component/animation_effect.dart';
import 'package:rick_and_morty/presentation/styles/theme_wrapper.dart';

class CustomRadioTile<T> extends StatelessWidget {
  final T value;
  final T groupValue;
  final Widget title;
  final Function(T?) onChanged;

  const CustomRadioTile({
    super.key,
    required this.value,
    required this.groupValue,
    required this.title,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return ThemeWrapper(
      builder: (ctx, colors, fonts, icons, _) {
        final isSelected = value == groupValue;

        return AnimationButtonEffect(
          onTap: () => onChanged(value),
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 16.w),
            margin: EdgeInsets.symmetric(vertical: 8.h),
            decoration: BoxDecoration(
              color: isSelected ? colors.secondary800 : colors.shade0,
              borderRadius: BorderRadius.circular(8.r),
              border: Border.all(color: colors.neutral400),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                title,
                if (isSelected)
                  Icon(Icons.check_circle, color: colors.error500, size: 24.sp),
              ],
            ),
          ),
        );
      },
    );
  }
}

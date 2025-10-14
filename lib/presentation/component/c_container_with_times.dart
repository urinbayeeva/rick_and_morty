import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rick_and_morty/presentation/styles/theme_wrapper.dart';

class CContainerWithTimes extends StatelessWidget {
  const CContainerWithTimes({super.key});

  @override
  Widget build(BuildContext context) {
    return ThemeWrapper(
      builder: (context, colors, fonts, icons, controller) {
        return Container(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.r),
            color: colors.shade0,
          ),
          child: Column(
            children: List.generate(1, (index) => _buildTimeRow(colors, fonts)),
          ),
        );
      },
    );
  }

  Widget _buildTimeRow(colors, fonts) {
    return Padding(
      padding: EdgeInsets.only(bottom: 8.h),
      child: Row(
        children: List.generate(
          3,
          (index) => Expanded(child: _buildTimeContainer(colors, fonts)),
        ),
      ),
    );
  }

  Widget _buildTimeContainer(colors, fonts) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 4.w),
      padding: EdgeInsets.symmetric(horizontal: 2, vertical: 20),
      decoration: BoxDecoration(
        color: colors.secondary800,
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Понедельник",
            style: fonts.smallSemLink.copyWith(
              fontSize: 13.5.sp,
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(height: 4.h),
          Text(
            "09:00 - 18:00",
            style: fonts.smallSemLink.copyWith(
              fontSize: 12.sp,
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }
}

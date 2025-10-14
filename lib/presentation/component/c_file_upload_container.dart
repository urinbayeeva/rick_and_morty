import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rick_and_morty/presentation/component/c_button.dart';
import 'package:rick_and_morty/presentation/styles/theme.dart';
import 'package:rick_and_morty/presentation/styles/theme_wrapper.dart';

class CFileUploadContainer extends StatelessWidget {
  final VoidCallback onTap;
  const CFileUploadContainer({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return ThemeWrapper(
      builder: (context, colors, fonts, icons, controller) {
        return Container(
          padding: EdgeInsets.all(16.w),
          decoration: BoxDecoration(
            color: colors.shade0,
            border: Border.all(width: 1, color: Color(0xFFE6E6E6)),
            borderRadius: BorderRadius.circular(8.r),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              40.h.verticalSpace,
              icons.resumeFile.svg(width: 48.w, height: 58.h),
              2.h.verticalSpace,
              Text(
                "file_max_15mb".tr(),
                style: fonts.regularLink.copyWith(
                  color: colors.neutral600,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
              12.h.verticalSpace,
              CButton(
                title: "upload".tr(),
                onTap: onTap,
                backgroundColor: colors.neutral200,
                textColor: colors.primary900,
              ),
              20.h.verticalSpace,
            ],
          ),
        );
      },
    );
  }
}

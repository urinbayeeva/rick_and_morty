import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rick_and_morty/presentation/component/animation_effect.dart';
import 'package:rick_and_morty/presentation/component/c_button.dart';
import 'package:rick_and_morty/presentation/component/c_divider.dart';
import 'package:rick_and_morty/presentation/styles/theme_wrapper.dart';

class CBottomsheetProfile extends StatefulWidget {
  final VoidCallback onTapBack;
  final VoidCallback onTapLogOut;
  const CBottomsheetProfile({
    super.key,
    required this.onTapBack,
    required this.onTapLogOut,
  });

  @override
  State<CBottomsheetProfile> createState() => _CBottomsheetProfileState();
}

class _CBottomsheetProfileState extends State<CBottomsheetProfile> {
  @override
  Widget build(BuildContext context) {
    return ThemeWrapper(
      builder: (ctx, colors, fonts, icons, controller) {
        return Container(
          padding: EdgeInsets.only(
            top: 12.h,
            bottom: MediaQuery.of(context).padding.bottom + 8.h,
            left: 16.w,
            right: 16.w,
          ),
          decoration: BoxDecoration(
            color: colors.shade0,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(24.r),
              topRight: Radius.circular(24.r),
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                width: 32.w,
                height: 2.h,
                decoration: BoxDecoration(
                  color: colors.neutral500,
                  borderRadius: BorderRadius.circular(16.r),
                ),
              ),
              12.h.verticalSpace,
              Text(
                "Вы действительно хотите выйти\nиз этого аккаунта?",
                textAlign: TextAlign.center,
                style: fonts.smallMain.copyWith(fontSize: 16.sp),
              ),
              26.h.verticalSpace,
              const CDivider(padding: false),
              16.h.verticalSpace,
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.w),
                child: Row(
                  children: [
                    Expanded(
                      child: AnimationButtonEffect(
                        onTap: widget.onTapBack,
                        child: Text(
                          "Отмена",
                          style: fonts.smallMain.copyWith(
                            fontSize: 15.sp,
                            fontWeight: FontWeight.w500,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                    Expanded(
                      child: CButton(
                        borderRadius: 22,
                        onTap: widget.onTapLogOut,
                        title: "Выйти",
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

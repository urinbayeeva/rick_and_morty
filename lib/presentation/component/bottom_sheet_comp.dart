import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rick_and_morty/presentation/component/animation_effect.dart';
import 'package:rick_and_morty/presentation/styles/theme_wrapper.dart';

class BottomSheetComp extends StatefulWidget {
  const BottomSheetComp({
    super.key,
    required this.firstItem,
    required this.onTapFirst,
    required this.secondItem,
    required this.onTapSecond,
    this.thirdItem,
    this.onTapThird,
    this.fourthItem,
    this.onTapFourth,
  });

  final String firstItem;
  final VoidCallback onTapFirst;
  final String secondItem;
  final VoidCallback onTapSecond;
  final String? thirdItem;
  final VoidCallback? onTapThird;
  final String? fourthItem;
  final VoidCallback? onTapFourth;

  @override
  State<BottomSheetComp> createState() => _BottomSheetCompState();
}

class _BottomSheetCompState extends State<BottomSheetComp> {
  @override
  Widget build(BuildContext context) {
    return ThemeWrapper(
      builder: (context, colors, fonts, icons, controller) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              margin: EdgeInsets.all(16.w),
              padding: EdgeInsets.symmetric(vertical: 4.h),
              width: double.infinity,
              decoration: ShapeDecoration(
                color: colors.shade0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.r),
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  AnimationButtonEffect(
                    onTap: () {
                      Navigator.pop(context);
                      widget.onTapFirst();
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 12.0.h),
                      width: double.infinity,
                      color: colors.transparent,
                      child: Center(
                        child: Text(
                          semanticsLabel: widget.firstItem,
                          widget.firstItem,
                          style: fonts.headlineMain.copyWith(fontSize: 18.sp),
                        ),
                      ),
                    ),
                  ),
                  Divider(thickness: 1, color: colors.neutral400),
                  AnimationButtonEffect(
                    onTap: () {
                      Navigator.pop(context);
                      widget.onTapSecond();
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 12.0.h),
                      width: double.infinity,
                      color: colors.transparent,
                      child: Center(
                        child: Text(
                          semanticsLabel: widget.secondItem,
                          widget.secondItem,
                          style: fonts.headlineMain.copyWith(fontSize: 18.sp),
                        ),
                      ),
                    ),
                  ),
                  if (widget.thirdItem != null)
                    Column(
                      children: [
                        Divider(thickness: 1, color: colors.neutral400),
                        AnimationButtonEffect(
                          onTap: () {
                            Navigator.pop(context);
                            if (widget.onTapThird != null) {
                              widget.onTapThird!();
                            }
                          },
                          child: Container(
                            padding: EdgeInsets.symmetric(vertical: 12.0.h),
                            width: double.infinity,
                            color: colors.transparent,
                            child: Center(
                              child: Text(
                                semanticsLabel: widget.thirdItem ?? '',
                                widget.thirdItem ?? '',
                                style: fonts.headlineMain.copyWith(
                                  fontSize: 18.sp,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  if (widget.fourthItem != null)
                    Column(
                      children: [
                        Divider(thickness: 1, color: colors.neutral400),
                        AnimationButtonEffect(
                          onTap: () {
                            Navigator.pop(context);
                            if (widget.onTapFourth != null) {
                              widget.onTapFourth!();
                            }
                          },
                          child: Container(
                            padding: EdgeInsets.symmetric(vertical: 12.0.h),
                            width: double.infinity,
                            color: colors.transparent,
                            child: Center(
                              child: Text(
                                semanticsLabel: widget.fourthItem ?? '',
                                widget.fourthItem ?? '',
                                style: fonts.headlineMain.copyWith(
                                  fontSize: 18.sp,
                                  color: colors.primary500,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                ],
              ),
            ),

            /// cancel
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: AnimationButtonEffect(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Container(
                  width: double.infinity,
                  height: 56.h,
                  decoration: ShapeDecoration(
                    color: colors.neutral800,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.r),
                    ),
                  ),
                  child: Center(
                    child: Text(
                      "",
                      style: fonts.headlineMain.copyWith(
                        fontSize: 18.sp,
                        color: colors.shade0,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            (MediaQuery.of(context).padding.bottom + 8.w).verticalSpace,
          ],
        );
      },
    );
  }
}

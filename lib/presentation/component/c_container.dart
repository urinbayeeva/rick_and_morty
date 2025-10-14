import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rick_and_morty/presentation/styles/theme_wrapper.dart';

class CContainer extends StatelessWidget {
  final String? text;
  final double width;
  final EdgeInsetsGeometry margin;

  const CContainer({
    super.key,
    this.text,
    this.margin = EdgeInsets.zero,
    this.width = double.infinity,
  });

  @override
  Widget build(BuildContext context) {
    return ThemeWrapper(
      builder: (context, colors, fonts, icons, controller) {
        return Container(
          width: width,
          padding: EdgeInsets.all(12.w),
          margin: margin,
          decoration: BoxDecoration(
            color: colors.shade0,
            borderRadius: BorderRadius.circular(8.r),
          ),
          child: SingleChildScrollView(
            child: Text(
              text ?? "",
              style: fonts.xSmallText.copyWith(
                fontSize: 13.sp,
                fontWeight: FontWeight.w400,
              ),
              overflow: TextOverflow.visible,
              softWrap: true,
              maxLines: null,
            ),
          ),
        );
      },
    );
  }
}

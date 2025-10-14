import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rick_and_morty/presentation/styles/theme.dart';
import 'package:rick_and_morty/presentation/styles/theme_wrapper.dart';
import 'package:url_launcher/url_launcher.dart';

class CLinkContainer extends StatelessWidget {
  final String? text;
  final String? linkText;
  final String? link;
  const CLinkContainer({super.key, this.text, this.linkText, this.link});

  @override
  Widget build(BuildContext context) {
    return ThemeWrapper(
      builder: (context, colors, fonts, icons, controller) {
        return Container(
          padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 16.w),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.r),
            border: Border.all(width: 1, color: colors.neutral400),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                text ?? "",
                style: fonts.xSmallLink.copyWith(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
              8.h.verticalSpace,
              TextButton(
                style: TextButton.styleFrom(
                  minimumSize: Size.zero,
                  padding: EdgeInsets.zero,
                  tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                ),
                // iconAlignment: IconAlignment.start,
                onPressed: () async {
                  if (link != null && await canLaunchUrl(Uri.parse(link!))) {
                    await launchUrl(Uri.parse(link!));
                  } else {}
                },
                child: Row(
                  children: [
                    Text(
                      linkText ?? "",
                      style: fonts.xSmallLink.copyWith(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w600,
                        color: colors.error500,
                      ),
                    ),
                    4.w.horizontalSpace,
                    icons.right.svg(
                      width: 16.w,
                      height: 16.h,
                      color: colors.error500,
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

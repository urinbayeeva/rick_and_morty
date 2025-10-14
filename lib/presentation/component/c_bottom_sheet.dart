import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rick_and_morty/presentation/styles/theme.dart';
import 'package:rick_and_morty/presentation/styles/theme_wrapper.dart';

class CustomBottomSheet extends StatelessWidget {
  final String title;
  final Widget Function(BuildContext context) builder;

  const CustomBottomSheet({
    super.key,
    required this.title,
    required this.builder,
  });

  @override
  Widget build(BuildContext context) {
    return ThemeWrapper(
      builder: (ctx, colors, fonts, icons, controller) {
        return Container(
          decoration: BoxDecoration(
            color: colors.shade0,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(24.r),
              topRight: Radius.circular(24.r),
            ),
            border: Border(top: BorderSide(color: colors.primary900)),
          ),
          child: SingleChildScrollView(
            padding: EdgeInsets.only(
              top: 12.h,
              bottom: MediaQuery.of(context).padding.bottom + 8.h,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: 32.w,
                  height: 2.h,
                  decoration: BoxDecoration(
                    color: colors.neutral500,
                    borderRadius: BorderRadius.circular(16.r),
                  ),
                ),
                ListTile(
                  contentPadding: EdgeInsets.only(left: 16.w),
                  title: Text(
                    semanticsLabel: title,
                    title,
                    textAlign: TextAlign.start,
                    style: fonts.smallMain,
                  ),
                  trailing: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 12.w),
                    child: IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: icons.cancel.svg(color: colors.neutral500),
                    ),
                  ),
                ),
                builder(context),
              ],
            ),
          ),
        );
      },
    );
  }
}

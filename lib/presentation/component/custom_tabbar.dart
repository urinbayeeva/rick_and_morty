import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rick_and_morty/presentation/styles/theme_wrapper.dart';

/// Flexible black tab bar
class CustomTabbarBlack extends StatelessWidget {
  const CustomTabbarBlack({
    super.key,
    required this.tabs,
    this.isScrollable = true,
    this.labelPadding = EdgeInsets.zero,
    this.padding = EdgeInsets.zero,
    this.backgroundColor,
    this.indicatorColor,
    this.onTap,
    this.selectedIndex,
  });

  final List<String> tabs;
  final bool isScrollable;
  final EdgeInsetsGeometry labelPadding;
  final EdgeInsetsGeometry padding;
  final Color? backgroundColor;
  final Color? indicatorColor;
  final void Function(int i)? onTap;
  final int? selectedIndex;

  @override
  Widget build(BuildContext context) {
    return ThemeWrapper(
      builder: (context, colors, fonts, icons, controller) {
        return Container(
          decoration: BoxDecoration(color: backgroundColor ?? colors.shade0),
          height: 50.h,
          width: double.infinity,
          child: TabBar(
            overlayColor: const WidgetStatePropertyAll(Colors.transparent),
            labelPadding: labelPadding,
            padding: padding,
            indicatorColor: indicatorColor ?? colors.error500,
            isScrollable: isScrollable,
            tabAlignment: isScrollable ? TabAlignment.start : null,
            labelStyle: fonts.xSmallLink.copyWith(fontSize: 12.sp),
            unselectedLabelStyle: fonts.xSmallLink.copyWith(fontSize: 12.sp),
            onTap: onTap,
            tabs:
                tabs.asMap().entries.map((entry) {
                  final index = entry.key;
                  final title = entry.value;
                  if (selectedIndex != null) {
                    final isSelected = index == selectedIndex;

                    return Tab(
                      child: Center(
                        child: Text(
                          title,
                          textAlign: TextAlign.center,
                          style: fonts.xSmallLink.copyWith(
                            fontSize: 12.sp,
                            color:
                                isSelected
                                    ? colors.error500
                                    : colors.darkMode900,
                          ),
                        ),
                      ),
                    );
                  }

                  return Tab(
                    child: Center(
                      child: Text(
                        title,
                        textAlign: TextAlign.center,
                        style: fonts.xSmallLink,
                      ),
                    ),
                  );
                }).toList(),
          ),
        );
      },
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:rick_and_morty/presentation/styles/theme_wrapper.dart';

class CustomExpansionListTile extends StatefulWidget {
  final String title;
  final String? hasIcon;
  final String? subtitle;
  final String description;
  final Widget? titleWidget;
  final dynamic price;
  final List<Widget> children;
  final Function(bool)? onExpansionChanged;

  const CustomExpansionListTile({
    super.key,
    required this.title,
    this.subtitle,
    this.description = '',
    this.price,
    required this.children,
    this.onExpansionChanged,
    this.hasIcon,
    this.titleWidget,
  });

  @override
  State<CustomExpansionListTile> createState() =>
      _CustomExpansionListTileState();
}

class _CustomExpansionListTileState extends State<CustomExpansionListTile> {
  final GlobalKey<_CustomExpansionListTileState> _expansionTileKey =
      GlobalKey();

  @override
  Widget build(BuildContext context) {
    return ThemeWrapper(
      builder: (context, colors, fonts, icons, controller) {
        return Container(
          margin: EdgeInsets.only(bottom: 8.h),
          decoration: BoxDecoration(
            color: colors.shade0,
            borderRadius: BorderRadius.circular(8.r),
          ),
          child: Theme(
            data: Theme.of(context).copyWith(
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              dividerColor: Colors.transparent,
            ),
            child: ExpansionTile(
              iconColor: colors.error500,
              // initiallyExpanded: true,
              key: _expansionTileKey,
              childrenPadding: EdgeInsets.symmetric(horizontal: 16.w),
              collapsedBackgroundColor: Colors.transparent,
              backgroundColor: Colors.transparent,
              controlAffinity: ListTileControlAffinity.trailing,
              title:
                  (widget.titleWidget != null)
                      ? widget.titleWidget!
                      : widget.hasIcon != null
                      ? Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SvgPicture.asset(widget.hasIcon!),
                          6.w.horizontalSpace,
                          Text(
                            widget.title,
                            style: fonts.smallSemLink.copyWith(
                              color: colors.primary900,
                              fontWeight: FontWeight.bold,
                              fontSize: 13.sp,
                            ),
                          ),
                        ],
                      )
                      : Text(
                        widget.title,
                        style: fonts.smallSemLink.copyWith(
                          color: colors.primary900,
                          fontWeight: FontWeight.bold,
                          fontSize: 13.sp,
                        ),
                      ),
              subtitle: widget.subtitle != null ? Text(widget.subtitle!) : null,
              children:
                  widget.children, // Correctly passing the list of widgets
            ),
          ),
        );
      },
    );
  }
}

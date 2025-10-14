import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rick_and_morty/presentation/styles/theme.dart';
import 'package:rick_and_morty/presentation/styles/theme_wrapper.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class CustomPagination extends StatelessWidget {
  final VoidCallback? onRefresh;
  final VoidCallback? onLoading;
  final VoidCallback onRetry;
  final RefreshController controller;
  final Widget? child;
  final Axis? scrollDirection;
  final bool? enablePullDown;
  final bool? enablePullUp;
  final bool? hasFloatActionButton;
  final ScrollController? scrollController;
  final bool? primary;
  final bool reverse;

  const CustomPagination({
    super.key,
    required this.controller,
    this.onRefresh,
    this.onLoading,
    this.child,
    required this.onRetry,
    this.scrollDirection,
    this.enablePullDown,
    this.enablePullUp,
    this.hasFloatActionButton,
    this.scrollController,
    this.primary,
    this.reverse = false,
  });

  @override
  Widget build(BuildContext context) {
    return ThemeWrapper(
      builder: (
        BuildContext context,
        CustomColorSet colors,
        FontSet fonts,
        IconSet icons,
        _,
      ) {
        return SmartRefresher(
          reverse: reverse,
          scrollController: scrollController,
          scrollDirection: scrollDirection,
          primary: primary,
          enablePullDown: enablePullDown ?? true,
          enablePullUp: enablePullUp ?? true,
          header: WaterDropMaterialHeader(
            color: colors.shade0,
            backgroundColor: colors.primary500,
          ),
          footer: CustomFooter(
            height: 56 + ((hasFloatActionButton ?? false) ? 88.h : 0),
            builder: (BuildContext context, LoadStatus? mode) {
              Widget body;
              if (mode == LoadStatus.idle) {
                body = const SizedBox();
              } else if (mode == LoadStatus.loading) {
                body = CupertinoActivityIndicator(color: colors.primary500);
              } else if (mode == LoadStatus.failed) {
                body = Padding(
                  padding: EdgeInsets.only(
                    bottom: MediaQuery.of(context).padding.bottom + 8.h,
                  ),
                  child: RichText(
                    text: TextSpan(
                      style: fonts.xSmallLink,
                      children: <TextSpan>[
                        TextSpan(
                          semanticsLabel: 'something_went_wrong',
                          text: 'something_went_wrong',
                          style: fonts.xSmallLink,
                        ),
                        const TextSpan(text: ". "),
                        TextSpan(
                          semanticsLabel: 'retry',
                          text: 'retry',
                          style: fonts.xSmallLink.copyWith(
                            color: colors.primary500,
                          ),
                          recognizer:
                              TapGestureRecognizer()
                                ..onTap = () {
                                  onRetry();
                                },
                        ),
                      ],
                    ),
                  ),
                );
              } else if (mode == LoadStatus.canLoading) {
                body = CupertinoActivityIndicator(color: colors.primary500);
              } else if (mode == LoadStatus.noMore) {
                body = Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  child: Text(
                    semanticsLabel: "no_more_data",
                    "no_more_data",
                    style: fonts.xSmallLink,
                  ),
                );
              } else {
                body = Text(
                  semanticsLabel: "no_more_data",
                  "no_more_data",
                  style: fonts.xSmallLink,
                );
              }
              return SizedBox(
                height: 56 + ((hasFloatActionButton ?? false) ? 0.h : 0),
                child: Center(child: body),
              );
            },
          ),
          controller: controller,
          onRefresh: onRefresh,
          onLoading: onLoading,
          child: child,
        );
      },
    );
  }
}

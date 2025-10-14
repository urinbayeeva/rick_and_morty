import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:formz/formz.dart';
import 'package:rick_and_morty/infrastructure/services/local_database/db_service.dart';
import 'package:rick_and_morty/presentation/component/c_outlined_button.dart';
import 'package:rick_and_morty/presentation/component/custom_pagination.dart';
import 'package:rick_and_morty/presentation/component/shimmer_view.dart';
import 'package:rick_and_morty/presentation/styles/theme.dart';
import 'package:rick_and_morty/presentation/styles/theme_wrapper.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class CustomListView<T> extends StatefulWidget {
  final List<T> data;
  final Function(int index, T item)? onDeleteItem;
  final Function(int pageNumber)? onLoading;
  final Function? onRefresh;
  final Widget Function(int index, T item) itemBuilder;
  final ErrorWidgetModel? emptyWidgetModel;
  final ErrorWidgetModel? authErrorWidget;
  final Widget Function(int index)? loadingItem;
  final ScrollController? scrollController;
  final GlobalKey<AnimatedListState>? animatedListKey;
  final RefreshController? refreshController;
  final int loadingItemCount;
  final bool? enablePullDown;
  final bool? enablePullUp;
  final bool? hasFloatActionButton;
  final Axis? scrollDirection;
  final bool? primary;
  final FormzSubmissionStatus status;
  final EdgeInsetsGeometry? padding;
  final bool reverse;
  final ScrollPhysics? physics;
  final String? errorMessage;
  final String? errorTitle;
  final String? errorIcon;
  final int? count;

  const CustomListView({
    super.key,
    required this.itemBuilder,
    required this.data,
    this.onRefresh,
    this.onLoading,
    this.scrollDirection,
    this.enablePullDown,
    this.enablePullUp,
    this.hasFloatActionButton,
    this.scrollController,
    this.primary,
    this.loadingItem,
    this.animatedListKey,
    this.loadingItemCount = 1,
    this.onDeleteItem,
    this.refreshController,
    this.padding,
    this.reverse = false,
    this.physics,
    required this.emptyWidgetModel,
    required this.status,
    this.authErrorWidget,
    this.errorMessage,
    this.errorTitle,
    this.errorIcon,
    this.count,
  });

  @override
  State<CustomListView<T>> createState() => _CustomListViewState();
}

class _CustomListViewState<T> extends State<CustomListView<T>> {
  late RefreshController _refreshController;

  late GlobalKey<AnimatedListState>? animatedListKey;
  int _pageNumber = 1;

  void _onRefresh() async {
    _pageNumber = 1;

    _refreshController.footerMode?.value = LoadStatus.canLoading;
    try {
      if (widget.onRefresh != null) {
        widget.onRefresh!();
      }
    } catch (e) {
      _refreshController.footerMode?.value = LoadStatus.failed;
    }
  }

  void _onLoading() async {
    if (mounted) {
      _pageNumber = _pageNumber + 1;
      if (widget.onLoading != null) {
        widget.onLoading!(_pageNumber);
      }
    }
    _refreshController.loadComplete();
  }

  @override
  void initState() {
    _refreshController =
        widget.refreshController ?? RefreshController(initialRefresh: false);
    animatedListKey = widget.animatedListKey;
    super.initState();
  }

  @override
  void dispose() {
    _refreshController.dispose();
    super.dispose();
  }

  @override
  void didUpdateWidget(covariant CustomListView<T> oldWidget) {
    if (widget.refreshController != null) {
      _refreshController = widget.refreshController!;
    }
    if (widget.animatedListKey != null && animatedListKey == null) {
      animatedListKey = widget.animatedListKey!;
    }
    if (widget.status.isInitial) {
      _pageNumber = 1;
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Builder(
        builder: (context) {
          if (widget.status.isInitial) {
            return ListView(
              padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 0.h),
              shrinkWrap: true,
              physics: widget.physics,
              reverse: widget.reverse,
              controller: widget.scrollController,
              scrollDirection: widget.scrollDirection ?? Axis.vertical,
              children: List.generate(widget.loadingItemCount, (index) {
                if (widget.loadingItem != null) {
                  return widget.loadingItem!(index);
                }
                return ShimmerView(
                  child: ShimmerContainer(
                    margin: EdgeInsets.symmetric(
                      vertical: 8.h,
                      horizontal: 16.w,
                    ),
                    height: 48.h,
                    width: double.infinity,
                  ),
                );
              }),
            );
            // } else if (widget.authErrorWidget != null &&
            //     context.read<DBService>().token.accessToken == null) {
            //   return CustomErrorWidget(errorWidgetModel: widget.authErrorWidget);
          } else if (widget.status.isFailure) {
            return CustomErrorWidget(
              errorWidgetModel: ErrorWidgetModel(
                title: widget.errorTitle ?? "something_went_wrong",
                subtitle: widget.errorMessage ?? "something_wrong_subtitle",
                icon: widget.errorIcon ?? IconSet.create.emojiSad,
                buttonAction: widget.onRefresh,
                buttonText: "restart",
              ),
            );
          } else if (widget.status.isSuccess && widget.data.isEmpty) {
            return CustomErrorWidget(errorWidgetModel: widget.emptyWidgetModel);
          } else {
            return CustomPagination(
              reverse: widget.reverse,
              onRetry: () {
                if (widget.onLoading != null) {
                  widget.onLoading!(_pageNumber);
                }
              },
              controller: _refreshController,
              onRefresh: _onRefresh,
              onLoading: _onLoading,
              scrollController: widget.scrollController,
              scrollDirection: widget.scrollDirection,
              enablePullDown: widget.enablePullDown,
              enablePullUp: widget.enablePullUp,
              hasFloatActionButton: widget.hasFloatActionButton,
              primary: widget.primary,
              child: AnimatedList(
                reverse: widget.reverse,
                key: animatedListKey,
                padding: widget.padding,
                physics: const ClampingScrollPhysics(),
                primary: false,
                // controller: widget.scrollController,
                shrinkWrap: true,
                scrollDirection: widget.scrollDirection ?? Axis.vertical,
                initialItemCount:
                    widget.count == null ? widget.data.length : widget.count!,
                itemBuilder: (context, index, animation) {
                  if (widget.data.length - 1 < index) {
                    return const SizedBox();
                  }
                  T item = widget.data[index];
                  return Builder(
                    builder: (context) {
                      if (widget.onDeleteItem != null) {
                        return Dismissible(
                          key: Key('${item.hashCode}'),
                          onDismissed: (direction) {
                            widget.onDeleteItem!(index, item);
                          },
                          background: Container(color: Colors.red[700]),
                          direction: DismissDirection.startToEnd,
                          child: widget.itemBuilder(index, item),
                        );
                      } else {
                        return widget.itemBuilder(index, item);
                      }
                    },
                  );
                },
              ),
            );
          }
        },
      ),
    );
  }
}

class CustomErrorWidget extends StatelessWidget {
  final ErrorWidgetModel? errorWidgetModel;

  const CustomErrorWidget({super.key, required this.errorWidgetModel});

  @override
  Widget build(BuildContext context) {
    if (errorWidgetModel != null) {
      return ThemeWrapper(
        builder: (context, colors, fonts, icons, controller) {
          return Column(
            mainAxisAlignment:
                errorWidgetModel!.isFocusedButton
                    ? MainAxisAlignment.center
                    : MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              if (!errorWidgetModel!.isFocusedButton) 64.h.verticalSpace,
              if (errorWidgetModel?.icon != null)
                Padding(
                  padding: EdgeInsets.only(bottom: 16.h),
                  child: errorWidgetModel!.icon!.svg(height: 56.h, width: 56.w),
                ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 80.w),
                child: Text(
                  semanticsLabel: errorWidgetModel!.title,
                  errorWidgetModel!.title,
                  textAlign: TextAlign.center,
                  style: fonts.xSmallLink,
                ),
              ),
              8.h.verticalSpace,
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 72.w),
                child: Text(
                  semanticsLabel: errorWidgetModel!.subtitle,
                  errorWidgetModel!.subtitle,
                  textAlign: TextAlign.center,
                  style: fonts.xSmallLink.copyWith(color: colors.neutral700),
                ),
              ),
              16.h.verticalSpace,
              if (errorWidgetModel!.buttonText != null)
                Builder(
                  builder: (context) {
                    if (errorWidgetModel!.isFocusedButton) {
                      return CustomButton(
                        titleStyle: fonts.xSmallLink.copyWith(
                          color: colors.neutral50,
                        ),
                        isInfinityWidth: false,
                        horizontalPadding: 24.w,
                        verticalPadding: 12.h,
                        borderColor: colors.neutral200,
                        onPressed: () {
                          if (errorWidgetModel!.buttonAction != null) {
                            errorWidgetModel!.buttonAction!();
                          }
                        },
                        title: errorWidgetModel!.buttonText!,
                      );
                    }
                    return CustomOutlinedButton(
                      horizontalPadding: 24.w,
                      borderColor: colors.neutral700,
                      style: fonts.xSmallLink,
                      onPressed: () {
                        if (errorWidgetModel!.buttonAction != null) {
                          errorWidgetModel!.buttonAction!();
                        }
                      },
                      title: errorWidgetModel!.buttonText!,
                    );
                  },
                ),
              MediaQuery.of(context).padding.bottom.verticalSpace,
              16.h.verticalSpace,
            ],
          );
        },
      );
    } else {
      return const SizedBox();
    }
  }
}

class ErrorWidgetModel {
  final String title;
  final String subtitle;
  final String? buttonText;
  final Function? buttonAction;
  final String? icon;
  final bool isFocusedButton;

  ErrorWidgetModel({
    required this.title,
    required this.subtitle,
    this.buttonText,
    this.buttonAction,
    this.icon,
    this.isFocusedButton = false,
  });
}

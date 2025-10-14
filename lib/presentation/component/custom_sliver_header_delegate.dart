import 'package:flutter/material.dart';

class CustomSliverHeaderDelegate extends SliverPersistentHeaderDelegate {
  final Widget child;
  final double height;
  final double? minHeight;

  CustomSliverHeaderDelegate({
    required this.child,
    required this.height,
    this.minHeight,
  });

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    return SizedBox.expand(child: child);
  }

  @override
  double get maxExtent => height;

  @override
  double get minExtent => minHeight ?? 0;

  @override
  bool shouldRebuild(covariant CustomSliverHeaderDelegate oldDelegate) {
    return oldDelegate.child != child || oldDelegate.height != height;
  }
}

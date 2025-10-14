import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../styles/theme.dart';
import '../styles/theme_wrapper.dart';
import 'app_loading_component.dart';

class CachedImageComponent extends StatelessWidget {
  final double height;
  final double width;
  final String imageUrl;
  final double borderRadius;
  final double borderWidth;
  final Color? color;
  final BoxFit fit;
  final bool isNetwork;

  const CachedImageComponent(
      {super.key,
      required this.height,
      required this.width,
      required this.imageUrl,
      this.borderWidth = 0,
      this.borderRadius = 0,
      this.color,
      this.fit = BoxFit.contain,
      this.isNetwork = true});

  @override
  Widget build(BuildContext context) {
    return ThemeWrapper(
      builder: (BuildContext context, CustomColorSet colors, FontSet fonts,
          IconSet icons, controller) {
        return Container(
          height: height,
          width: width,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(borderRadius),
            border: Border.all(
              color: colors.shade0,
              width: borderWidth.h,
            ),
            color: color,
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(borderRadius),
            child: imageUrl.contains(".svg")
                ? SvgPicture.network(
                    imageUrl,
                    fit: fit,
                    height: height,
                    width: width,
                    colorFilter: color != null
                        ? ColorFilter.mode(color!, BlendMode.srcIn)
                        : null,
                  )
                : isNetwork
                    ? CachedNetworkImage(
                        imageUrl: imageUrl,
                        fit: fit,
                        placeholder: (context, url) => const Center(
                              child: AppLoadingComponent(),
                            ),
                        errorWidget: (context, _, __) => icons.stethoscope.svg(
                            width: width,
                            height: height,
                            color: colors.error500))
                    : Image.file(
                        File(imageUrl),
                        fit: fit,
                        height: height,
                        width: width,
                      ),
          ),
        );
      },
    );
  }
}

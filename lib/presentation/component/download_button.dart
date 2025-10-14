// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:rick_and_morty/presentation/styles/theme_wrapper.dart';

// class DownloadButton extends StatelessWidget {
//   const DownloadButton({
//     super.key,
//     this.height = 32,
//     this.width = 32,
//     this.icon,
//     required this.onTap,
//   });

//   final double height;
//   final double width;
//   final Widget? icon;
//   final VoidCallback onTap;

//   @override
//   Widget build(BuildContext context) {
//     return WScaleAnimation(
//       onTap: onTap,
//       child: DecoratedBox(
//         decoration: BoxDecoration(
//           color: const Color(0xffF2F2F3),
//           borderRadius: BorderRadius.circular(8),
//         ),
//         child: SizedBox(
//           height: height,
//           width: width,
//           child: Padding(
//             padding: const EdgeInsets.all(4),
//             child:
//                 icon ?? IconSet.create.download.svg(height: 20.h, width: 20.w),
//           ),
//         ),
//       ),
//     );
//   }
// }

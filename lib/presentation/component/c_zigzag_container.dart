// import 'package:flutter/material.dart';

// class CZigZagContainer extends StatelessWidget {
//   final Widget child;
//   final Color backgroundColor;

//   const CZigZagContainer({
//     super.key,
//     required this.child,
//     this.backgroundColor = Colors.white,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       decoration: BoxDecoration(
//         color: backgroundColor,
//         borderRadius: BorderRadius.circular(8),
//       ),
//       child: ClipPath(
//         clipper: ZigzagClipper(),
//         child: child,
//       ),
//     );
//   }
// }

// class ZigzagClipper extends CustomClipper<Path> {
//   @override
//   Path getClip(Size size) {
//     const double zigzagHeight = 10.0;
//     const double zigzagWidth = 15.0; // Reduced width makes teeth sharper

//     final path = Path();

//     // Top zigzag
//     path.moveTo(0, zigzagHeight);
//     for (double x = 0; x < size.width; x += zigzagWidth) {
//       path.lineTo(x + zigzagWidth / 2, 0);
//       path.lineTo(x + zigzagWidth, zigzagHeight);
//     }

//     // Right side
//     path.lineTo(size.width, size.height - zigzagHeight);

//     // Bottom zigzag
//     for (double x = size.width; x > 0; x -= zigzagWidth) {
//       path.lineTo(x - zigzagWidth / 2, size.height);
//       path.lineTo(x - zigzagWidth, size.height - zigzagHeight);
//     }

//     // Left side
//     path.lineTo(0, zigzagHeight);

//     return path;
//   }

//   @override
//   bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
// }

import 'package:flutter/material.dart';

class LinearGradientMask extends StatelessWidget {
  const LinearGradientMask(
      {super.key, required this.child, required this.gradient});
  final Widget child;
  final Gradient gradient;

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      blendMode: BlendMode.srcIn,
      shaderCallback: (bounds) {
        return gradient.createShader(bounds);
      },
      child: child,
    );
  }
}

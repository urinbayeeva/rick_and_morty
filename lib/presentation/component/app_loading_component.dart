import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppLoadingComponent extends StatelessWidget {
  const AppLoadingComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        backgroundColor: Colors.transparent,
        body: Center(
          child: CupertinoActivityIndicator(),
        ));
  }
}

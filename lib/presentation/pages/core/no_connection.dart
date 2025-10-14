import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rick_and_morty/infrastructure/services/connectivity.dart';
import 'package:rick_and_morty/presentation/component/c_outlined_button.dart';
import 'package:rick_and_morty/presentation/component/easy_loading.dart';
import 'package:rick_and_morty/presentation/routes/routes.dart';
import 'package:rick_and_morty/presentation/styles/theme_wrapper.dart';
import 'package:lottie/lottie.dart';

class NoConnection extends StatefulWidget {
  const NoConnection({super.key});

  @override
  State<NoConnection> createState() => _NoConnectionState();
}

class _NoConnectionState extends State<NoConnection> {
  Future<void> retry() async {
    // Navigator.push(context, MaterialPageRoute(builder: (_) => ErrorPage()));
    EasyLoading.show();
    final result = await ConnectivityX().create();
    if (result) {
      Navigator.pushAndRemoveUntil(
        context,
        AppRoutes.getMainPage(),
        (route) => false,
      );
      EasyLoading.dismiss();
      return;
    } else {
      return EasyLoading.dismiss();
    }
  }

  @override
  Widget build(BuildContext context) {
    return ThemeWrapper(
      builder: (context, colors, fonts, icons, c) {
        return Scaffold(
          backgroundColor: colors.shade0,
          body: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Center(child: Lottie.asset("assets/anim/no_internet.json")),
                16.verticalSpace,
                Text(
                  semanticsLabel: 'connection_is_afk'.tr(),
                  'connection_is_afk'.tr(),
                  style: fonts.mediumLink.copyWith(fontSize: 18.sp),
                ),
                10.verticalSpace,
                Text(
                  semanticsLabel: 'no_connection_body'.tr(),
                  'no_connection_body'.tr(),
                  textAlign: TextAlign.center,
                  style: fonts.smallMain,
                ),
                SizedBox(height: 20.h),
                CustomButton(
                  onPressed: () {
                    retry();
                  },
                  backgroundColor: colors.primary500,
                  titleColor: colors.shade0,
                  verticalPadding: 10.h,
                  title: 'retry'.tr(),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CLangRadio extends StatefulWidget {
  const CLangRadio({super.key});

  @override
  State<CLangRadio> createState() => _CLangRadioState();
}

class _CLangRadioState extends State<CLangRadio> {
  @override
  Widget build(BuildContext context) {
    final String currentLanguage =
        EasyLocalization.of(context)!.locale.languageCode;

    return Container(
      height: 243.h,
      decoration: BoxDecoration(
        color: Colors.white, // Replace with your desired color
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(8.r),
          topRight: Radius.circular(8.r),
        ),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 12.h),
        child: Column(
          children: [
            Container(
              width: 40.w,
              height: 3.h,
              decoration: BoxDecoration(
                color: const Color(0xFFE6E6E6),
                borderRadius: BorderRadius.circular(8.r),
              ),
            ),
            12.h.verticalSpace,
            Text(
              "select_language".tr(),
              style: TextStyle(
                fontSize: 17.sp,
                fontWeight: FontWeight.w600,
              ),
            ),
            8.h.verticalSpace,
            _buildLanguageOption(
              context,
              "Русский",
              'assets/icons/russia.svg',
              isSelected: currentLanguage == 'ru',
              locale: const Locale('ru', 'RU'),
            ),
            12.h.verticalSpace,
            _buildLanguageOption(
              context,
              "English",
              'assets/icons/usa.svg',
              isSelected: currentLanguage == 'en',
              locale: const Locale('en', 'US'),
            ),
            12.h.verticalSpace,
            _buildLanguageOption(
              context,
              "O'zbekcha",
              'assets/icons/uzbekistan.svg',
              isSelected: currentLanguage == 'uz',
              locale: const Locale('uz', 'UZ'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLanguageOption(
    BuildContext context,
    String language,
    String icon, {
    required bool isSelected,
    required Locale locale,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            SvgPicture.asset(icon, width: 24.w, height: 24.h),
            8.w.horizontalSpace,
            Text(
              language,
              style: TextStyle(
                fontSize: 15.sp,
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
        Radio<bool>(
          value: true,
          groupValue: isSelected,
          onChanged: (bool? value) {
            if (value == true) {
              setState(() {
                // Set locale in the bottom sheet
                EasyLocalization.of(context)!.setLocale(locale);
              });
              // Close the bottom sheet after language change
              Navigator.of(context).pop();
            }
          },
          activeColor: Colors.red,
        ),
      ],
    );
  }
}


//  onTap: () {
//                         EasyLocalization.of(context)!.setLocale(
//                           const Locale('uz', 'UZ'),
//                         );
//                       },
//                       title: "O’zbekcha",
//                       icon: icons.flagUz,
//                       isCheck: !(context.locale == const Locale('uz', 'UZ')),
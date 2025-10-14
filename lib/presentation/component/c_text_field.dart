import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rick_and_morty/presentation/styles/theme_wrapper.dart';

class CustomTextField extends StatefulWidget {
  final String title;
  final String subTitle;
  final String hintText;
  final String titleHintText;
  final bool isEmail;
  final bool isPassword;
  final bool obscureText;
  final int? minLines;
  final int? maxLines;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final void Function()? onsuffixIconPressed;
  final void Function()? onprefixIconPressed;
  final void Function()? onPressed;
  final TextInputType keyboardType;
  final String? error;
  final int? maxLength;
  final TextEditingController? controller;
  final List<TextInputFormatter>? formatter;
  final TextAlign textAlign;
  final bool readOnly;
  final bool? expands;
  final double? borderWidth;
  final double? borderRadius;
  final ValueChanged<String>? onChanged;
  final FocusNode? focusNode;
  final Color? fillColor;
  final Color? enableBorderColor;
  final InputBorder? border;
  final EdgeInsets? padding;
  final String? Function(String? value)? validator;
  final String? initialValue;
  final bool? autoFocus;
  final Color? cursorColor;
  final TextCapitalization textCapitalization;

  const CustomTextField({
    super.key,
    this.onPressed,
    this.border,
    this.expands,
    this.enableBorderColor,
    this.onsuffixIconPressed,
    this.onprefixIconPressed,
    this.formatter,
    this.borderWidth = 1.5,
    this.borderRadius,
    this.fillColor,
    this.controller,
    this.hintText = '',
    this.title = '',
    this.subTitle = '',
    this.isPassword = false,
    this.minLines = 1,
    this.maxLines = 2,
    this.isEmail = false,
    this.keyboardType = TextInputType.text,
    this.suffixIcon,
    this.prefixIcon,
    this.maxLength,
    this.obscureText = false,
    this.error,
    this.titleHintText = '',
    this.readOnly = false,
    this.onChanged,
    this.focusNode,
    this.textAlign = TextAlign.start,
    this.padding,
    this.validator,
    this.initialValue,
    this.autoFocus,
    thisinputFormatters,
    this.cursorColor,
    this.textCapitalization = TextCapitalization.none,
  });

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    return ThemeWrapper(
      builder: (context, colors, fonts, icons, _) {
        return Padding(
          padding: widget.padding ?? EdgeInsets.zero,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              widget.title.isNotEmpty
                  ? Text(
                    semanticsLabel: widget.title,
                    widget.title,
                    style: fonts.xSmallMain.copyWith(
                      color:
                          widget.error == null
                              ? colors.primary900
                              : colors.error500,
                      fontSize: 13.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  )
                  : const SizedBox(),
              widget.title.isNotEmpty
                  ? SizedBox(height: 4.h)
                  : const SizedBox(),
              widget.titleHintText.isNotEmpty
                  ? Text(
                    semanticsLabel: widget.titleHintText,
                    widget.titleHintText,
                    style: fonts.xSmallText.copyWith(color: colors.neutral900),
                  )
                  : const SizedBox(),
              widget.titleHintText.isNotEmpty
                  ? SizedBox(height: 6.h)
                  : const SizedBox(),
              TextFormField(
                onTapOutside: (v) {
                  widget.focusNode?.unfocus();
                },
                onTapUpOutside: (v) {
                  widget.focusNode?.unfocus();
                },
                textCapitalization: widget.textCapitalization,
                autofocus: widget.autoFocus ?? false,
                initialValue: widget.initialValue,
                expands: widget.expands ?? false,
                onTap: widget.onPressed,
                textInputAction: TextInputAction.done,
                focusNode: widget.focusNode,
                maxLength: widget.maxLength,
                onChanged: widget.onChanged,
                readOnly: widget.readOnly,
                textAlign: widget.textAlign,
                inputFormatters: widget.formatter,
                minLines: widget.minLines,
                maxLines: widget.maxLines,
                cursorColor: widget.cursorColor,
                controller: widget.controller,
                style: fonts.regularText.copyWith(
                  color: colors.primary900,
                  fontSize: 17.sp,
                ),
                obscureText: widget.obscureText,
                keyboardType: widget.keyboardType,
                validator: widget.validator,
                decoration: InputDecoration(
                  counterText: widget.maxLength == 500 ? null : '',
                  suffixIcon:
                      widget.suffixIcon != null
                          ? IconButton(
                            icon: widget.suffixIcon!,
                            onPressed: widget.onsuffixIconPressed ?? () {},
                          )
                          : null,
                  prefixIcon:
                      widget.prefixIcon != null
                          ? IconButton(
                            icon: widget.prefixIcon!,
                            onPressed: widget.onprefixIconPressed ?? () {},
                          )
                          : null,
                  focusColor: colors.primary500,
                  fillColor: widget.fillColor ?? colors.transparent,
                  // hoverColor: colors.shade0,
                  filled: true,
                  border:
                      widget.border ??
                      OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12.r),
                        borderSide: const BorderSide(
                          color: Color(0xDDDDDDDD),
                          width: 1,
                        ),
                      ),
                  enabledBorder:
                      widget.border ??
                      OutlineInputBorder(
                        borderRadius: BorderRadius.circular(
                          widget.borderRadius ?? 12.r,
                        ),
                        borderSide: BorderSide(
                          color:
                              widget.enableBorderColor ??
                              const Color(0xDDDDDDDD),
                          width: widget.borderWidth ?? 1,
                        ),
                      ),
                  focusedBorder:
                      widget.border ??
                      OutlineInputBorder(
                        borderRadius: BorderRadius.circular(
                          widget.borderRadius ?? 12.r,
                        ),
                        borderSide: BorderSide(
                          color: const Color(0xFFDDDDDD),
                          width: widget.borderWidth ?? 1,
                        ),
                      ),
                  hintText: widget.hintText,
                  semanticCounterText: widget.hintText,
                  hintStyle: fonts.regularText.copyWith(
                    color: const Color(0xFFAFAFAF),
                    fontSize: 17.sp,
                  ),
                  errorText: widget.error,
                  errorStyle: fonts.headlineMain.copyWith(
                    color: colors.error500,
                  ),
                  contentPadding: EdgeInsets.only(
                    left: 16.w,
                    top: 12.h,
                    right: 12.w,
                    bottom: 12.h,
                  ),
                ),
              ),
              widget.subTitle.isNotEmpty
                  ? SizedBox(height: 6.h)
                  : const SizedBox(),
              widget.subTitle.isNotEmpty
                  ? Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        semanticsLabel: widget.subTitle,
                        widget.subTitle,
                        maxLines: 2,
                        style: fonts.smallText.copyWith(
                          color:
                              widget.error == null
                                  ? colors.neutral700
                                  : colors.error500,
                          fontSize: 12.sp,
                        ),
                      ),
                    ],
                  )
                  : const SizedBox(),
            ],
          ),
        );
      },
    );
  }
}

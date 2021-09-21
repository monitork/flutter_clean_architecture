import 'package:flutter/material.dart';
import 'package:flutter_architecture/core/values/dimens.dart' as dimens;
import 'package:flutter_architecture/core/values/colors.dart';

class TextWidget extends StatelessWidget {
  final String? text;
  final bool title;
  final bool bold;
  final bool big;
  final bool small;
  final bool smaller;
  final bool center;
  final bool white;
  final bool dark;
  final bool accent;
  final bool primary;
  final Color? color;
  final int maxLines;
  final bool underline;
  final TextAlign? align;

  const TextWidget(
      {Key? key,
      this.align,
      this.smaller = false,
      this.underline = false,
      this.text,
      this.title = false,
      this.bold = false,
      this.big = false,
      this.small = false,
      this.center = false,
      this.white = false,
      this.dark = false,
      this.accent = false,
      this.primary = false,
      this.color,
      this.maxLines = 1})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final dynamic isBold = bold == true ? FontWeight.bold : FontWeight.normal;

    final String textValue = text ?? "";

    final double fontSize = title == true
        ? dimens.fontTextTitle
        : big == true
            ? dimens.fontTextBig
            : small == true
                ? dimens.fontTextSmall
                : smaller == true
                    ? dimens.fontTextSmaller
                    : dimens.fontText;

    final Color customColor = primary == true
        ? AppColors.primaryColor
        : white == true
            ? Colors.white
            : accent == true
                ? AppColors.accentLightColor
                : AppColors.primaryColorDark;

    return Text(textValue,
        maxLines: maxLines,
        textAlign: center == true
            ? TextAlign.center
            : (align == null)
                ? null
                : align,
        style: TextStyle(
            decoration: underline == true
                ? TextDecoration.underline
                : TextDecoration.none,
            fontSize: fontSize,
            color: (color == null)
                ? dark
                    ? AppColors.backgroundColor
                    : customColor
                : color,
            fontWeight: isBold));
  }
}

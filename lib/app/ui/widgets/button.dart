import 'package:flutter/material.dart';
import 'package:flutter_architecture/app/ui/widgets/text.dart';
import 'package:flutter_architecture/core/values/colors.dart';

class ButtonWidget extends StatelessWidget {
  final String label;
  final Function()? onPress;
  final bool disabled;
  final bool transparent;
  final IconData? icon;
  final bool facebook;

  final double _elevation = 3;

  const ButtonWidget(
      {Key? key,
      required this.label,
      this.onPress,
      this.disabled = false,
      this.transparent = false,
      this.icon,
      this.facebook = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final action = disabled == true ? null : onPress;

    Color backgroundColor = AppColors.accentColor;
    Color borderColor = AppColors.accentColor;
    Color textColor = Colors.white;

    if (transparent == true) {
      backgroundColor = AppColors.backgroundColor;
      borderColor = AppColors.accentLightColor;
      textColor = AppColors.accentLightColor;
    } else {
      backgroundColor = AppColors.accentLightColor;
      borderColor = AppColors.accentLightColor;
      textColor = Colors.white;
    }

    if (facebook == true) {
      backgroundColor = AppColors.facebookColor;
      borderColor = AppColors.facebookColor;
      textColor = Colors.white;
    }

    return Padding(
      padding: const EdgeInsets.only(top: 16.0),
      child: RaisedButton(
          padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 45.0),
          shape: RoundedRectangleBorder(
              side: BorderSide(color: borderColor),
              borderRadius: BorderRadius.circular(20)),
          onPressed: action,
          elevation: _elevation,
          color: backgroundColor,
          child: TextWidget(
              text: label.toUpperCase(),
              small: true,
              color: textColor)),
    );
  }
}

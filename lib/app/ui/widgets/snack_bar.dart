import 'package:flutter/material.dart';
import 'package:flutter_architecture/app/services/navigation_service.dart';
import 'package:flutter_architecture/core/di/injector_provider.dart';
import 'package:flutter_architecture/core/values/colors.dart';
import './text.dart';

class SnackBarWidget {
  SnackBarWidget(
      {bool? error,
      required String message,
      VoidCallback? action,
      String? actionMessage}) {
    final snackBar = SnackBar(
      action: action == null
          ? null
          : SnackBarAction(
              label: actionMessage ?? "OK",
              onPressed: action,
              textColor: Colors.white54,
            ),
      backgroundColor:
          error == true ? Colors.redAccent : AppColors.snackBarBackgroundColor,
      content: TextWidget(
        white: true,
        bold: true,
        small: true,
        text: message,
      ),
    );

    inject<NavigationService>()
        .rootScaffoldMessengerKey
        .currentState!
        .showSnackBar(snackBar);
  }
}

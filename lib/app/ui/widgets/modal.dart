import 'package:flutter/material.dart';
import 'package:flutter_architecture/app/services/navigation_service.dart';
import 'package:flutter_architecture/core/di/injector_app.dart';
import 'text.dart';

class ModalWidget {
  static Future? show(
      {IconData? icon,
      String? title,
      Widget? body,
      String? confirmLabel,
      Function? confirmOnPress,
      String? cancelLabel,
      Function? cancelOnPress}) {
    final context = inject<NavigationService>().navigationKey.currentContext;
    if (context != null) {
      throw (StateError('Check your connect key.'));
    }
    return showDialog(
        context: context!,
        barrierDismissible: true,
        builder: (context) => AlertDialog(
              title: icon == null
                  ? title == null
                      ? null
                      : TextWidget(text: title)
                  : Row(children: <Widget>[
                      Icon(icon),
                      const SizedBox(width: 8.0),
                      TextWidget(text: title ?? "")
                    ]),
              content: body != null ? SingleChildScrollView(child: body) : null,
              actions: <Widget>[
                //CANCEL BUTTON
                if (cancelLabel != null)
                  FlatButton(
                      child: TextWidget(
                          text: cancelLabel ?? "Button Label",
                          color: Colors.grey),
                      onPressed: () {
                        if (cancelOnPress != null) cancelOnPress();
                        Navigator.pop(context);
                      }),

                //CONFIRM BUTTONS
                if (confirmLabel != null && cancelLabel == null)
                  FlatButton(
                      child: TextWidget(
                          text: confirmLabel ?? "Button Label", accent: true),
                      onPressed: () {
                        if (confirmOnPress != null) confirmOnPress();
                        Navigator.pop(context);
                      }),

                if (cancelLabel != null)
                  FlatButton(
                    child: TextWidget(
                        text: confirmLabel ?? "Button Label", accent: true),
                    onPressed: () {
                      if (confirmOnPress != null) confirmOnPress();
                      Navigator.pop(context);
                    },
                  )
              ],
            ));
  }
}

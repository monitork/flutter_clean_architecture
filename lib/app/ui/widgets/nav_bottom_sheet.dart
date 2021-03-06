import 'package:flutter/material.dart';
import 'package:flutter_architecture/core/values/colors.dart';

import 'card_view.dart';
import 'text.dart';

class NavBottomSheetWidget extends StatelessWidget {
  final String buttonLeft;
  final String buttonRight;
  final Function actionButtonLeft;
  final Widget pageToCall;

  const NavBottomSheetWidget(
      {Key? key,
      required this.buttonLeft,
      required this.buttonRight,
      required this.actionButtonLeft,
      required this.pageToCall})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: CardViewWidget(
          width: double.infinity,
          height: 63,
          child: ListTile(
            leading: Padding(
              padding: const EdgeInsets.only(top: 16),
              child: GestureDetector(
                onTap: () => actionButtonLeft(context),
                child: TextWidget(
                  text: buttonLeft,
                ),
              ),
            ),
            trailing: Padding(
              padding: const EdgeInsets.only(top: 16.0),
              child: FlatButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => pageToCall));
                  },
                  child:
                      TextWidget(color: AppColors.accentColor, text: buttonRight)),
            ),
          )),
    );
  }
}

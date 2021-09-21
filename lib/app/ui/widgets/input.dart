import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_architecture/core/values/colors.dart';
import 'package:flutter_architecture/core/values/dimens.dart' as dimens;

class InputWidget extends StatefulWidget {
  final bool autofocus;
  final String? value;
  final Function(dynamic)? onChange;
  final String? placeholder;
  final TextInputType? keyboardType;
  final bool? password;
  final bool? dark;
  final bool? multiline;
  final String? errorMessage;
  final String? labelText;
  final String? mask;
  final TextCapitalization capitalization;

  const InputWidget(
      {Key? key,
      this.autofocus = false,
      this.value,
      this.errorMessage,
      this.onChange,
      this.placeholder,
      this.keyboardType,
      this.password,
      this.dark,
      this.multiline,
      this.labelText,
      this.mask,
      this.capitalization = TextCapitalization.none})
      : super(key: key);

  @override
  _InputWidgetState createState() => _InputWidgetState();
}

class _InputWidgetState extends State<InputWidget> {
  late TextEditingController _controller;

  @override
  void didChangeDependencies() {
    _controller = TextEditingController();

    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    // _controller.text = widget.value ?? '';
    //fix the invertion of text editing
    // if (widget.value != null) {
    //   _controller.selection =
    //       TextSelection.collapsed(offset: widget.value!.length);
    // }

    return Padding(
      padding: const EdgeInsets.only(top: dimens.fieldSpace),
      child: TextField(
          controller: _controller,
          obscureText: widget.password == true ? true : false,
          onChanged: (value) {
            if (widget.onChange != null) widget.onChange!(value);
          },
          textCapitalization: widget.capitalization,
          maxLines: widget.multiline == true ? null : 1,
          keyboardType: widget.multiline == true
              ? TextInputType.multiline
              : widget.keyboardType,
          style: TextStyle(
              color: widget.dark == false
                  ? AppColors.primaryColor
                  : AppColors.primaryColorDark //cor do texto ao digitar,
              ),
          autofocus: widget.autofocus ? false : true,
          decoration: InputDecoration(
              contentPadding: const EdgeInsets.only(bottom: 4),
              hintText: widget.value ?? "Holder",
              labelText: widget.labelText ?? widget.placeholder,
              //errorText: widget.errorText,
              errorText: widget.errorMessage,
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                    color: widget.dark == false
                        ? Colors.white
                        : AppColors.primaryColor, //cor da borda
                    width: 0.5),
              ),
              hintStyle: const TextStyle(
                  color: Colors.transparent, //cor do placeholder com foco
                  fontSize: dimens.fontInputWidget),
              enabled: true,
              labelStyle: TextStyle(
                  fontSize: dimens.fontInputWidget,
                  color: widget.dark == false
                      ? AppColors.accentColor
                      : AppColors.primaryColor //cor da label
                  ),
              border: UnderlineInputBorder(
                  borderSide: BorderSide(
                color: AppColors.accentColor,
                //cor da label quando esta com focus
                width: 0,
              )),
              focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                      color: widget.dark == false
                          ? AppColors.primaryColor
                          : AppColors.accentColor, //cor da label quando esta com focus
                      width: 1)))),
    );
  }
}

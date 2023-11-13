import 'package:flutter/material.dart';
import 'package:yaki_ui/yaki_ui.dart';

enum InputTextType { email, password }

class InputText extends StatefulWidget {
  const InputText({
    super.key,
    required this.type,
    required this.label,
    required this.controller,
    this.validator,
    this.onChange,
    this.readOnly =
        true, //By default, the value can be modified. Add the possibility of setting enabled false. This means you can't change the value.
  });

  final InputTextType type;
  final String label;
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final void Function(String)? onChange;
  final bool readOnly;

  @override
  State<InputText> createState() => _InputTextState();
}

class _InputTextState extends State<InputText> {
  bool passwordInvisible = true;
  FocusNode focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    focusNode.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(
        top: 10,
        bottom: 10,
        left: 20,
        right: 20,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(
          20,
        ),
      ),
      child: TextFormField(
        validator: widget.validator,
        onChanged: widget.onChange,
        readOnly: widget.readOnly,
        focusNode: focusNode,
        controller: widget.controller,
        obscureText:
            (widget.type == InputTextType.password) ? passwordInvisible : false,
        obscuringCharacter: '●',
        keyboardType: _getKeyboardByType(widget.type),
        decoration: InputDecoration(
          fillColor: Colors.white,
          filled: true,
          suffixIcon: (widget.type == InputTextType.password)
              ? IconButton(
                  icon: Icon((passwordInvisible)
                      ? Icons.visibility_outlined
                      : Icons.visibility_off_outlined),
                  onPressed: () {
                    setState(
                      () {
                        passwordInvisible = !passwordInvisible;
                      },
                    );
                  },
                )
              : null,
          suffixIconColor: Colors.black,
          border: const OutlineInputBorder(
            borderSide: BorderSide.none,
          ),
          labelText: widget.label,
          labelStyle: TextStyle(
            color:
                (focusNode.hasFocus) ? kTextColor.withOpacity(0.5) : kTextColor,
            fontSize: 16,
            fontWeight: FontWeight.w600,
            fontFamily: 'SF Pro Rounded',
          ),
        ),
        style: const TextStyle(
          color: kTextColor,
          fontSize: 18,
          fontWeight: FontWeight.w600,
          fontFamily: 'SF Pro Rounded',
        ),
      ),
    );
  }

  TextInputType? _getKeyboardByType(InputTextType type) {
    switch (type) {
      case InputTextType.email:
        return TextInputType.emailAddress;
      case InputTextType.password:
        return TextInputType.text;
      default:
        return null;
    }
  }
}

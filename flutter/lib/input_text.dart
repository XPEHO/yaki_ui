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
  });

  final InputTextType type;
  final String label;
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final void Function(String)? onChange;

  @override
  State<InputText> createState() => _InputTextState();
}

class _InputTextState extends State<InputText> {
  bool passwordVisible = false;
  FocusNode focusNode = FocusNode();

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
        focusNode: focusNode,
        controller: widget.controller,
        obscureText: passwordVisible,
        obscuringCharacter: '●',
        keyboardType: _getKeyboardByType(widget.type),
        decoration: InputDecoration(
          fillColor: Colors.white,
          filled: true,
          suffixIcon: (widget.type == InputTextType.password)
              ? IconButton(
                  icon: Icon((passwordVisible)
                      ? Icons.visibility_off_outlined
                      : Icons.visibility_outlined),
                  onPressed: () {
                    setState(
                      () {
                        passwordVisible = !passwordVisible;
                      },
                    );
                  },
                )
              : null,
          suffixIconColor: Colors.black,
          border: const OutlineInputBorder(
            borderSide: BorderSide.none,
          ),
          hintText: (focusNode.hasFocus) ? widget.label : null,
          labelText: widget.label,
          labelStyle: const TextStyle(
            color: kTextColor,
            fontSize: 16,
            fontWeight: FontWeight.w600,
            fontFamily: 'SF Pro Rounded',
          ),
        ),
        style: const TextStyle(
          color: kTextColor,
          fontSize: 16,
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

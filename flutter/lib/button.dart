import 'package:flutter/material.dart';
import 'package:yaki_ui/yaki_ui.dart';

class Button extends StatefulWidget {
  const Button({
    super.key,
    required this.text,
    this.onPressed,
    this.color = kPrimaryColor,
  });

  factory Button.secondary({
    Key? key,
    required String text,
    VoidCallback? onPressed,
  }) {
    return Button(
      key: key,
      text: text,
      onPressed: onPressed,
      color: kSecondaryColor,
    );
  }

  final Color color;
  final String text;
  final VoidCallback? onPressed;

  @override
  State<Button> createState() => _ButtonState();
}

class _ButtonState extends State<Button> {
  bool _pressed = false;

  @override
  void initState() {
    super.initState();
    _pressed = false;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: _onButtonDown,
      onTapUp: _onButtonUp,
      onTap: _onButtonPressed,
      child: Container(
        padding: _pressed
            ? const EdgeInsets.only(top: 4)
            : const EdgeInsets.only(bottom: 4),
        child: Container(
          height: 72,
          width: double.infinity,
          padding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 12,
          ),
          decoration: BoxDecoration(
            color: (widget.onPressed != null) ? widget.color : Colors.grey,
            borderRadius: BorderRadius.circular(16),
            border: Border(
              top: BorderSide(
                color: Colors.black.withOpacity(0.15),
                width: 2,
              ),
              bottom: BorderSide(
                color: Colors.black.withOpacity(0.15),
                width: _pressed ? 2 : 8,
              ),
              left: BorderSide(
                color: Colors.black.withOpacity(0.15),
                width: 2,
              ),
              right: BorderSide(
                color: Colors.black.withOpacity(0.15),
                width: 2,
              ),
            ),
          ),
          child: Center(
            child: Text(
              widget.text,
              style: const TextStyle(
                color: kTextColor,
                fontSize: 15,
                fontWeight: FontWeight.w600,
                fontFamily: 'SF Pro Rounded',
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _onButtonDown(TapDownDetails details) {
    if (widget.onPressed != null) {
      setState(() {
        _pressed = true;
      });
    }
  }

  void _onButtonUp(TapUpDetails details) {
    if (widget.onPressed != null) {
      setState(() {
        _pressed = false;
      });
    }
  }

  void _onButtonPressed() {
    if (widget.onPressed != null) {
      widget.onPressed!();
    }
  }
}

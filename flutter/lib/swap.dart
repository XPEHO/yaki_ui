import 'package:flutter/cupertino.dart';
import 'package:yaki_ui/yaki_ui.dart';

typedef OnSwapChangeFunction = void Function(bool value);

class Swap extends StatefulWidget {
  final Color thumbColor;
  final Color backgroundColor;
  final bool setActivated;
  final OnSwapChangeFunction? onSwapChange;
  final double? buttonHeight;
  final double? buttonWidth;

  const Swap({
    super.key,
    this.setActivated = false,
    this.thumbColor = kSecondaryColor,
    this.backgroundColor = kPrimaryColor,
    this.onSwapChange,
    this.buttonHeight,
    this.buttonWidth,
  });

  @override
  State<Swap> createState() => _SwapState();
}

class _SwapState extends State<Swap> {
  late bool _activated;

  @override
  void initState() {
    super.initState();
    _activated = widget.setActivated;
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoSwitch(
      value: _activated,
      onChanged: _onSwapChange,
      thumbColor: widget.thumbColor,
      activeColor: widget.backgroundColor,
      trackColor: kBorderIconChip,
    );
  }

  void _onSwapChange(bool value) {
    setState(() {
      _activated = value;
    });
    if (widget.onSwapChange != null) {
      widget.onSwapChange!(value);
    }
  }
}

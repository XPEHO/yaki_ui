import 'package:flutter/material.dart';
import 'package:yaki_ui/toggle_button_element.dart';

typedef OnToggleButtonSelect = void Function(String selectedOption);

class ToggleButton extends StatefulWidget {
  final List<bool> isSelected;
  final List<String> labels;
  final OnToggleButtonSelect onToggleButtonSelect;

  const ToggleButton({
    super.key,
    required this.isSelected,
    required this.labels,
    required this.onToggleButtonSelect,
  });

  @override
  State<ToggleButton> createState() => _ToggleButtonState();
}

class _ToggleButtonState extends State<ToggleButton> {
  List<bool> _isSelected = [];

  @override
  void initState() {
    super.initState();
    // create shallow copy for mutation
    _isSelected = List.from(widget.isSelected);
  }

  void _onElementTap(String label) {
    setState(() {
      int index = widget.labels.indexOf(label);
      for (int i = 0; i < _isSelected.length; i++) {
        _isSelected[i] = i == index ? true : false;
      }
    });

    widget.onToggleButtonSelect(label);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: ToggleButtonStyles.containerHeight,
      decoration: ToggleButtonStyles.mainContainerStyle,
      child: Row(children: [
        ToggleButtonElement(
          isSelected: _isSelected.first,
          label: widget.labels.first,
          onTap: _onElementTap,
        ),
        ToggleButtonElement(
          isSelected: _isSelected.last,
          label: widget.labels.last,
          onTap: _onElementTap,
        )
      ]),
    );
  }
}

class ToggleButtonStyles {
  static const double containerHeight = 40;
  static const Color backgroundColor = Color.fromARGB(229, 234, 239, 255);

  static BoxDecoration mainContainerStyle = const BoxDecoration(
    color: backgroundColor,
    borderRadius: BorderRadius.all(
      Radius.circular(6),
    ),
  );
}

import 'package:flutter/material.dart';
import 'package:yaki_ui/colors.dart';

typedef OnButtonTap = void Function(String label);

class ToggleButtonElement extends StatelessWidget {
  final bool isSelected;
  final String label;
  final OnButtonTap onTap;

  const ToggleButtonElement({
    super.key,
    required this.isSelected,
    required this.label,
    required this.onTap,
  });

  static const double containerHeight = 35;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: () => onTap(label),
        child: Stack(
          children: [
            if (isSelected)
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: Container(
                    height: containerHeight,
                    decoration:
                        ToggleButtonElementStyles.elementBoxDecorationStyle,
                  ),
                ),
              ),
            Center(
              child: Text(
                label.toUpperCase(),
                style: toggleButtonLabelStyle(isSelected),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

TextStyle toggleButtonLabelStyle(bool isSelected) {
  return TextStyle(
    color:
        isSelected ? kTextColor : ToggleButtonElementStyles.unSelectedTextColor,
    fontSize: 13,
    fontWeight: FontWeight.bold,
    fontFamily: 'SF Pro Rounded',
  );
}

class ToggleButtonElementStyles {
  static const Color unSelectedTextColor = Color.fromARGB(255, 116, 116, 118);
  static const Color primaryColorDarker = Color.fromARGB(255, 214, 111, 74);

  static BoxDecoration elementBoxDecorationStyle = BoxDecoration(
    color: kPrimaryColor,
    borderRadius: const BorderRadius.all(
      Radius.circular(6),
    ),
    border: Border.all(
      color: primaryColorDarker,
      width: 2.0,
    ),
  );
}

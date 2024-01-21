import 'package:flutter/material.dart';
import 'package:yaki_ui/colors.dart';

class DatePickerHeader extends StatelessWidget {
  final String title;

  /// displayed text on the button
  final String displayedButtonLabel;

  /// use to determine bouton style by comparing buttonText with this attribute
  final String initialButtonText;
  final VoidCallback onButtonPress;

  const DatePickerHeader({
    super.key,
    required this.title,
    required this.displayedButtonLabel,
    required this.initialButtonText,
    required this.onButtonPress,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: DatePickerHeaderStyles.inlinePadding,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            title,
            style: DatePickerHeaderStyles.textStyleIndicator,
          ),
          Padding(
            padding: DatePickerHeaderStyles.blockPadding,
            child: SizedBox(
              height: 40,
              child: ElevatedButton(
                style: elevatedButtonStyle(
                  displayedButtonLabel,
                  initialButtonText,
                ),
                onPressed: onButtonPress,
                child: Text(
                  displayedButtonLabel,
                  style: DatePickerHeaderStyles.textStyleElevatedButton,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

/// change the color of the button and foreground color depending on the button text value
ButtonStyle elevatedButtonStyle(
  String displayedButtonLabel,
  String initialButtonLabel,
) {
  bool isDefaultValue =
      displayedButtonLabel == initialButtonLabel ? true : false;

  return ElevatedButton.styleFrom(
    backgroundColor: isDefaultValue ? kPrimaryColor : kBackgroundColor,
    foregroundColor: isDefaultValue
        ? const Color.fromARGB(255, 238, 119, 76)
        : const Color.fromARGB(255, 200, 203, 206),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(8),
    ),
    elevation: 0,
  );
}

// static const widget styles
class DatePickerHeaderStyles {
  static const EdgeInsets inlinePadding = EdgeInsets.only(
    left: 24,
    right: 16,
  );

  static const TextStyle textStyleIndicator = TextStyle(
    color: Colors.black,
    fontSize: 16,
    fontWeight: FontWeight.w100,
    fontFamily: 'SF Pro Rounded',
  );

  static const EdgeInsets blockPadding = EdgeInsets.symmetric(
    vertical: 12,
  );

  static const TextStyle textStyleElevatedButton = TextStyle(
    color: kTextColor,
    fontSize: 16,
    fontWeight: FontWeight.w900,
    fontFamily: 'SF Pro Rounded',
  );
}

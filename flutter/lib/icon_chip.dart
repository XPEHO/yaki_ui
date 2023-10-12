import 'package:flutter/material.dart';
import 'package:yaki_ui/yaki_ui.dart';

class IconChip extends StatelessWidget {
  final Widget image;
  final String label;
  final Color backgroundColor;
  final double? fontSizeLabel;
  final FontWeight? fontWeightLabel;
  final double? borderWidth;

  const IconChip({
    super.key,
    required this.image,
    required this.label,
    required this.backgroundColor,
    this.fontSizeLabel,
    this.fontWeightLabel,
    this.borderWidth,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(
        left: 8,
        right: 8,
        top: 4,
        bottom: 4,
      ),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(
          20,
        ),
        border: Border.all(
          color: kBorderIconChip,
          width: borderWidth ?? 0,
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          image,
          const SizedBox(
            width: 8,
          ),
          Text(
            label,
            style: TextStyle(
              color: kTextColor,
              fontWeight: fontWeightLabel ?? FontWeight.w600,
              fontFamily: 'SF Pro Rounded',
              fontSize: fontSizeLabel ?? 14,
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:yaki_ui/yaki_ui.dart';

class IconChip extends StatelessWidget {
  final Widget image;
  final String label;
  final Color backgroundColor;

  const IconChip({
    super.key,
    required this.image,
    required this.label,
    required this.backgroundColor,
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
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          image,
          const SizedBox(
            width: 4,
          ),
          Text(
            label,
            style: const TextStyle(
              color: kTextColor,
              fontWeight: FontWeight.w600,
              fontFamily: 'SF Pro Rounded',
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }
}

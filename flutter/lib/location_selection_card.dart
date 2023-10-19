import 'package:flutter/material.dart';
import 'package:yaki_ui/colors.dart';

typedef OnLocationSelectionChanged = void Function(bool selected);

class LocationSelectionCard extends StatefulWidget {
  const LocationSelectionCard({
    super.key,
    required this.picture,
    required this.title,
    required this.subtitle,
    required this.onSelectionChanged,
    this.defaultPressed = false,
    this.defaultSelected = false,
  });

  final Widget picture;
  final String title;
  final String subtitle;
  final OnLocationSelectionChanged onSelectionChanged;
  final bool defaultPressed;
  final bool defaultSelected;

  @override
  State<LocationSelectionCard> createState() => _LocationSelectionCardState();
}

class _LocationSelectionCardState extends State<LocationSelectionCard> {
  bool pressed = false;
  bool selected = false;

  @override
  void initState() {
    super.initState();
    pressed = widget.defaultPressed;
    selected = widget.defaultSelected;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: _tapDown,
      onTapUp: _tapUp,
      child: Container(
        padding: EdgeInsets.only(
          left: 2,
          right: 2,
          top: 2,
          bottom: pressed ? 2 : 4,
        ),
        decoration: BoxDecoration(
          color: selected ? kPrimaryColor : Colors.grey[200],
          borderRadius: BorderRadius.circular(16),
        ),
        child: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Stack(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(16),
                      child: widget.picture,
                    ),
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  Text(
                    widget.title,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: Color(0xFF37414C),
                      fontSize: 13,
                      fontWeight: FontWeight.w400,
                      fontFamily: 'SF Pro Rounded',
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    widget.subtitle,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: kTextColor,
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      fontFamily: 'SF Pro Rounded',
                    ),
                  ),
                  const SizedBox(
                    height: 35,
                  ),
                ],
              ),
              if (selected)
                const Positioned(
                  top: 0,
                  right: 0,
                  child: Icon(
                    Icons.check_circle,
                    color: kPrimaryColor,
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }

  void _tapDown(TapDownDetails details) {
    setState(() {
      pressed = true;
    });
  }

  void _tapUp(TapUpDetails details) {
    setState(() {
      pressed = false;
      selected = !selected;
      widget.onSelectionChanged(selected);
    });
  }
}

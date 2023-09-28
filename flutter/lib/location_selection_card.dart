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
  });

  final Widget picture;
  final String title;
  final String subtitle;
  final OnLocationSelectionChanged onSelectionChanged;

  @override
  State<LocationSelectionCard> createState() => _LocationSelectionCardState();
}

class _LocationSelectionCardState extends State<LocationSelectionCard> {
  bool pressed = false;
  bool selected = false;

  @override
  void initState() {
    super.initState();
    pressed = false;
    selected = false;
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
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Align(
                alignment: Alignment.centerRight,
                widthFactor: 1.0,
                child: Icon(
                  Icons.check_circle,
                  color: (selected) ? kPrimaryColor : Colors.transparent,
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: widget.picture,
              ),
              const SizedBox(
                width: 24,
              ),
              Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    widget.title,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: kTextColor,
                      fontSize: 14,
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
                ],
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
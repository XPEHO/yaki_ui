import 'package:flutter/material.dart';
import 'package:yaki_ui/colors.dart';

typedef OnTeamSelectionChanged = void Function(bool selected);

class TeamSelectionCard extends StatefulWidget {
  const TeamSelectionCard({
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
  final OnTeamSelectionChanged onSelectionChanged;
  final bool defaultPressed;
  final bool defaultSelected;

  @override
  State<TeamSelectionCard> createState() => _TeamSelectionCardState();
}

class _TeamSelectionCardState extends State<TeamSelectionCard> {
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
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: widget.picture,
              ),
              const SizedBox(
                width: 24,
              ),
              Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.title,
                    style: const TextStyle(
                      color: kTextColor,
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      fontFamily: 'SF Pro Rounded',
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    widget.subtitle,
                    style: const TextStyle(
                      color: kTextColor,
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      fontFamily: 'SF Pro Rounded',
                    ),
                  ),

                  //Image.asset('assets/icons/validated.png')
                ],
              ),
              const Spacer(),
              if (selected)
                const Icon(
                  Icons.check_circle,
                  color: kPrimaryColor,
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

import 'package:flutter/material.dart';
import 'package:yaki_ui/yaki_ui.dart';

class Cell extends StatefulWidget {
  const Cell({
    super.key,
    required this.title,
    required this.subtitle,
    required this.image,
    this.chips,
    this.child,
  });

  final String title;
  final String subtitle;
  final Widget image;
  final Widget? chips;
  final Widget? child;

  @override
  State<Cell> createState() => _CellState();
}

class _CellState extends State<Cell> with TickerProviderStateMixin {
  bool isOpen = false;
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        setState(() {
          isOpen = !isOpen;
          if (isOpen) {
            _animationController.forward();
          } else {
            _animationController.reverse();
          }
        });
      },
      // Animated Container
      child: AnimatedContainer(
        duration:
            _animationController.duration ?? const Duration(milliseconds: 300),
        width: 400,
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(
            20,
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.max,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.title,
                        style: const TextStyle(
                          color: kTextColor,
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          fontFamily: 'SF Pro Rounded',
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            widget.subtitle,
                            style: const TextStyle(
                              color: kSubtitleTextColor,
                              fontSize: 11,
                              fontWeight: FontWeight.w600,
                              fontFamily: 'SF Pro Rounded',
                            ),
                          ),
                          if (widget.chips != null)
                            const SizedBox(
                              width: 10,
                            ),
                          if (widget.chips != null)
                            AnimatedOpacity(
                              opacity: (isOpen) ? 0.0 : 1.0,
                              duration: _animationController.duration ??
                                  const Duration(milliseconds: 300),
                              child: widget.chips!,
                            )
                        ],
                      )
                    ],
                  ),
                ),
                widget.image,
              ],
            ),
            SizeTransition(
              sizeFactor: CurvedAnimation(
                parent: _animationController,
                curve: Curves.easeInOut,
              ),
              axis: Axis.vertical,
              child: Container(
                margin: const EdgeInsets.only(
                  top: 20,
                ),
                child: widget.child,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

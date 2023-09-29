import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;
import 'package:yaki_ui/yaki_ui.dart';

@widgetbook.UseCase(
  name: 'Icon chip',
  type: IconChip,
)
Widget iconChip(BuildContext context) {
  return Center(
    child: IconChip(
      image: Image.asset(
        'assets/twitch_logo.png',
        width: 15,
        height: 15,
        fit: BoxFit.contain,
      ),
      label: context.knobs.string(
        label: 'Label',
        description: 'The label of the chip',
        initialValue: 'Yaki chip',
      ),
      backgroundColor: context.knobs.list<Color>(
        label: 'Background color',
        description: 'The background color of the chip',
        initialOption: Colors.white,
        options: [
          Colors.white,
          Colors.blue.shade500,
          Colors.red.shade500,
          Colors.green.shade500,
          Colors.yellow.shade500,
          Colors.purple.shade500,
        ],
      ),
    ),
  );
}

import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;
import 'package:yaki_ui/yaki_ui.dart';

@widgetbook.UseCase(
  name: 'Simple location selection Card',
  type: LocationSelectionCard,
)
Widget simpleLocationSelectionCard(BuildContext context) {
  return Center(
    child: SizedBox(
      width: 200,
      child: LocationSelectionCard(
        picture: Image.asset(
          'assets/time.png',
          width: 110,
          height: 110,
        ),
        title: context.knobs.string(
          label: 'Card title',
          description: 'The title of the card',
          initialValue: 'Yaki',
        ),
        subtitle: context.knobs.string(
          label: 'Card subtitle',
          description: 'The subtitle of the card',
          initialValue: 'Yaki subtitle',
        ),
        onSelectionChanged: (selected) {
          debugPrint('Location selection changed: $selected');
        },
      ),
    ),
  );
}

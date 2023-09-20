import 'package:flutter/material.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;
import 'package:yaki_ui/yaki_ui.dart';

@widgetbook.UseCase(
  name: 'Simple location selection Card',
  type: LocationSelectionCard,
)
Widget simpleLocationSelectionCard(BuildContext context) {
  return Center(
    child: LocationSelectionCard(
      picture: Image.network(
        'https://picsum.photos/200',
      ),
      title: 'Yaki',
      subtitle: 'Yaki is a design system',
      onSelectionChanged: (selected) {
        debugPrint('Location selection changed: $selected');
      },
    ),
  );
}

import 'package:flutter/material.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;
import 'package:yaki_ui/yaki_ui.dart';

@widgetbook.UseCase(
  name: 'Simple team selection Card',
  type: TeamSelectionCard,
)
Widget simpleTeamSelectionCard(BuildContext context) {
  return Center(
    child: TeamSelectionCard(
      picture: 'https://picsum.photos/200',
      title: 'Yaki',
      subtitle: 'Yaki is a design system',
      onSelectionChanged: (selected) {
        debugPrint('Team selection changed: $selected');
      },
    ),
  );
}

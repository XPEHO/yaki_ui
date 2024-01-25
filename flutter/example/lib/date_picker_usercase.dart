import 'package:flutter/material.dart';

import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;
import 'package:yaki_ui/yaki_ui.dart';

@widgetbook.UseCase(
  name: 'Date picker calendar',
  type: DatePickerCard,
)
Widget datePickerCard(BuildContext context) {
  return Center(
    child: DatePickerCard(
      title: "Start",
      initialButtonLabel: "Pick a date",
      earliestSelectableDate: DateTime.now(),
      onDateSelection: (selectedDateTime) {
        debugPrint('Date selected: $selectedDateTime');
      },
      toggleLabels: const ["Morning", "Noon"],
    ),
  );
}

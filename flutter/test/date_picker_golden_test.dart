import 'package:flutter/material.dart';
import 'package:golden_toolkit/golden_toolkit.dart';
import 'package:yaki_ui/yaki_ui.dart';

void main() {
  testGoldens('Date picker should look correct', (tester) async {
    final builder = GoldenBuilder.grid(
      columns: 1,
      widthToHeightRatio: 1,
      bgColor: kBackgroundColor,
    )
      ..addScenario(
          '',
          DatePickerCard(
            title: "Start",
            initialButtonLabel: "Pick a date",
            earliestSelectableDate: DateTime(DateTime.april, 1, 2021),
            onDateSelection: (selectedDateTime) {
              debugPrint('Date selected: $selectedDateTime');
            },
            toggleLabels: const ["Morning", "Noon"],
          ))
      ..addScenario(
        '',
        DatePickerCard(
          title: "Start",
          initialButtonLabel: "Pick a date",
          earliestSelectableDate: DateTime(DateTime.april, 1, 2021),
          onDateSelection: (selectedDateTime) {
            debugPrint('Date selected: $selectedDateTime');
          },
          toggleLabels: const ["Morning", "Noon"],
          isDatePickerOpen: true,
        ),
      );
    await tester.pumpWidgetBuilder(
      builder.build(),
      surfaceSize: const Size(400, 650),
    );
    await tester.pumpAndSettle();
    await screenMatchesGolden(
      tester,
      'date_picker_grid',
    );
  });
}

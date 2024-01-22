import 'package:flutter/material.dart';
import 'package:golden_toolkit/golden_toolkit.dart';
import 'package:yaki_ui/yaki_ui.dart';

void main() {
  testGoldens('Toggle button should look correct', (tester) async {
    final builder = GoldenBuilder.grid(
      columns: 1,
      widthToHeightRatio: 1,
      bgColor: Colors.white,
    )
      ..addScenario(
          '',
          ToggleButton(
              isSelected: const [true, false],
              labels: const ['Morning', 'Noon'],
              onToggleButtonSelect: (selectedOption) {
                debugPrint('Selected option: $selectedOption');
              }))
      ..addScenario(
          '',
          ToggleButton(
              isSelected: const [false, true],
              labels: const ['Morning', 'Noon'],
              onToggleButtonSelect: (selectedOption) {
                debugPrint('Selected option: $selectedOption');
              }));
    await tester.pumpWidgetBuilder(
      builder.build(),
      surfaceSize: const Size(300, 400),
    );
    await screenMatchesGolden(
      tester,
      'toggle_button_grid',
    );
  });
}

import 'package:flutter/material.dart';
import 'package:golden_toolkit/golden_toolkit.dart';
import 'package:yaki_ui/yaki_ui.dart';

void main() {
  testGoldens('Swap should look correct', (tester) async {
    final builder = GoldenBuilder.grid(
      columns: 1,
      widthToHeightRatio: 1,
      bgColor: Colors.white,
    )
      ..addScenario(
        '',
        const Swap(
          setActivated: true,
        ),
      )
      ..addScenario(
        '',
        const Swap(),
      )
      ..addScenario(
        '',
        const Swap(
          setActivated: true,
          thumbColor: Color.fromARGB(255, 255, 247, 137),
          backgroundColor: Colors.green,
        ),
      );
    await tester.pumpWidgetBuilder(
      builder.build(),
      surfaceSize: const Size(100, 300),
    );
    await screenMatchesGolden(
      tester,
      'swap_grid',
    );
  });
}

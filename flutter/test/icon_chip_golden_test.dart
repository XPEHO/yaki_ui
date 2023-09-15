import 'package:flutter/material.dart';
import 'package:golden_toolkit/golden_toolkit.dart';
import 'package:yaki_ui/icon_chip.dart';

void main() {
  testGoldens(
    'Icon chip should look correct',
    (tester) async {
      final iconChip = IconChip(
        image: ClipRRect(
          borderRadius: BorderRadius.circular(50),
          child: const Icon(Icons.abc),
        ),
        label: 'Yaki chip',
        backgroundColor: Colors.white,
      );

      final builder = GoldenBuilder.grid(columns: 1, widthToHeightRatio: 1)
        ..addScenario('Icon chip with abc flutter icon', iconChip);

      await tester.pumpWidgetBuilder(builder.build());
      await screenMatchesGolden(tester, 'icon_chip_grid');
    },
  );
}

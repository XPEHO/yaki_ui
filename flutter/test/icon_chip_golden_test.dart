import 'package:flutter/material.dart';
import 'package:golden_toolkit/golden_toolkit.dart';
import 'package:yaki_ui/icon_chip.dart';

void main() {
  testGoldens(
    'Icon chip should look correct',
    (tester) async {
      final builder = GoldenBuilder.grid(
        columns: 1,
        widthToHeightRatio: 1,
        bgColor: const Color(0xffFFFFFF),
      )
        ..addScenario(
          '',
          const IconChip(
            image: SizedBox(
              width: 32,
              height: 32,
            ),
            label: 'Ship text',
            backgroundColor: Colors.white,
            borderWidth: 2,
          ),
        )
        ..addScenario(
          '',
          const IconChip(
            image: SizedBox(
              width: 16,
              height: 16,
            ),
            label: 'Ship text',
            backgroundColor: Color(0xffF2F6F9),
            borderWidth: 0,
          ),
        );

      await tester.pumpWidgetBuilder(
        builder.build(),
        surfaceSize: const Size(130, 200),
      );
      await screenMatchesGolden(
        tester,
        'icon_chip_grid',
      );
    },
  );
}

import 'package:flutter/material.dart';
import 'package:golden_toolkit/golden_toolkit.dart';
import 'package:yaki_ui/yaki_ui.dart';

void main() {
  testGoldens('Button should look correct', (tester) async {
    final builder = GoldenBuilder.grid(
      columns: 2,
      widthToHeightRatio: 1,
      bgColor: Colors.white,
    )
      ..addScenario(
          '',
          Button(
            text: 'BUTTON',
            onPressed: () {},
          ))
      ..addScenario(
          '',
          Button(
            text: 'BUTTON',
            onPressed: () {},
            defaultPressed: true,
          ))
      ..addScenario(
          '',
          Button.secondary(
            text: 'BUTTON',
            onPressed: () {},
            defaultPressed: false,
          ))
      ..addScenario(
          '',
          Button.secondary(
            text: 'BUTTON',
            onPressed: () {},
            defaultPressed: true,
          ))
      ..addScenario(
          '',
          Button.tertiary(
            text: 'BUTTON',
            onPressed: () {},
            defaultPressed: false,
          ))
      ..addScenario(
          '',
          Button.tertiary(
            text: 'BUTTON',
            onPressed: () {},
            defaultPressed: true,
          ))
      ..addScenario(
          '',
          const Button(
            text: 'BUTTON',
            onPressed: null,
            defaultPressed: false,
          ))
      ..addScenario(
          '',
          const Button(
            text: 'BUTTON',
            onPressed: null,
            defaultPressed: true,
          ));
    await tester.pumpWidgetBuilder(
      builder.build(),
      surfaceSize: const Size(300, 600),
    );
    await screenMatchesGolden(
      tester,
      'button_grid',
    );
  });
}

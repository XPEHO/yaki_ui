import 'package:golden_toolkit/golden_toolkit.dart';
import 'package:yaki_ui/yaki_ui.dart';

void main() {
  testGoldens('Button should look correct', (tester) async {
    final builder = GoldenBuilder.grid(columns: 4, widthToHeightRatio: 1)
      ..addScenario(
          'Simple with onPressed null',
          const Button(
            text: 'Button',
            onPressed: null,
          ))
      ..addScenario(
          'Simple with onPressed not null',
          Button(
            text: 'Button',
            onPressed: () {},
          ))
      ..addScenario(
          'Secondary with onPressed null',
          Button.secondary(
            text: 'Button',
            onPressed: null,
          ))
      ..addScenario(
          'Secondary with onPressed not null',
          Button.secondary(
            text: 'Button',
            onPressed: () {},
          ))
      ..addScenario(
          'Tertiary with onPressed null',
          Button.tertiary(
            text: 'Button',
            onPressed: null,
          ))
      ..addScenario(
          'Tertiary with onPressed not null',
          Button.tertiary(
            text: 'Button',
            onPressed: () {},
          ));
    await tester.pumpWidgetBuilder(builder.build());
    await screenMatchesGolden(tester, 'button_grid');
  });
}

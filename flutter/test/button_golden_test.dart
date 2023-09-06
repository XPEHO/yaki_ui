import 'package:golden_toolkit/golden_toolkit.dart';
import 'package:yaki_ui/yaki_ui.dart';

void main() {
  testGoldens('Button should look correct', (tester) async {
    final builder = GoldenBuilder.grid(columns: 2, widthToHeightRatio: 1)
      ..addScenario('Simple', const Button(text: 'Button'))
      ..addScenario('Secondary', Button.secondary(text: 'Button'));
    await tester.pumpWidgetBuilder(builder.build());
    await screenMatchesGolden(tester, 'button_grid');
  });
}

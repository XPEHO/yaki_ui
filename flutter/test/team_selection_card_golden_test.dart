import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:golden_toolkit/golden_toolkit.dart';
import 'package:yaki_ui/yaki_ui.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  testGoldens('TeamSelectionCard should look correct', (tester) async {
    final builder = GoldenBuilder.grid(columns: 2, widthToHeightRatio: 1)
      ..addScenario(
        'Simple',
        TeamSelectionCard(
          picture: const Icon(Icons.abc),
          title: 'Yaki',
          subtitle: 'Yaki is a design system',
          onSelectionChanged: (selected) {},
        ),
      );
    await tester.pumpWidgetBuilder(builder.build());
    await screenMatchesGolden(tester, 'team_selection_card_grid');
  });
}

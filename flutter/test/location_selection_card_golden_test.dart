import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:golden_toolkit/golden_toolkit.dart';
import 'package:yaki_ui/location_selection_card.dart';

void main() {
  testGoldens('LocationSelectionCard should look correct', (tester) async {
    final widgetUnselected = LocationSelectionCard(
      key: const Key('unselected'),
      picture: const Icon(Icons.abc),
      title: 'Yaki',
      subtitle: 'Yaki is a design system',
      onSelectionChanged: (selected) {},
    );

    final widgetSelected = LocationSelectionCard(
      key: const Key('selected'),
      picture: const Icon(Icons.abc),
      title: 'Yaki',
      subtitle: 'Yaki is a design system',
      onSelectionChanged: (selected) {},
    );

    final builder = GoldenBuilder.grid(columns: 2, widthToHeightRatio: 1)
      ..addScenario('Unselected', widgetUnselected)
      ..addScenario('Selected', widgetSelected);

    await tester.pumpWidgetBuilder(builder.build());
    await tester.tap(
      find.byKey(
        widgetSelected.key!,
      ),
    );
    await screenMatchesGolden(tester, 'location_selection_card_grid');
  });
}

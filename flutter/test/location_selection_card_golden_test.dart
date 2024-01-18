import 'package:flutter/material.dart';
import 'package:golden_toolkit/golden_toolkit.dart';
import 'package:yaki_ui/location_selection_card.dart';

void main() {
  testGoldens('LocationSelectionCard should look correct', (tester) async {
    final avatar = Container(
      width: 112,
      height: 112,
      color: const Color(0xffE6ECEF),
      child: const Center(
        child: Text(
          'YA\nKI?',
          style: TextStyle(
            fontSize: 48,
            fontWeight: FontWeight.w600,
            fontFamily: 'SF Pro Rounded',
            color: Colors.white,
          ),
        ),
      ),
    );

    final builder = GoldenBuilder.grid(
      columns: 1,
      widthToHeightRatio: 1,
      bgColor: Colors.white,
    )
      ..addScenario(
          '',
          LocationSelectionCard(
            picture: avatar,
            title: 'Je suis',
            subtitle: 'Au bureau',
            onSelectionChanged: (selected) {},
          ))
      ..addScenario(
          '',
          LocationSelectionCard(
            picture: avatar,
            title: 'Je suis',
            subtitle: 'Au bureau',
            onSelectionChanged: (selected) {},
            defaultPressed: true,
          ))
      ..addScenario(
          '',
          LocationSelectionCard(
            picture: avatar,
            title: 'Je suis',
            subtitle: 'Au bureau',
            onSelectionChanged: (selected) {},
            defaultSelected: true,
          ));

    await tester.pumpWidgetBuilder(
      builder.build(),
      surfaceSize: const Size(200, 1200),
    );

    await screenMatchesGolden(tester, 'location_selection_card_grid');
  });
}

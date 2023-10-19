import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:golden_toolkit/golden_toolkit.dart';
import 'package:yaki_ui/yaki_ui.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  testGoldens('TeamSelectionCard should look correct', (tester) async {
    final avatar = Container(
      width: 80,
      height: 80,
      color: const Color(0xffE6ECEF),
      child: const Center(
        child: Text(
          'YA\nKI?',
          style: TextStyle(
            fontSize: 35,
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
      bgColor: const Color(0xffFFFFFF),
    )
      ..addScenario(
        '',
        TeamSelectionCard(
          picture: avatar,
          title: 'Projet',
          subtitle: 'XPEHO',
          onSelectionChanged: (selected) {},
        ),
      )
      ..addScenario(
        '',
        TeamSelectionCard(
          picture: avatar,
          title: 'Projet',
          subtitle: 'XPEHO',
          onSelectionChanged: (selected) {},
          defaultPressed: true,
        ),
      )
      ..addScenario(
        '',
        TeamSelectionCard(
          picture: avatar,
          title: 'Projet',
          subtitle: 'XPEHO',
          onSelectionChanged: (selected) {},
          defaultSelected: true,
        ),
      );
    await tester.pumpWidgetBuilder(
      builder.build(),
      surfaceSize: const Size(400, 500),
    );
    await screenMatchesGolden(tester, 'team_selection_card_grid');
  });
}

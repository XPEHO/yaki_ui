import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:golden_toolkit/golden_toolkit.dart';
import 'package:yaki_ui/yaki_ui.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  testGoldens(
    'Cell should look correct',
    (tester) async {
      const imageWidget = CircleAvatar(
        radius: 10,
        backgroundImage: AssetImage(
          "example/assets/twitch_logo.png",
        ),
      );

      final cellWithChild = Cell(
        title: 'Hello World',
        subtitle: 'Welcome to Yaki UI !',
        image: imageWidget,
        chips: Image.asset(
          "example/assets/twitch_logo.png",
          width: 15,
          height: 15,
        ),
        child: IconChip(
          image: Image.asset(
            "example/assets/twitch_logo.png",
            width: 15,
            height: 15,
          ),
          label: 'Hello World',
          backgroundColor: Colors.grey.shade300,
        ),
      );

      const emptyCell = Cell(
        title: 'Hello World',
        subtitle: 'Welcome to Yaki UI !',
        image: imageWidget,
        child: null,
        chips: null,
      );

      final builder = GoldenBuilder.grid(columns: 2, widthToHeightRatio: 2)
        ..addScenario('Cell with child (open)', cellWithChild)
        ..addScenario('Cell with child (not open)', cellWithChild)
        ..addScenario('Cell empty', emptyCell);

      await tester.pumpWidgetBuilder(builder.build());
      await tester.tap(find.byType(InkWell).first);
      await screenMatchesGolden(tester, 'cell_grid');
    },
  );
}

import 'package:golden_toolkit/golden_toolkit.dart';
import 'package:yaki_ui/yaki_ui.dart';

void main() {
  testGoldens('TeamSelectionCard should look correct', (tester) async {
    final builder = GoldenBuilder.grid(columns: 2, widthToHeightRatio: 1)
      ..addScenario(
        'Simple',
        TeamSelectionCard(
          picture: 'https://picsum.photos/200',
          title: 'Yaki',
          subtitle: 'Yaki is a design system',
          onSelectionChanged: (selected) {},
        ),
      );
    await tester.pumpWidgetBuilder(builder.build());
    await screenMatchesGolden(tester, 'team_selection_card_grid');
  });
}

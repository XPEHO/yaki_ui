import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:golden_toolkit/golden_toolkit.dart';
import 'package:yaki_ui/input_text.dart';

void main() {
  testGoldens(
    'Input text should look correct',
    (tester) async {
      final inputTextEmail = InputText(
        type: InputTextType.email,
        label: 'Email',
        controller: TextEditingController(),
        readOnly: false,
      );

      final inputTextPassword = InputText(
        type: InputTextType.password,
        label: 'Password',
        controller: TextEditingController(),
        readOnly: false,
      );

      final builder = GoldenBuilder.grid(columns: 3, widthToHeightRatio: 1)
        ..addScenario('Input text email', inputTextEmail)
        ..addScenario('Input text password', inputTextPassword)
        ..addScenario('Input text password with focus', inputTextPassword)
        ..addScenario('Input text not readOnly', inputTextEmail)
        ..addScenario('Input text not readOnly', inputTextPassword);

      await tester.pumpWidgetBuilder(builder.build());
      await tester.tap(find.byType(TextField).last);
      await screenMatchesGolden(tester, 'input_text_grid');
    },
  );
}

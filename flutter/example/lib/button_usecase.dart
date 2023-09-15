import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;
import 'package:yaki_ui/yaki_ui.dart';

@widgetbook.UseCase(
  name: 'Simple primary button',
  type: Button,
)
Widget simplePrimaryButton(BuildContext context) {
  return Center(
    child: Button(
      text: context.knobs.string(
        label: 'Button label',
        description: 'The label of the button',
        initialValue: 'Yaki button',
      ),
    ),
  );
}

@widgetbook.UseCase(
  name: 'Simple secondary button',
  type: Button,
)
Widget simpleSecondaryButton(BuildContext context) {
  return Center(
    child: Button.secondary(
      text: context.knobs.string(
        label: 'Button label',
        description: 'The label of the button',
        initialValue: 'Yaki secondary button',
      ),
    ),
  );
}
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
      onPressed: context.knobs.boolean(
        label: 'Button onPressed',
        description: 'The onPressed of the button',
        initialValue: true,
      )
          ? () {}
          : null,
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
      onPressed: context.knobs.boolean(
        label: 'Button onPressed',
        description: 'The onPressed of the button',
        initialValue: true,
      )
          ? () {}
          : null,
      text: context.knobs.string(
        label: 'Button label',
        description: 'The label of the button',
        initialValue: 'Yaki secondary button',
      ),
    ),
  );
}

@widgetbook.UseCase(
  name: 'Simple tertiary button',
  type: Button,
)
Widget simpleTertiaryButton(BuildContext context) {
  return Center(
    child: Button.tertiary(
      onPressed: context.knobs.boolean(
        label: 'Button onPressed',
        description: 'The onPressed of the button',
        initialValue: true,
      )
          ? () {}
          : null,
      text: context.knobs.string(
        label: 'Button label',
        description: 'The label of the button',
        initialValue: 'Yaki tertiary button',
      ),
    ),
  );
}

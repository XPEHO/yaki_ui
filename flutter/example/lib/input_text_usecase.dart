import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;
import 'package:yaki_ui/yaki_ui.dart';

@widgetbook.UseCase(
  name: 'Input text',
  type: InputText,
)
Widget inputText(BuildContext context) {
  return Center(
    child: InputText(
      controller: TextEditingController(),
      type: context.knobs.list<InputTextType>(
        label: 'Type of text field',
        options: [
          InputTextType.email,
          InputTextType.password,
        ],
      ),
      label: context.knobs.string(
        label: 'Hint label',
        description: 'The hint label of the text field',
        initialValue: 'Password',
      ),
    ),
  );
}

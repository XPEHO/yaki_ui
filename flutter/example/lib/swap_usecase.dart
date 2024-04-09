import 'package:flutter/material.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;
import 'package:yaki_ui/yaki_ui.dart';

@widgetbook.UseCase(
  name: 'Simple swap',
  type: Swap,
)
Widget simpleSwap(BuildContext context) {
  return const Center(
    child: Swap(),
  );
}

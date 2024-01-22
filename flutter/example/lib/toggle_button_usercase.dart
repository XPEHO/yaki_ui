import 'package:flutter/material.dart';

import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;
import 'package:yaki_ui/yaki_ui.dart';

@widgetbook.UseCase(name: 'Morning Afternoon toggle', type: ToggleButton)
Widget toggleButton(BuildContext context) {
  return Center(
    child: ToggleButton(
        isSelected: const [true, false],
        labels: const ['Morning', 'Noon'],
        onToggleButtonSelect: (selectedOption) {
          debugPrint('Selected option: $selectedOption');
        }),
  );
}

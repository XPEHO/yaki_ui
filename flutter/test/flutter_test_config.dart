import 'dart:async';

import 'package:flutter_test/flutter_test.dart';
import 'package:golden_toolkit/golden_toolkit.dart';

import 'custom_comparator/tolerance_comparator.dart';

Future<void> testExecutable(FutureOr<void> Function() testMain) async {
  goldenFileComparator = toleranceComparator;
  await loadAppFonts();
  return testMain();
}

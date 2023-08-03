import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter_test/flutter_test.dart';

/// Override the default [GoldenFileComparator] with a tolerant comparator.
///
/// This comparator will ignore differences if they are less than the given
/// [tolerance].
///
/// To specify tolerance, add --dart-define=golden_tolerance=<tolerance> to the
/// flutter test command.
///
/// For example, to set the tolerance to 1%, run:
///   flutter test --dart-define=golden_tolerance=1
///
get toleranceComparator {
  const toleranceArg =
      String.fromEnvironment('golden_tolerance', defaultValue: '0.0');
  final tolerance = double.parse(toleranceArg) / 100;
  final currentDirUri = goldenFileComparator is LocalFileComparator
      ? (goldenFileComparator as LocalFileComparator).basedir
      : Uri.file(Directory.current.path);

  final currentFileUri =
      Directory(currentDirUri.toFilePath()).listSync().first.uri;
  return _ToleranceComparator(
    tolerance,
    currentFileUri,
  );
}

class _ToleranceComparator extends LocalFileComparator {
  final double tolerance;

  _ToleranceComparator(this.tolerance, super.uri);

  @override
  Future<bool> compare(Uint8List imageBytes, Uri golden) async {
    final ComparisonResult result = await GoldenFileComparator.compareLists(
      imageBytes,
      await getGoldenBytes(golden),
    );

    debugPrint(
        'Golden "$golden" compared with a diff of ${result.diffPercent}%');
    debugPrint('Tolerance is $tolerance%');

    if (!result.passed && result.diffPercent > tolerance) {
      final String error = await generateFailureOutput(result, golden, basedir);
      throw FlutterError(error);
    }

    return result.diffPercent <= tolerance;
  }
}

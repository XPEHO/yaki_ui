import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

import 'main.directories.g.dart';

void main() {
  runApp(const MyApp());
}

@widgetbook.App()
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Widgetbook.material(directories: directories, addons: [
      DeviceFrameAddon(
        devices: [
          Devices.android.samsungGalaxyS20,
          Devices.ios.iPhone13,
        ],
      ),
    ]);
  }
}

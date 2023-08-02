import 'package:flutter/material.dart';
import 'package:yaki_ui/yaki_ui.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const YakiUIExample(),
    );
  }
}

class YakiUIExample extends StatelessWidget {
  const YakiUIExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Yaki UI Example'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Button(
                text: 'SE CONNECTER',
                onPressed: () => debugPrint('button pressed'),
              ),
              Button.secondary(
                text: 'MOT DE PASSE OUBLIÉ',
                onPressed: () => debugPrint('button pressed'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
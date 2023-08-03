# Yaki UI

This is the UI for the Yaki project.

## Supported platforms

- Web CSS
- Flutter multiplatform

## Getting Started

### Web

TODO - Describe how to import Web library using npm

### Flutter

TODO - Describe how to import Flutter library using pub

## Components

### Button

![](flutter/test/goldens/button_grid.png)

__Web usage__

```html
<!DOCTYPE html>
<html>
  <head>
    <title>Yaki UI</title>
    <link rel="stylesheet" href="css/yaki_ui.css">
  </head>
  <body>
    <!-- Primary button -->
    <div class="button primary">Button</div>
    <!-- Secondary button -->
    <div class="button secondary">Button</div>
  </body>
</html>
```

__Flutter usage__

```dart
import 'package:yaki_ui/yaki_ui.dart';

// Primary button
class MyWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Button(
      text: 'Button',
      onPressed: () {},
    );
  }
}

// Secondary button
class MyWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Button.secondary(
      text: 'Button',
      onPressed: () {},
    );
  }
}
```
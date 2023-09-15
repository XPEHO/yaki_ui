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

### Icon chip

![](flutter/test/goldens/icon_chip_grid.png)

__Web usage__
```html
TODO
```

__Flutter usage__

```dart
import 'package:yaki_ui/yaki_ui.dart';

// Icon chip
class MyWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return IconChip(
      label: 'Hello World !',
      backgroundColor: Colors.blue,
      image: ClipRRect(
        borderRadius: BorderRadius.circular(50),
        child: Image.network(
          'https://picsum.photos/200',
          width: 100,
          height: 100,
        ),
      ),
    );
  }
}
```

## Widgetbook

This project uses [Widgetbook](https://pub.dev/packages/widgetbook) to document the widgets.

More information about Widgetbook can be found on [widgetbook.io](https://www.widgetbook.io/)
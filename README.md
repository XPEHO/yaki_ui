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

**Web usage**

```html
<!DOCTYPE html>
<html>
  <head>
    <title>Yaki UI</title>
    <link
      rel="stylesheet"
      href="css/yaki_ui.css" />
  </head>
  <body>
    <!-- Primary button -->
    <div class="button primary">Button</div>
    <!-- Secondary button -->
    <div class="button secondary">Button</div>
  </body>
</html>
```

**Flutter usage**

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

// Tertiary button
class MyWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Button.tertiary(
      text: 'Button',
      onPressed: () {},
    );
  }
}
```

### Icon chip

![](flutter/test/goldens/icon_chip_grid.png)

**Web usage**

```html
TODO
```

**Flutter usage**

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

### Cell

![](flutter/test/goldens/cell_grid.png)

**Web usage**

```html
TODO
```

**Flutter usage**

```dart
import 'package:yaki_ui/yaki_ui.dart';

// Icon chip
class MyWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Cell(
      title: 'Hello World',
      subtitle: 'Welcome to Yaki UI !',
      image: Container(
        height: 48,
        width: 48,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(
            20,
          ),
          image: const DecorationImage(
            image: NetworkImage(
              'https://picsum.photos/200/300',
            ),
            fit: BoxFit.cover,
          ),
        ),
      ),
      chips: const Icon(Icons.abc),
      child: IconChip(
        image: const Icon(Icons.abc),
        label: 'ABC',
        backgroundColor: Colors.grey.shade300,
      ),
    );
  }
}
```

### TeamSelectionCard

![](flutter/test/goldens/team_selection_card_grid.png)

**Web usage**

```html
TODO
```

**Flutter usage**

```dart
import 'package:yaki_ui/yaki_ui.dart';

// Icon chip
class MyWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TeamSelectionCard(
      picture: Image.network(
        'https://picsum.photos/200',
      ),
      title: 'Yaki',
      subtitle: 'Yaki is a design system',
      onSelectionChanged: (selected) {
        debugPrint('Team selection changed: $selected');
      },
    );
  }
}
```

### InputText

![](flutter/test/goldens/input_text_grid.png)

**Web usage**

```html
TODO
```

**Flutter usage**

```dart
import 'package:yaki_ui/yaki_ui.dart';

// Icon chip
class MyWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return InputText(
      type: InputTextType.email,
      label: 'Email',
      controller: TextEditingController(),
      enabled: true,
    );
  }
}
```

### LocationSelectionCard

![](flutter/test/goldens/location_selection_card_grid.png)

**Web usage**

```html
TODO
```

**Flutter usage**

```dart
import 'package:yaki_ui/yaki_ui.dart';
// Icon chip
class MyWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LocationSelectionCard(
      picture: const Icon(Icons.abc),
      title: 'Yaki',
      subtitle: 'Yaki is a design system',
      onSelectionChanged: (selected) {},
    );
  }
}
```

### ToggleButton

![](flutter/test/goldens/toggle_button_grid.png)

**Web usage**

```html
TODO
```

**Flutter usage**

```dart
import 'package:yaki_ui/yaki_ui.dart';
// Icon chip
class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ToggleButton(
      isSelected: const [true, false],
      labels: const ['Morning', 'Noon'],
      onToggleButtonSelect: (selectedOption) {
        debugPrint('Selected option: $selectedOption');
      },
    );
  }
}

```

## Widgetbook

This project uses [Widgetbook](https://pub.dev/packages/widgetbook) to document the widgets.

More information about Widgetbook can be found on [widgetbook.io](https://www.widgetbook.io/)

```

```

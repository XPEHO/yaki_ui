# Yaki UI

This is the UI for the Yaki project.

## Supported platforms

- Web CSS
- Flutter multiplatform
- SwiftUI

## Getting Started

### Web

TODO - Describe how to import Web library using npm

### Flutter

TODO - Describe how to import Flutter library using pub

### SwiftUI

In Xcode click on `File > Add Package Dependencies...`.

![xcode-menu](doc/SwiftUI/src/xcode-menu.png)

In the search bar at the top right corner, type the link [https://github.com/XPEHO/yaki_ui](https://github.com/XPEHO/yaki_ui) and press `Enter` key.

![xcode-package-search](doc/SwiftUI/src/xcode-package-search.png)

At the bottom right corner of the modal, click on `Add Package` button.

Make sure to add this line at the start of your app to load the fonts used for the components:

```swift
import xpeho_ui

init() {
  Fonts.registerFonts()
}
```

You can use them by yourself in your app using :

```swift
import xpeho_ui

Text("text").font(.rubik(.bold, size: 18))
Text("text").font(.raleway(.bold, size: 18))
Text("text").font(.roboto(.bold, size: 18))
```

As you can see the possible fonts are [Rubik](https://fonts.google.com/specimen/Rubik), [Raleway](https://fonts.google.com/specimen/Raleway) and [Roboto](https://fonts.google.com/specimen/Roboto) from Google Fonts.

Moreover, you can used the images of the design using :

```swift
import xpeho_ui

Assets.loadImage(named: "ImageName")
```

The possible images can be viewed in the package's [Assets.xcassets](swift/xpeho_ui/Sources/xpeho_ui/Resources/Assets.xcassets) and their names are as follows:

- 3dots
- Account
- AddPlus
- Anchor
- Arrow-down
- Arrow-left
- Arrow-right
- Arrow-up
- Birthday
- Boat
- Briefcase
- BriefcaseYAKI
- BurgerMenu
- Calendar
- Check
- Chevron-down
- Chevron-left
- Chevron-right
- Chevron-up
- ContactFill
- CrossClose
- Edit
- Eye
- Filter
- Gouvernail
- Newsletter
- Placeholder
- PlaneDeparture
- QVST
- Receipt
- Search
- Statistic
- Teams
- Validated

Finally, you can use the colors of the design using the constants directly, they are define in [Utils.swift](swift/xpeho_ui/Sources/xpeho_ui/Utils/Utils.swift) and the list is :

- XPEHO_COLOR : ![#A0CE4E](https://via.placeholder.com/15/A0CE4E/000000?text=+)
- XPEHO_DARK_COLOR : ![#88AF41](https://via.placeholder.com/15/88AF41/000000?text=+)
- GREEN_DARK_COLOR : ![#3F6D34](https://via.placeholder.com/15/3F6D34/000000?text=+)
- RED_INFO_COLOR : ![#D25656](https://via.placeholder.com/15/D25656/000000?text=+)
- DISABLED_COLOR : ![#E6ECEF](https://via.placeholder.com/15/E6ECEF/000000?text=+)
- CONTENT_COLOR : ![#212121](https://via.placeholder.com/15/212121/000000?text=+)
- BACKGROUND_COLOR : ![#F2F6F9](https://via.placeholder.com/15/F2F6F9/000000?text=+)
- GRAY_LIGHT_COLOR : ![#EEEEEE](https://via.placeholder.com/15/EEEEEE/000000?text=+)

## Components

### Button

![](flutter/test/goldens/button_grid.png)

**Web usage**

```html
<!DOCTYPE html>
<html>
  <head>
    <title>Yaki UI</title>
    <link rel="stylesheet" href="css/yaki_ui.css" />
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

**Swift usage**

```swift
import xpeho_ui

ClickyButton(
    label: "Clicky Button Customized",
    size: 20,
    backgroundColor: .red,
    labelColor: .white,
    thinMode: false,
    isDisabled: false,
    onPress: {
        debugPrint("The button is pressed")
    }
)
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

**Swift usage**

```swift
import xpeho_ui

InputText(
    label: "Input Text Customed",
    hiddenSwitcherIcon: Assets.loadImage(named: "Eye"),
    initialInput: "input",
    labelSize: 15.0,
    inputSize: 20.0,
    labelColor: RED_INFO_COLOR,
    backgroundColor: CONTENT_COLOR,
    inputColor: .white,
    hiddenSwitcherColor: .white,
    isHiddenable: false,
    onInput: { input in
        debugPrint("The input \(input) is typed")
    }
)

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
// Toggle button
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

### DatePickerCard

![](flutter/test/goldens/date_picker_card_grid.png)

**Web usage**

```html
TODO
```

**Flutter usage**

```dart
import 'package:yaki_ui/yaki_ui.dart';
// darte picker card
class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return DatePickerCard(
      title: "Start",
      initialButtonLabel: "Pick a date",
      earliestSelectableDate: DateTime.now(),
      onDateSelection: (selectedDateTime) {
        debugPrint('Date selected: $selectedDateTime');
      },
      toggleLabels: const ["Morning", "Noon"],
    );
  }
}
```

### ChoiceSelector

**Swift Usage**

```swift
import xpeho_ui

ChoiceSelector(
    label: "Choice Selector Customized",
    choicesAvailable: ["Choice Custom 1", "Choice Custom 2", "Choice Custom 3", "Choice Custom 4", "Choice Custom 5"],
    size: 20.0,
    backgroundColor: CONTENT_COLOR,
    choiceColor: .white,
    checkIconColor: .white,
    separatorColor: .white,
    onPress: { choice in
        debugPrint("The choice \(choice) is pressed")
    }
)
```

### CollapsableCard

**Swift Usage**

```swift
import xpeho_ui

CollapsableCard(
    label: "Collapsable Card Customized",
    headTag: "Head Tag",
    tags: ["Tag Customized 1", "Tag Customized 2", "Tag Customized 3", "Tag Customized 4"],
    importantTags: ["Tag Customized 3"],
    buttonLabel: "Action",
    icon: Assets.loadImage(named: "Briefcase"),
    openArrowIcon: Assets.loadImage(named: "Chevron-down"),
    closeArrowIcon: Assets.loadImage(named: "Chevron-up"),
    size: 18.0,
    labelColor: .white,
    backgroundColor: CONTENT_COLOR,
    headTagBackgroundColor: .white,
    headTagLabelColor: RED_INFO_COLOR,
    tagBackgroundColor: .white,
    tagLabelColor: CONTENT_COLOR,
    importantTagBackgroundColor: .white,
    importantTagLabelColor: RED_INFO_COLOR,
    arrowColor: .white,
    iconColor: .white,
    buttonBackgroundColor: RED_INFO_COLOR,
    buttonLabelColor: .white,
    isCollapsable: true,
    isHeadTagVisible: true,
    isButtonVisible: true,
    isDefaultOpen: true,
    onPressButton: {
        debugPrint("The button is pressed")
    }
)
```

### FilePreviewButton

**Swift Usage**

```swift
import xpeho_ui

FilePreviewButton(
    labelLeft: "File Preview Button Customized",
    labelRight: "",
    imagePreview: Assets.loadImage(named: "Placeholder"),
    pillTags: ["Tag Pill Custom 1", "Tag Pill Custom 2", "Tag Pill Custom 3", "Tag Pill Custom 4"],
    arrowIcon: Assets.loadImage(named: "Arrow-right"),
    height: 200,
    labelSize: 20,
    backgroundColor: CONTENT_COLOR,
    labelColor: .white,
    pillBackColor: RED_INFO_COLOR,
    pillLabelColor: .white,
    arrowColor: RED_INFO_COLOR,
    isDisabled: false,
    isLabelsAbove: false,
    onPress: {
        debugPrint("The button is pressed")
    }
)
```

### TagPill

**Swift Usage**

```swift
import xpeho_ui

TagPill(
    label: "Tag Pill Customized",
    size: 20,
    backgroundColor: GREEN_DARK_COLOR,
    labelColor: .white
)
```

## Widgetbook

This project uses [Widgetbook](https://pub.dev/packages/widgetbook) to document the widgets.

More information about Widgetbook can be found on [widgetbook.io](https://www.widgetbook.io/)

```

```

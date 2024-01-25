import 'package:flutter/material.dart';
import 'package:yaki_ui/date_picker_header.dart';
import 'package:yaki_ui/yaki_ui.dart';
import 'package:intl/intl.dart';

typedef OnDateSelection = void Function(DateTime selectedDateTime);

class DatePickerCard extends StatefulWidget {
  final String title;
  final String initialButtonLabel;
  final DateTime earliestSelectableDate;
  final OnDateSelection onDateSelection;
  final List<String> toggleLabels;
  final bool? isTopRadius;
  final bool? isDatePickerOpen;

  const DatePickerCard({
    super.key,
    required this.title,
    required this.initialButtonLabel,
    required this.earliestSelectableDate,
    required this.onDateSelection,
    required this.toggleLabels,
    this.isTopRadius,
    this.isDatePickerOpen,
  });

  @override
  State<DatePickerCard> createState() => DatePickerCardState();
}

class DatePickerCardState extends State<DatePickerCard> {
  /// allow to call the onDateSelection callback only the first time the button is pressed
  bool _isFirstButtonPress = true;
  bool _isOpen = false;
  bool _isCalendarVisible = false;
  bool _isCalendartOpacityVisible = false;

  /// date selected in the calendar
  late DateTime _selectedDate;
  late String _datePickerButtonLabel;
  late String _selectedDayMoment;

  /// Widget state initialization
  /// - Set the button label to the initial button label
  /// - Set the selected date to the earliest selectable date
  /// - Set the selected time to the first toggle label
  /// - If isDatePickerOpen is not null, and true open the calendar, else close it
  @override
  void initState() {
    super.initState();
    _datePickerButtonLabel = widget.initialButtonLabel;
    _selectedDate = widget.earliestSelectableDate;
    _selectedDayMoment = widget.toggleLabels.first;

    if (widget.isDatePickerOpen == true) {
      _isOpen = true;
      _showCalendar();
    } else if (widget.isDatePickerOpen == false) {
      _isOpen = false;
      _hideCalendar();
    }
  }

  /// On select a date on the calendar
  /// - Update the selected date
  /// - Update the displayed button label to display the selected date
  /// - Call the onDateSelection callback to return the selected date
  void _onDateChanged(DateTime newDate) {
    setState(() {
      _selectedDate = newDate;
    });
    _setDisplayedButtonLabel();
    _assignHoursAndReturnSelectedDate();
  }

  /// On toggle button select (select time of the day), update the selected time and the displayed button label
  void _onDayMomentSelect(String selectedTime) {
    setState(() {
      _selectedDayMoment = selectedTime;
    });
    _setDisplayedButtonLabel();
    _assignHoursAndReturnSelectedDate();
  }

  /// ElevatedButton onPressed
  /// On Press:
  /// - Toggle the isOpen state
  /// - Set the buttonText to the selected date to display the current day date
  /// - Show the calendar
  ///
  /// On Press again:
  /// - Hide the calendar
  void _onDatePickerButtonPress() async {
    setState(() {
      _isOpen = !_isOpen;
    });

    _setDisplayedButtonLabel();
    _isOpen ? _showCalendar() : _hideCalendar();

    if (_isFirstButtonPress && _isOpen) {
      DateTime dateWithoutHours =
          DateTime(_selectedDate.year, _selectedDate.month, _selectedDate.day);
      widget.onDateSelection(dateWithoutHours);
      _isFirstButtonPress = false;
    }
  }

  /// The calendar need to be part of the widget tree to be able to animate its opacity,
  /// therefore wait for the container animation to end before showing it via opacity,
  /// as it take the full height once it part of the widget tree
  Future<void> _showCalendar() async {
    await Future.delayed(const Duration(milliseconds: containerAnimDuration));
    setState(() {
      _isCalendarVisible = true;
    });
    await Future.delayed(const Duration(milliseconds: 5));
    setState(() {
      _isCalendartOpacityVisible = true;
    });
  }

  /// Hide the calendar and set the opacity to 0
  Future<void> _hideCalendar() async {
    setState(() {
      _isCalendarVisible = false;
      _isCalendartOpacityVisible = false;
    });
  }

  /// Set the date picker button text. Use the selected date, and the selected time
  void _setDisplayedButtonLabel() {
    final formatedDate = DateFormat('dd MMM yyyy').format(_selectedDate);
    setState(() {
      _datePickerButtonLabel = '$formatedDate - $_selectedDayMoment';
    });
  }

  /// Set the selected date to the selected time
  /// Return the selected date to the parent widget
  void _assignHoursAndReturnSelectedDate() {
    int index = widget.toggleLabels.indexOf(_selectedDayMoment);
    final dateToReturn =
        index == 0 ? _selectedDate : changeHour(_selectedDate, 12);

    widget.onDateSelection(dateToReturn);
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: containerAnimDuration),
      height: _isOpen ? containerHeightOpened : containerHeightClosed,
      curve: Curves.easeOut,
      child: Container(
        width: double.infinity,
        decoration: containerDecoration(widget.isTopRadius),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            DatePickerHeader(
              title: widget.title,
              displayedButtonLabel: _datePickerButtonLabel,
              initialButtonText: widget.initialButtonLabel,
              onButtonPress: _onDatePickerButtonPress,
            ),
            if (_isCalendarVisible)
              const Divider(
                color: kBackgroundColor,
                thickness: 1.0,
              ),
            if (_isCalendarVisible)
              AnimatedOpacity(
                opacity: _isCalendartOpacityVisible ? 1 : 0,
                duration:
                    const Duration(milliseconds: calendarAnimOpacityDuration),
                curve: Curves.easeIn,
                child: CalendarDatePicker(
                  initialDate: _selectedDate,
                  firstDate: widget.earliestSelectableDate,
                  lastDate: DateTime(DateTime.now().year + 1),
                  onDateChanged: (DateTime newDate) => _onDateChanged(newDate),
                ),
              ),
            if (_isCalendarVisible)
              Padding(
                padding: const EdgeInsets.only(left: 24, right: 24),
                child: ToggleButton(
                  isSelected: const [true, false],
                  labels: widget.toggleLabels,
                  onToggleButtonSelect: (String selectedTime) =>
                      _onDayMomentSelect(selectedTime),
                ),
              ),
          ],
        ),
      ),
    );
  }
}

const int containerAnimDuration = 150;
const int calendarAnimOpacityDuration = 150;
const double containerHeightClosed = 64;
const double containerHeightOpened = 478;

/// if isTopRadius is
/// - null -> no radius
/// - true -> top radius
/// - false -> bottom radius
BoxDecoration containerDecoration(bool? isTopRadius) {
  return BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.only(
      topLeft: Radius.circular(isTopRadius == true ? 16 : 0),
      topRight: Radius.circular(isTopRadius == true ? 16 : 0),
      bottomLeft: Radius.circular(isTopRadius == false ? 16 : 0),
      bottomRight: Radius.circular(isTopRadius == false ? 16 : 0),
    ),
  );
}

DateTime changeHour(DateTime date, int hour) {
  return DateTime(
    date.year,
    date.month,
    date.day,
    hour,
    date.minute,
    date.second,
  );
}

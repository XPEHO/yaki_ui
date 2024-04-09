// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_import, prefer_relative_imports, directives_ordering

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AppGenerator
// **************************************************************************

import 'dart:core';
import 'package:example/button_usecase.dart';
import 'package:example/cell_usecase.dart';
import 'package:example/date_picker_usercase.dart';
import 'package:example/icon_chip_usecase.dart';
import 'package:example/input_text_usecase.dart';
import 'package:example/location_selection_card_usecase.dart';
import 'package:example/swap_usecase.dart';
import 'package:example/team_selection_card_usecase.dart';
import 'package:example/toggle_button_usercase.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:yaki_ui/colors.dart';
import 'package:yaki_ui/date_picker_header.dart';
import 'package:yaki_ui/toggle_button_element.dart';
import 'package:yaki_ui/yaki_ui.dart';

final directories = [
  WidgetbookComponent(
    name: 'LocationSelectionCard',
    useCases: [
      WidgetbookUseCase(
        name: 'Simple location selection Card',
        builder: (context) => simpleLocationSelectionCard(context),
      ),
    ],
  ),
  WidgetbookComponent(
    name: 'Swap',
    useCases: [
      WidgetbookUseCase(
        name: 'Simple swap',
        builder: (context) => simpleSwap(context),
      ),
    ],
  ),
  WidgetbookComponent(
    name: 'ToggleButton',
    useCases: [
      WidgetbookUseCase(
        name: 'Morning Afternoon toggle',
        builder: (context) => toggleButton(context),
      ),
    ],
  ),
  WidgetbookComponent(
    name: 'Button',
    useCases: [
      WidgetbookUseCase(
        name: 'Simple primary button',
        builder: (context) => simplePrimaryButton(context),
      ),
      WidgetbookUseCase(
        name: 'Simple secondary button',
        builder: (context) => simpleSecondaryButton(context),
      ),
      WidgetbookUseCase(
        name: 'Simple tertiary button',
        builder: (context) => simpleTertiaryButton(context),
      ),
    ],
  ),
  WidgetbookComponent(
    name: 'TeamSelectionCard',
    useCases: [
      WidgetbookUseCase(
        name: 'Simple team selection Card',
        builder: (context) => simpleTeamSelectionCard(context),
      ),
    ],
  ),
  WidgetbookComponent(
    name: 'Cell',
    useCases: [
      WidgetbookUseCase(
        name: 'Cell with chips',
        builder: (context) => cellWithChips(context),
      ),
    ],
  ),
  WidgetbookComponent(
    name: 'IconChip',
    useCases: [
      WidgetbookUseCase(
        name: 'Icon chip',
        builder: (context) => iconChip(context),
      ),
    ],
  ),
  WidgetbookComponent(
    name: 'InputText',
    useCases: [
      WidgetbookUseCase(
        name: 'Input text',
        builder: (context) => inputText(context),
      ),
    ],
  ),
  WidgetbookComponent(
    name: 'DatePickerCard',
    useCases: [
      WidgetbookUseCase(
        name: 'Date picker calendar',
        builder: (context) => datePickerCard(context),
      ),
    ],
  ),
];

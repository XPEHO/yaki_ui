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
import 'package:example/icon_chip_usecase.dart';
import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:yaki_ui/yaki_ui.dart';

final directories = [
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
];

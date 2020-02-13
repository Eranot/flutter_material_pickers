// Copyright (c) 2018, codegrue. All rights reserved. Use of this source code
// is governed by the MIT license that can be found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:flutter_material_pickers/dialogs/scroll_picker_dialog.dart';

/// Allows selection of a number via a slot machine carousel
void showMaterialNumberPicker({
  BuildContext context,
  String title,
  final int minNumber,
  final int maxNumber,
  final int selectedNumber,
  Color headerColor,
  Color backgroundColor,
  Color buttonTextColor,
  ValueChanged<int> onChanged,
}) {
  var items = List<String>.generate(
      maxNumber - minNumber + 1, (i) => (i + minNumber).toString());

  showDialog<String>(
    context: context,
    builder: (BuildContext context) {
      return ScrollPickerDialog(
        items: items,
        title: title,
        initialItem: selectedNumber.toString(),
        headerColor: headerColor,
        backgroundColor: backgroundColor,
        buttonTextColor: buttonTextColor,
      );
    },
  ).then((selection) {
    if (onChanged != null && selection != null) onChanged(int.parse(selection));
  });
}

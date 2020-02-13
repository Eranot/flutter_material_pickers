// Copyright (c) 2018, codegrue. All rights reserved. Use of this source code
// is governed by the MIT license that can be found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:flutter_material_pickers/dialogs/responsive_dialog.dart';

/// Allows RGB selection of a color.
void showMaterialColorPicker({
  BuildContext context,
  String title = "Pick a color",
  Color selectedColor,
  Color headerColor,
  Color backgroundColor,
  Color buttonTextColor,
  ValueChanged<Color> onChanged,
}) {
  showDialog<Color>(
    context: context,
    builder: (BuildContext context) {
      return OrientationBuilder(
        builder: (context, orientation) {
          return ResponsiveDialog(
            context: context,
            title: title,
            headerColor: headerColor,
            backgroundColor: backgroundColor,
            buttonTextColor: buttonTextColor,
            forcePortrait: true,
            child: SingleChildScrollView(
              child: ColorPicker(
                pickerColor: selectedColor,
                onColorChanged: (color) => selectedColor = color,
                colorPickerWidth: 1000.0,
                pickerAreaHeightPercent: 0.3,
                enableAlpha: true,
                displayThumbColor: true,
                enableLabel: true,
                paletteType: PaletteType.hsv,
              ),
            ),
            okPressed: () => Navigator.of(context).pop(selectedColor),
          );
        },
      );
    },
  ).then((selection) {
    if (onChanged != null && selection != null) onChanged(selection);
  });
}

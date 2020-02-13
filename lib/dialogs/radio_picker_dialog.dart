// Copyright (c) 2018, codegrue. All rights reserved. Use of this source code
// is governed by the MIT license that can be found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:flutter_material_pickers/pickers/radio_picker.dart';

import 'responsive_dialog.dart';

/// This is a support widget that returns an Dialog with checkboxes as a Widget.
/// It is designed to be used in the showDialog method of other fields.
class RadioPickerDialog extends StatefulWidget {
  RadioPickerDialog({
    this.title,
    this.items,
    this.initialItem,
    this.headerColor,
    this.backgroundColor,
    this.buttonTextColor,
  });

  // Variables
  final List<String> items;
  final String initialItem;
  final String title;
  final Color headerColor;
  final Color backgroundColor;
  final Color buttonTextColor;

  @override
  State<RadioPickerDialog> createState() =>
      _RadioPickerDialogState(initialItem);
}

class _RadioPickerDialogState extends State<RadioPickerDialog> {
  _RadioPickerDialogState(this.selectedItem);

  String selectedItem;

  @override
  Widget build(BuildContext context) {
    assert(context != null);

    return ResponsiveDialog(
      context: context,
      title: widget.title,
      headerColor: widget.headerColor,
      backgroundColor: widget.backgroundColor,
      buttonTextColor: widget.buttonTextColor,
      child: RadioPicker(
        items: widget.items,
        initialItem: selectedItem,
        onChanged: (value) => setState(() => selectedItem = value),
      ),
      okPressed: () => Navigator.of(context).pop(selectedItem),
    );
  }
}

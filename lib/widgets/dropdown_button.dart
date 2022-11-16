import 'package:flutter/material.dart';

class CustomDropDownButton extends StatelessWidget {
  const CustomDropDownButton(
      {super.key, required this.onChanged, this.items, required this.value});
  final String value;
  final Function onChanged;
  final List<DropdownMenuItem<dynamic>>? items;

  @override
  Widget build(BuildContext context) {
    return DropdownButton(
        value: value, items: items, onChanged: ((value) => onChanged(value)));
  }
}

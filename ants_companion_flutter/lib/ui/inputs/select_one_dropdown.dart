import 'package:flutter/material.dart';

class SelectOneDropdown<T> extends StatelessWidget {
  const SelectOneDropdown({
    required this.labelText,
    required this.items,
    required this.selected,
    required this.onSelectionChanged,
    required this.displayItem,
    this.validator,
    super.key,
  });

  final String labelText;
  final List<T> items;
  final T? selected;
  final ValueChanged<T?> onSelectionChanged;
  final String Function(T) displayItem;

  final String? Function(T?)? validator;

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<T>(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      isExpanded: true,
      value: selected,
      items: items.map((item) {
        return DropdownMenuItem<T>(
          value: item,
          child: Text(displayItem(item)),
        );
      }).toList(),
      onChanged: (value) {
        onSelectionChanged(value);
      },
      validator: validator,
      decoration: InputDecoration(labelText: labelText),
    );
  }
}

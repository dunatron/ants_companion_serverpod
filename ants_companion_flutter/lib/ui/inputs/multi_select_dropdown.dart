import 'package:flutter/material.dart';

class MultiSelectDropdown<T> extends StatelessWidget {
  const MultiSelectDropdown({
    required this.items,
    required this.selectedItems,
    required this.onSelectionChanged,
    required this.displayItem,
    super.key,
  });

  final List<T> items;
  final List<T> selectedItems;
  final ValueChanged<List<T>?> onSelectionChanged;
  final String Function(T) displayItem;

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<List<T>>(
      isExpanded: true,
      // value: selectedItems,
      items: items.map((item) {
        // return DropdownMenuItem<List<T>>(
        //   value: [...selectedItems, item],
        //   child: Text(displayItem(item)),
        // );
        return DropdownMenuItem<List<T>>(
          value: [...selectedItems],
          child: Text(displayItem(item)),
        );
      }).toList(),
      onChanged: (value) {
        onSelectionChanged(value);
      },
      validator: (value) {
        return 'No can do';
      },
      decoration: InputDecoration(
        labelText: 'Select Items',
      ),
    );
  }
}

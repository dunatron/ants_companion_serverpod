import 'package:ants_companion_flutter/ui/inputs/multi_select/multi_select_controller.dart';
import 'package:flutter/material.dart';

class MultiSelectCheckboxItem<T> extends StatefulWidget {
  const MultiSelectCheckboxItem({
    required this.controller,
    required this.item,
    required this.label,
    super.key,
  });

  final MultiSelectController<T> controller;
  final T item;
  final Widget label;

  @override
  State<MultiSelectCheckboxItem<T>> createState() =>
      _MultiSelectCheckboxItemState<T>();
}

class _MultiSelectCheckboxItemState<T>
    extends State<MultiSelectCheckboxItem<T>> {
  @override
  void initState() {
    widget.controller.updateNotifier.addListener(() {
      if (mounted && widget.controller.changedItems.contains(widget.item)) {
        setState(() {});
      }
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Checkbox(
          value: widget.controller.selected.contains(widget.item),
          onChanged: (v) {
            widget.controller.toggleItem(widget.item);
          },
        ),
        widget.label
      ],
    );
  }
}

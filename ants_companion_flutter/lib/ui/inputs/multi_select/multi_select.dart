import 'package:ants_companion_flutter/ui/inputs/multi_select/multi_select_checkbox_item.dart';
import 'package:ants_companion_flutter/ui/inputs/multi_select/multi_select_controller.dart';
import 'package:ants_companion_flutter/ui/overlay/sliver_overlay.dart';
import 'package:flutter/material.dart';

class MultiSelect<T> extends StatelessWidget {
  const MultiSelect({
    required this.controller,
    required this.label,
    required this.itemLabel,
    required this.overlayTitle,
    super.key,
  });

  final MultiSelectController<T> controller;

  final String label;

  final Widget Function(T item) itemLabel;

  final String overlayTitle;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        _showOverlay(context);
      },
      child: MultiSelectButtonLabel(
        controller: controller,
        label: label,
      ),
    );
  }

  void _showOverlay(BuildContext context) {
    Navigator.of(context).push(
      SliverOverlay(
        title: overlayTitle,
        slivers: [
          SliverPadding(
            padding: EdgeInsets.all(16),
            sliver: SliverList.builder(
              itemCount: controller.items.length, // renders a scrollbar
              itemBuilder: (context, index) {
                final item = controller.items[index];
                return MultiSelectCheckboxItem(
                  controller: controller,
                  item: item,
                  label: itemLabel(item),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}

class MultiSelectButtonLabel extends StatefulWidget {
  const MultiSelectButtonLabel({
    required this.controller,
    required this.label,
    super.key,
  });

  final String label;

  final MultiSelectController controller;

  @override
  State<MultiSelectButtonLabel> createState() => _MultiSelectButtonLabelState();
}

class _MultiSelectButtonLabelState extends State<MultiSelectButtonLabel> {
  @override
  void initState() {
    widget.controller.addListener(() {
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Text('${widget.label} ${widget.controller.selected.length}');
  }
}

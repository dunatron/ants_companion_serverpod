import 'package:flutter/material.dart';

class AntAdminActions extends StatelessWidget {
  const AntAdminActions({
    super.key,
    required this.onDeleteIconTap,
    required this.onEditIconTap,
    required this.createTierTag,
  });

  final VoidCallback onEditIconTap;
  final VoidCallback onDeleteIconTap;
  final VoidCallback createTierTag;

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      icon: const Icon(Icons.more_vert),
      itemBuilder: (BuildContext context) {
        return [
          const PopupMenuItem(
            value: 'edit',
            child: Row(
              children: [
                Icon(Icons.edit),
                SizedBox(width: 8),
                Text('Edit'),
              ],
            ),
          ),
          const PopupMenuItem(
            value: 'createTierTag',
            child: Row(
              children: [
                Icon(Icons.add),
                SizedBox(width: 8),
                Text('Add Tier Tag'),
              ],
            ),
          ),
          const PopupMenuItem(
            value: 'delete',
            child: Row(
              children: [
                Icon(Icons.delete),
                SizedBox(width: 8),
                Text('Delete'),
              ],
            ),
          ),
        ];
      },
      onSelected: (value) {
        if (value == 'edit') {
          onEditIconTap();
        } else if (value == 'delete') {
          onDeleteIconTap();
        } else if (value == 'createTierTag') {
          createTierTag();
        }
      },
    );
  }
}

import 'package:ants_companion_flutter/core/snackbar_service.dart';
import 'package:ants_companion_flutter/domain/ants/ants.dart';
import 'package:ants_companion_flutter/domain/ants/models/ant.dart';
import 'package:ants_companion_flutter/ui/ant_card/ant_admin_actions.dart';
import 'package:ants_companion_flutter/ui/ant_card/ant_card.dart';
import 'package:ants_companion_flutter/ui/widgets/sliver_generic_grid.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';

class AdminAntsList extends StatelessWidget {
  AdminAntsList({super.key});

  final Ants _ants = GetIt.I();

  void _goToEditAnt(BuildContext context, String antId) {
    context.go('/admin/update-ant/$antId');
  }

  void _goToAddTierTag(BuildContext context, String antId) {
    context.go('/admin/create-tier-tag');
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: _ants.antsList(),
      builder: (context, snapshot) {
        final antsList = snapshot.data;

        if (antsList == null) {
          return const SliverToBoxAdapter(child: CircularProgressIndicator());
        }

        if (antsList.isEmpty) {
          return const SliverToBoxAdapter(child: Text('No Ants created yet'));
        }

        double width = MediaQuery.sizeOf(context).width;

        if (width > 520) {
          return SliverGenericGrid(
            items: antsList,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: (width / 320).floor(),
              crossAxisSpacing: 8,
              mainAxisSpacing: 8,
            ),
            itemBuilder: (ant, index) {
              return AntCard(
                ant: ant,
                actions: AntAdminActions(
                  onDeleteIconTap: () => _confirmAndDelete(context, ant),
                  onEditIconTap: () => _goToEditAnt(context, ant.id),
                  createTierTag: () => _goToAddTierTag(context, ant.id),
                ),
              );
            },
          );
        }

        return SliverList.builder(
          itemCount: antsList.length,
          itemBuilder: (_, index) {
            final ant = antsList[index];
            return Dismissible(
              background: Container(
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                color: Colors.red,
                alignment: Alignment.centerLeft,
                child: const Icon(Icons.cancel),
              ),
              secondaryBackground: Container(
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                color: Colors.red,
                alignment: Alignment.centerRight,
                child: const Icon(Icons.cancel),
              ),
              key: Key(ant.id),
              confirmDismiss: (direction) => _confirmAndDelete(context, ant),
              child: ListTile(
                title: Text(ant.name),
                trailing: AntAdminActions(
                  onDeleteIconTap: () => _confirmAndDelete(context, ant),
                  onEditIconTap: () => _goToEditAnt(context, ant.id),
                  createTierTag: () => _goToAddTierTag(context, ant.id),
                ),
              ),
            );
          },
        );
      },
    );
  }

  Future<bool> _confirmAndDelete(BuildContext context, Ant ant) async {
    final confirmed = await _confirmDeleteAntDialog(context, ant);
    if (confirmed == false) {
      return false;
    }
    // if true do try to delete the ant
    return await _deleteAnt(ant);
  }

  Future<bool> _deleteAnt(Ant ant) async {
    try {
      await Future.delayed(Duration(seconds: 2));
      await _ants.deleteAnt(ant.id);
      SnackbarService()
        ..hideCurrent()
        ..showSnackbar('Deleted ant: ${ant.name}', type: SnackbarType.success);
      return true;
    } catch (e) {
      SnackbarService()
        ..hideCurrent()
        ..showSnackbar(e.toString(), type: SnackbarType.error);

      return false;
    }
  }

  Future<dynamic> _confirmDeleteAntDialog(BuildContext context, Ant ant) {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Confirm"),
          content: Text("Are you sure you wish to delete ${ant.name}?"),
          actions: <Widget>[
            ElevatedButton(
                onPressed: () => Navigator.of(context).pop(true),
                child: const Text("DELETE")),
            ElevatedButton(
              onPressed: () => Navigator.of(context).pop(false),
              child: const Text("CANCEL"),
            ),
          ],
        );
      },
    );
  }
}

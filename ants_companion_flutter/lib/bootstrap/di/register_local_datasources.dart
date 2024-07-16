import 'package:ants_companion_flutter/data/ants/datasource/ants_local_datasource.dart';
import 'package:ants_companion_flutter/domain/ants/models/ant.dart';
import 'package:ants_companion_flutter/domain/ants/models/ant_role.dart';
import 'package:ants_companion_flutter/domain/ants/models/ant_type.dart';
import 'package:get_it/get_it.dart';
import 'package:hive_flutter/hive_flutter.dart';

Future<void> registerLocalDataSources() async {
  // Hive.registerAdapter(AntAdapter());

  Hive.registerAdapter(AntAdapter());
  Hive.registerAdapter(AntTypeAdapter());
  Hive.registerAdapter(AntRoleAdapter());

  final antsDatasourceBox = await Hive.openBox<Ant>('ants_datasource_box');

  GetIt.I.registerLazySingleton(() => AntsLocalDatasource(antsDatasourceBox));
}

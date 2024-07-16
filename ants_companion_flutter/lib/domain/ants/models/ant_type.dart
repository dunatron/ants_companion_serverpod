import 'package:ants_companion_flutter/domain/_store_model_type_ids.dart';
import 'package:hive/hive.dart';

part 'ant_type.g.dart';

@HiveType(typeId: StoreModelTypeIds.antType)
enum AntType {
  @HiveField(0)
  guardian,
  @HiveField(1)
  shooter,
  @HiveField(2)
  carrier,
  @HiveField(3)
  universal,
}

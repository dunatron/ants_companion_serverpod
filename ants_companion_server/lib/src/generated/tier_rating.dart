/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports
// ignore_for_file: use_super_parameters
// ignore_for_file: type_literal_in_constant_pattern

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod/serverpod.dart' as _i1;

enum TierRating implements _i1.SerializableModel {
  meta,
  f2pMeta,
  s,
  a,
  b,
  c,
  f;

  static TierRating fromJson(int index) {
    switch (index) {
      case 0:
        return meta;
      case 1:
        return f2pMeta;
      case 2:
        return s;
      case 3:
        return a;
      case 4:
        return b;
      case 5:
        return c;
      case 6:
        return f;
      default:
        throw ArgumentError(
            'Value "$index" cannot be converted to "TierRating"');
    }
  }

  @override
  int toJson() => index;
  @override
  String toString() => name;
}

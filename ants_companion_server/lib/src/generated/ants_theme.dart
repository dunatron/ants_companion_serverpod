/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports
// ignore_for_file: use_super_parameters
// ignore_for_file: type_literal_in_constant_pattern

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod/serverpod.dart' as _i1;

abstract class AntsTheme
    implements _i1.SerializableModel, _i1.ProtocolSerialization {
  AntsTheme._({required this.dark});

  factory AntsTheme({required bool dark}) = _AntsThemeImpl;

  factory AntsTheme.fromJson(Map<String, dynamic> jsonSerialization) {
    return AntsTheme(dark: jsonSerialization['dark'] as bool);
  }

  bool dark;

  AntsTheme copyWith({bool? dark});
  @override
  Map<String, dynamic> toJson() {
    return {'dark': dark};
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {'dark': dark};
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _AntsThemeImpl extends AntsTheme {
  _AntsThemeImpl({required bool dark}) : super._(dark: dark);

  @override
  AntsTheme copyWith({bool? dark}) {
    return AntsTheme(dark: dark ?? this.dark);
  }
}

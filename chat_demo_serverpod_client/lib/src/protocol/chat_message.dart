/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports
// ignore_for_file: use_super_parameters
// ignore_for_file: type_literal_in_constant_pattern

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod_client/serverpod_client.dart' as _i1;

abstract class ChatMessage extends _i1.SerializableEntity {
  ChatMessage._({
    this.id,
    required this.text,
    required this.createdAt,
  });

  factory ChatMessage({
    int? id,
    required String text,
    required DateTime createdAt,
  }) = _ChatMessageImpl;

  factory ChatMessage.fromJson(
    Map<String, dynamic> jsonSerialization,
    _i1.SerializationManager serializationManager,
  ) {
    return ChatMessage(
      id: serializationManager.deserialize<int?>(jsonSerialization['id']),
      text: serializationManager.deserialize<String>(jsonSerialization['text']),
      createdAt: serializationManager
          .deserialize<DateTime>(jsonSerialization['createdAt']),
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  String text;

  DateTime createdAt;

  ChatMessage copyWith({
    int? id,
    String? text,
    DateTime? createdAt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'text': text,
      'createdAt': createdAt,
    };
  }
}

class _Undefined {}

class _ChatMessageImpl extends ChatMessage {
  _ChatMessageImpl({
    int? id,
    required String text,
    required DateTime createdAt,
  }) : super._(
          id: id,
          text: text,
          createdAt: createdAt,
        );

  @override
  ChatMessage copyWith({
    Object? id = _Undefined,
    String? text,
    DateTime? createdAt,
  }) {
    return ChatMessage(
      id: id is int? ? id : this.id,
      text: text ?? this.text,
      createdAt: createdAt ?? this.createdAt,
    );
  }
}

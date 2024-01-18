/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports
// ignore_for_file: use_super_parameters
// ignore_for_file: type_literal_in_constant_pattern

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod_client/serverpod_client.dart' as _i1;
import 'dart:async' as _i2;
import 'package:chat_demo_serverpod_client/src/protocol/chat_message.dart'
    as _i3;
import 'protocol.dart' as _i4;

/// {@category Endpoint}
class EndpointChatMessage extends _i1.EndpointRef {
  EndpointChatMessage(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'chatMessage';

  _i2.Future<List<_i3.ChatMessage>> getMessagesFromDb() =>
      caller.callServerEndpoint<List<_i3.ChatMessage>>(
        'chatMessage',
        'getMessagesFromDb',
        {},
      );

  _i2.Future<_i3.ChatMessage> saveMessageToDb(_i3.ChatMessage message) =>
      caller.callServerEndpoint<_i3.ChatMessage>(
        'chatMessage',
        'saveMessageToDb',
        {'message': message},
      );
}

class Client extends _i1.ServerpodClient {
  Client(
    String host, {
    dynamic securityContext,
    _i1.AuthenticationKeyManager? authenticationKeyManager,
    Duration? streamingConnectionTimeout,
    Duration? connectionTimeout,
  }) : super(
          host,
          _i4.Protocol(),
          securityContext: securityContext,
          authenticationKeyManager: authenticationKeyManager,
          streamingConnectionTimeout: streamingConnectionTimeout,
          connectionTimeout: connectionTimeout,
        ) {
    chatMessage = EndpointChatMessage(this);
  }

  late final EndpointChatMessage chatMessage;

  @override
  Map<String, _i1.EndpointRef> get endpointRefLookup =>
      {'chatMessage': chatMessage};

  @override
  Map<String, _i1.ModuleEndpointCaller> get moduleLookup => {};
}

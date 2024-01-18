/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports
// ignore_for_file: use_super_parameters
// ignore_for_file: type_literal_in_constant_pattern

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod/serverpod.dart' as _i1;
import '../endpoints/chat_message_endpoint.dart' as _i2;
import 'package:chat_demo_serverpod_server/src/generated/chat_message.dart'
    as _i3;

class Endpoints extends _i1.EndpointDispatch {
  @override
  void initializeEndpoints(_i1.Server server) {
    var endpoints = <String, _i1.Endpoint>{
      'chatMessage': _i2.ChatMessageEndpoint()
        ..initialize(
          server,
          'chatMessage',
          null,
        )
    };
    connectors['chatMessage'] = _i1.EndpointConnector(
      name: 'chatMessage',
      endpoint: endpoints['chatMessage']!,
      methodConnectors: {
        'getMessagesFromDb': _i1.MethodConnector(
          name: 'getMessagesFromDb',
          params: {},
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['chatMessage'] as _i2.ChatMessageEndpoint)
                  .getMessagesFromDb(session),
        ),
        'saveMessageToDb': _i1.MethodConnector(
          name: 'saveMessageToDb',
          params: {
            'message': _i1.ParameterDescription(
              name: 'message',
              type: _i1.getType<_i3.ChatMessage>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['chatMessage'] as _i2.ChatMessageEndpoint)
                  .saveMessageToDb(
            session,
            params['message'],
          ),
        ),
      },
    );
  }
}

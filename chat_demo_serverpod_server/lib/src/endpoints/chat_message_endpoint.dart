import 'package:chat_demo_serverpod_server/src/generated/protocol.dart';
import 'package:serverpod/serverpod.dart';

class ChatMessageEndpoint extends Endpoint {
  Future<List<ChatMessage>> getMessagesFromDb(Session session) async {
    return await ChatMessage.db.find(session);
  }

  Future<ChatMessage> saveMessageToDb(
    Session session,
    ChatMessage message,
  ) async {
    return await ChatMessage.db.insertRow(session, message);
  }

  @override
  Future<void> streamOpened(StreamingSession session) async {
    final messages = await getMessagesFromDb(session);

    for (var message in messages) {
      sendStreamMessage(session, message);
    }

    session.messages.addListener('channel-name', (message) {
      sendStreamMessage(session, message);
    });
  }

  @override
  Future<void> handleStreamMessage(
    StreamingSession session,
    SerializableEntity message,
  ) async {
    if (message is ChatMessage) {
      final newMessage = await saveMessageToDb(session, message);
      session.messages.postMessage('channel-name', newMessage);
    }
  }
}

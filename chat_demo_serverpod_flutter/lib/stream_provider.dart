import 'package:chat_demo_serverpod_client/chat_demo_serverpod_client.dart';
import 'package:chat_demo_serverpod_flutter/main.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final myChatMessageStreamProvider = StreamProvider(
  (ref) async* {
    await client.openStreamingConnection();

    List<ChatMessage?> streamList = [];

    await for (var message in client.chatMessage.stream) {
      if (message is ChatMessage) {
        streamList.add(message);
      }

      yield streamList;
    }

    ref.onDispose(() {
      client.closeStreamingConnection();
    });
  },
);

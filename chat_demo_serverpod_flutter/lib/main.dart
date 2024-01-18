import 'package:chat_demo_serverpod_client/chat_demo_serverpod_client.dart';
import 'package:chat_demo_serverpod_flutter/stream_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:serverpod_flutter/serverpod_flutter.dart';

// Sets up a singleton client object that can be used to talk to the server from
// anywhere in our app. The client is generated from your server code.
// The client is set up to connect to a Serverpod running on a local server on
// the default port. You will need to modify this to connect to staging or
// production servers.
var client = Client('http://localhost:8080/')
  ..connectivityMonitor = FlutterConnectivityMonitor();

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = TextEditingController();

    return MaterialApp(
      title: 'Serverpod Flutter Sandbox',
      home: Scaffold(
        body: Center(
          child: Column(
            children: [
              TextField(
                autofocus: true,
                controller: controller,
                onSubmitted: (text) {
                  client.chatMessage.sendStreamMessage(
                    ChatMessage(
                      text: text,
                      createdAt: DateTime.now(),
                    ),
                  );
                  controller.clear();
                },
              ),
              const SizedBox(height: 20),
              ref.watch(myChatMessageStreamProvider).when(
                data: (data) {
                  return ListView.builder(
                    shrinkWrap: true,
                    itemCount: data.length,
                    itemBuilder: (context, index) {
                      final message = data[index];
                      return ListTile(
                        title: Text(message!.text),
                      );
                    },
                  );
                },
                error: (error, stackTrace) {
                  return Text('Error: $error');
                },
                loading: () {
                  return const CircularProgressIndicator();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

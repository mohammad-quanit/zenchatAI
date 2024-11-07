// ignore_for_file: empty_catches, avoid_print

import 'package:dart_frog/dart_frog.dart';
import 'package:dart_frog_web_socket/dart_frog_web_socket.dart';

Future<Response> onRequest(RequestContext context) async {
  final handler = webSocketHandler((channel, protocol) {
    // final apiKey = dotenv.env['GEMINI_API_KEY'];
    // A new client has connected to our server.
    print('connected');

    channel.stream.listen((event) {
      print('Received message from the client: $event');
      // Send a message back to the client.
      channel.sink.add('Received message $event');

      try {
        // Check user input
        // Save it and call gemini api via chat repository
      } catch (e) {}
    });
  });
  return handler(context);
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
// import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:graphql/client.dart';

import 'package:zenchatai/features/chatbot/controllers/chat_controller.dart';


class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});
  static final GraphQLController _controller = Get.put(GraphQLController());
  static final TextEditingController _textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('ZenBot')),
      body: Column(
        children: [
          Expanded(
            child: Obx(() {
              return ListView.builder(
                reverse: true,
                itemCount: _controller.messages.length,
                itemBuilder: (context, index) {
                  final message = _controller.messages[_controller.messages.length - index - 1];
                  final isUserMessage = message['sender'] == 'user';

                  return Align(
                    alignment: isUserMessage ? Alignment.centerRight : Alignment.centerLeft,
                    child: Container(
                      padding: const EdgeInsets.all(12),
                      margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                      decoration: BoxDecoration(
                        color: isUserMessage ? Colors.blueAccent : Colors.grey[300],
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Text(
                        message['text'] ?? '',
                        style: TextStyle(
                          color: isUserMessage ? Colors.white : Colors.black,
                        ),
                      ),
                    ),
                  );
                },
              );
            }),
          ),
          if (_controller.isLoading.value)
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: CircularProgressIndicator(),
            ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _textController,
                    decoration: const InputDecoration(
                      hintText: 'Type your message...',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.send),
                  onPressed: () {
                    if (_textController.text.trim().isNotEmpty) {
                      _controller.sendMessage(_textController.text.trim());
                      _textController.clear();
                    }
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}


//
// class ChatScreen extends StatelessWidget {
//   const ChatScreen({super.key});
//   static final GraphQLController _chat_controller = Get.put(GraphQLController());
//
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('ZenBot'),
//       ),
//       body: Column(
//         children: [
//           Expanded(
//             child: ListView.builder(
//               reverse: true,
//               itemCount: messages.length,
//               itemBuilder: (context, index) {
//                 return ChatMessage(message: messages[index]);
//               },
//             ),
//           ),
//           _buildInputField(),
//         ],
//       ),
//     );
//   }
//
//   Widget _buildInputField() {
//     return Container(
//       padding: const EdgeInsets.all(8.0),
//       child: Row(
//         children: [
//           const Expanded(
//             child: TextField(
//               decoration: InputDecoration(
//                 hintText: 'Type a message...',
//               ),
//             ),
//           ),
//           IconButton(
//             icon: const Icon(Icons.send),
//             onPressed: () {
//               // Add your logic to send a message
//               _hypermodeAI();
//             },
//           ),
//         ],
//       ),
//     );
//   }
// }
//
// class ChatMessage extends StatelessWidget {
//   final String message;
//
//   const ChatMessage({super.key, required this.message});
//
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.all(8.0),
//       child: Align(
//         alignment: Alignment.topLeft,
//         child: Container(
//           decoration: BoxDecoration(
//             color: Colors.blue,
//             borderRadius: BorderRadius.circular(8.0),
//           ),
//           padding: const EdgeInsets.all(8.0),
//           child: Text(
//             message,
//             style: const TextStyle(color: Colors.white),
//           ),
//         ),
//       ),
//     );
//   }
// }
//
// final List<String> messages = [
//   'Hello!',
//   'Hi there!',
//   'How are you?',
//   'I\'m good, thanks!',
// ];
//
//
// Future _googleGemini() async {
//   // Access your API key as an environment variable (see "Set up your API key" above)
//   final apiKey = dotenv.env['GEMINI_API_KEY'];
//   if (apiKey == null) {
//     print('No \$API_KEY environment variable');
//     exit(1);
//   }
//   // For text-only input, use the gemini-pro model
//   final model = GenerativeModel(model: 'gemini-pro', apiKey: apiKey);
//   final content = [Content.text('What is CBT? Explain in detail?')];
//   final response = await model.generateContent(content);
//   print(response.text);
// }

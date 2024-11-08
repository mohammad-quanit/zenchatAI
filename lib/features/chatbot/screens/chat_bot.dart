import 'package:flutter/material.dart';
import 'package:flutter_typing_indicator/flutter_typing_indicator.dart';
import 'package:get/get.dart';
import 'package:zenchatai/features/chatbot/controllers/chat_controller.dart';
import 'package:zenchatai/utils/constants/colors.dart';

class ChatScreen extends StatelessWidget {
  ChatScreen({super.key});

  final BotMessageController _controller = Get.put(BotMessageController());
  final TextEditingController _textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Zen Assistant Bot')),
      body: Column(
        children: [
          Expanded(
            child: Obx(() {
              return ListView.builder(
                reverse: true,
                itemCount: _controller.messages.length,
                itemBuilder: (context, index) {
                  // Display each message in reverse order. The new message appears last.
                  final messageObj = _controller
                      .messages[_controller.messages.length - index - 1];
                  final isUserMessage = messageObj['sender'] == 'user';
                  final isBotMessage = messageObj['sender'] == 'bot';

                  return Align(
                    alignment: isUserMessage
                        ? Alignment.centerRight
                        : Alignment.centerLeft,
                    child: Container(
                      padding: const EdgeInsets.all(12),
                      margin: const EdgeInsets.symmetric(
                          vertical: 4, horizontal: 8),
                      decoration: BoxDecoration(
                        color: isUserMessage ? ZColors.info : ZColors.grey,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Text(
                        messageObj['text'] ?? '',
                        style: TextStyle(
                          color:
                              isUserMessage ? ZColors.textWhite : ZColors.black,
                        ),
                      ),
                    ),
                  );
                },
              );
            }),
          ),
          // Display the typing indicator below the messages if loading
          Obx(() {
            if (_controller.isLoading.value) {
              return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Align(
                    alignment: Alignment.centerLeft, // Align to the left
                    child: TypingIndicator(
                      dotSize: 10,
                      isGradient: true,
                      backgroundColor: Colors.indigo.shade100,
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(12),
                        topRight: Radius.circular(12),
                        bottomLeft: Radius.circular(12),
                        bottomRight: Radius.circular(0),
                      ),
                      dotGradient: const LinearGradient(
                        colors: [
                          Colors.blue,
                          Colors.indigo,
                        ],
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                      ),
                    ),
                  ));
            } else {
              return const SizedBox
                  .shrink(); // Empty space when loading is false
            }
          }),
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
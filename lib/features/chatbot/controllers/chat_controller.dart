import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:zenchatai/utils/constants/text_strings.dart';
import 'package:zenchatai/utils/logging/logger.dart';

class BotMessageService {
  static final String _endpoint = dotenv.env['GRAPHQL_ENDPOINT']!;
  static final String _modusApiKey = dotenv.env['MODUS_API_KEY']!;


  Future<Map<String, dynamic>?> botMsgQuery(String query,
      {Map<String, dynamic>? variables}) async {
    final headers = {
      'Content-Type': 'application/json',
      'Authorization': "Bearer $_modusApiKey"
    };

    final body = jsonEncode({
      'query': query,
      'variables': variables ?? {},
    });

    try {
      final response = await http.post(
        Uri.parse(_endpoint),
        headers: headers,
        body: body,
      );

      if (response.statusCode == 200) {
        final responseBody = jsonDecode(response.body);
        if (responseBody['errors'] != null) {
          ZLoggerHelper.warning("GraphQL errors: ${responseBody['errors']}");
          throw Exception("GraphQL error: ${responseBody['errors']}");
        }
        return responseBody['data'];
      } else {
        throw Exception("Failed to connect: ${response.statusCode}");
      }
    } catch (e) {
      ZLoggerHelper.error("HTTP error: $e");
      throw Exception("HTTP error: $e");
    }
  }
}

class BotMessageController extends GetxController {
  static BotMessageController get instance => Get.find();

  final BotMessageService _botMsgService = BotMessageService();

  var messages = <Map<String, String>>[].obs;
  var isLoading = false.obs;

  Future<void> sendMessage(String userMessage) async {
    // Add the user's message to the messages list
    messages.add({'sender': 'user', 'text': userMessage});
    isLoading.value = true;
    const instructionMsg = ZTexts.chatBotInstructionMessage;
    const String query = '''
      query GenerateText(\$prompt: String!) {
        generateText(
          instruction: "$instructionMsg",
          prompt: \$prompt
        )
      }
    ''';

    try {
      final data = await _botMsgService
          .botMsgQuery(query, variables: {'prompt': userMessage});
      final botResponse = data?['generateText'] ?? 'No response';
      messages.add({'sender': 'bot', 'text': botResponse});
    } catch (e) {
      messages.add({'sender': 'bot', 'text': 'Error: $e'});
    } finally {
      isLoading.value = false;
    }
  }
}

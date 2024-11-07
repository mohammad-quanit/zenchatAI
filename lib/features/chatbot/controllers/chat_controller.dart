import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:graphql/client.dart';
// import 'package:graphql_flutter/graphql_flutter.dart';

import 'package:http/http.dart' as http;
import 'package:zenchatai/utils/logging/logger.dart';

class GraphQLService {
  static final String _endpoint = dotenv.env['LOCAL_GRAPHQL_ENDPOINT']!;

  final GraphQLClient _client = GraphQLClient(
    cache: GraphQLCache(),
    link: HttpLink(
      _endpoint,
      defaultHeaders: {
        'Accept-Encoding': 'gzip, deflate, br',
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Connection': 'keep-alive',
        'DNT': '1',
      },
      httpClient: http.Client(),
    ),
  );

  Future<Map<String, dynamic>?> query(
      String queryString, {
        Map<String, dynamic>? variables,
      }) async {
    try {
      final QueryResult result = await _client.query(
        QueryOptions(
          document: gql(queryString),
          variables: variables ?? {},
          // fetchPolicy: FetchPolicy.noCache,
        ),
      );

      if (result.hasException) {
        ZLoggerHelper.warning(result);
        throw result.exception!;
      }

      return result.data;
    } catch (e) {
      ZLoggerHelper.error('GraphQL query error...', e.toString());
      throw e.toString();
    }
  }
}

class GraphQLController extends GetxController {
  final GraphQLService _graphqlService = GraphQLService();

  var messages = <Map<String, String>>[].obs;
  var isLoading = false.obs;

  Future<void> sendMessage(String userMessage) async {
    // Add the user's message to the messages list
    messages.add({'sender': 'user', 'text': userMessage});
    isLoading.value = true;

    const query = """
      query GenerateText {
    generateText(instruction: "Hello from Assistant. Limit it to 50 words", prompt: "what is dgraph?") {
    	text
    }
}
    """;

    try {
      final data = await _graphqlService.query(
        query,
        variables: {'prompt': userMessage},
      );

      final botResponse = data?['generateText']?['text'] ?? 'No response';
      messages.add({'sender': 'bot', 'text': botResponse});
    } catch (e) {
      messages.add({'sender': 'bot', 'text': 'Error: $e'});
    } finally {
      isLoading.value = false;
    }
  }
}
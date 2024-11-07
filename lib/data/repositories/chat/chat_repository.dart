abstract class ChatRepository {
  Future fetchMessages(String conversationId, Map<String, dynamic> data);
  Future createUserMessage(String conversationId, Map<String, dynamic> data);
  Future createModelMessage(String conversationId, Map<String, dynamic> data);
}

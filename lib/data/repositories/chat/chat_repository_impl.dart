import 'package:get/get.dart';
import 'package:zenchatai/data/repositories/supabase/supabase_table.dart';
import 'package:zenchatai/data/repositories/chat/chat_repository.dart';
import 'package:zenchatai/features/chatbot/controllers/chat_controller.dart';
import 'package:zenchatai/features/chatbot/models/messages.dart';
import 'package:zenchatai/main.dart';

class ChatRepositoryImpl extends GetxController implements ChatRepository {
  static ChatRepositoryImpl get instance => Get.find();
  // final GraphQLService _graphqlService = GraphQLService();


  final SupabaseTable _supabaseTable;
  final _db = supabase;

  ChatRepositoryImpl(this._supabaseTable);

  final Map<String, List<MessageModel>> _chatroom = {};

  @override
  Future createUserMessage(String conversationId, Map<String, dynamic> data) {
    // TODO: implement createUserMessage
    throw UnimplementedError();
  }

  @override
  Future fetchMessages(String conversationId, Map<String, dynamic> data) {
    // TODO: implement fetchMessages
    throw UnimplementedError();
  }

  @override
  Future createModelMessage(String conversationId, Map<String, dynamic> data) {
    // TODO: implement createModelMessage
    throw UnimplementedError();
  }
}

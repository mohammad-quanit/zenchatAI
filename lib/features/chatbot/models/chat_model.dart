/// Convert database model for `conversations` table to internal dart `class`:
// ignore_for_file: non_constant_identifier_names

class ConversationModel {
  // final String id;
  final String user_id;
  final String bot_id;

  const ConversationModel({
    // required this.id,
    required this.user_id,
    required this.bot_id,
  });

  /// - Use `fromJson` method to convert supabase response to [ConversationModel]
  static ConversationModel fromJson(Map<String, dynamic> json) =>
      ConversationModel(
        // id: json['id'] as String,
        user_id: json['user_id'] as String,
        bot_id: json['bot_id'] as String,
      );

  /// - Use `toJson` method to convert [ConversationModel] for update request
  Map<String, dynamic> toJson() => <String, dynamic>{
        // 'id': id,
        'user_id': user_id,
        'bot_id': bot_id,
      };
}

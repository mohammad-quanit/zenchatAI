// ignore_for_file: non_constant_identifier_names

class MessageModel {
  final String conversation_id;
  final String sender_id;
  final String content;

  const MessageModel(
      {required this.conversation_id,
      required this.sender_id,
      required this.content});

  /// - Use `fromJson` method to convert supabase response to [MessageModel]
  factory MessageModel.fromJson(Map<String, dynamic> json) => MessageModel(
        conversation_id: json['conversation_id'],
        sender_id: json['sender_id'],
        content: json['content'],
      );

  /// - Use `toJson` method to convert [MessageModel] for update request
  Map<String, dynamic> toJson() => <String, dynamic>{
        'conversation_id': conversation_id,
        'sender_id': sender_id,
        'content': content,
      };
}

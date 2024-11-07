import 'package:zenchatai/data/repositories/supabase/supabase_table.dart';

class ConversationTable implements SupabaseTable {
  const ConversationTable();

  @override
  String get tableName => "conversations";
}

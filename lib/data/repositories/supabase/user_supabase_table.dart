import 'package:zenchatai/data/repositories/supabase/supabase_table.dart';

class UserSupabaseTable implements SupabaseTable {
  const UserSupabaseTable();

  @override
  String get tableName => "users";
}

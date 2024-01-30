/// Set of all the database tables in Supabase.
///
/// Used to reference valid tables when making database requests.
abstract class SupabaseTable {
  const SupabaseTable();
  String get tableName;
}

class UserSupabaseTable implements SupabaseTable {
  const UserSupabaseTable();

  @override
  String get tableName => "users";
}

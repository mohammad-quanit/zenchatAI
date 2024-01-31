import 'package:get/get.dart';
import 'package:zenchatai/data/repositories/supabase/supabase_table.dart';
import 'package:zenchatai/data/repositories/user/user_repository.dart';
import 'package:zenchatai/features/authentication/models/user_model.dart';
import 'package:zenchatai/main.dart';

class UserRepositoryImpl extends GetxController implements UserRepository {
  static UserRepositoryImpl get instance => Get.find();

  final SupabaseTable _supabaseTable;
  final _db = supabase;

  UserRepositoryImpl(this._supabaseTable);

  @override
  Future<UserModel> getUserInformation(String userId) async {
    final response = await _db
        .from(_supabaseTable.tableName)
        .select()
        .eq("id", userId)
        .single();

    return UserModel.fromJson(response);
  }

  @override
  Future<void> saveUserRecord(UserModel userModel) async {
    try {
      await _db.from(_supabaseTable.tableName).upsert(userModel.toJson());
      print('Data inserted successfully!');
    } catch (e) {
      print('Error inserting data: ${e.toString()}');
    }
  }
}

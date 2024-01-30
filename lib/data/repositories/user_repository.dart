import 'package:get/get.dart';
import 'package:zenchatai/data/supabase/supabase_table.dart';
import 'package:zenchatai/features/authentication/models/user_model.dart';
import 'package:zenchatai/main.dart';

class UserRepository extends GetxController {
  static UserRepository get instance => Get.find();
  late final SupabaseTable _supabaseTable;
  final _db = supabase;

  // Future<UserModel> getUserInformation(String userId) async {
  //   final response = await _db
  //       .from(_userSupabaseTable.tableName)
  //       .select()
  //       .eq(_userSupabaseTable.idColumn, userId)
  //       .single();

  //   final userModel = UserModel.fromJson(response as Map<String, dynamic>);
  //   return userModel;
  // }

  Future<void> saveUserRecord(UserModel userModel) async {
    print(_supabaseTable.tableName);
    try {
      await _db.from(_supabaseTable.tableName).upsert(userModel.toJson());
      print('Data inserted successfully!');
    } catch (e) {
      print('Error inserting data: ${e.toString()}');
    }
  }
}

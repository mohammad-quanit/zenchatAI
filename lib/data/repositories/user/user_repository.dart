import 'package:zenchatai/features/authentication/models/user_model.dart';

abstract class UserRepository {
  Future<UserModel> getUserInformation(String userId);
  Future<void> saveUserRecord(UserModel userModel);
}

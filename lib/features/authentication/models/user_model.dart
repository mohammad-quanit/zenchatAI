/// Convert database model for `user` table to internal dart `class`:
class UserModel {
  final String id;
  final String firstName;
  final String lastName;
  final String username;
  final String email;
  final String gender;

  const UserModel({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.username,
    required this.email,
    required this.gender,
  });

  String get fullName => '$firstName $lastName';

  /// - Use `fromJson` method to convert supabase response to [UserModel]
  static UserModel fromJson(Map<String, dynamic> json) => UserModel(
        id: json['id'] as String,
        firstName: json['firstname'] as String,
        lastName: json['lastname'] as String,
        username: json['username'] as String,
        email: json['email'] as String,
        gender: json['gender'] as String,
      );

  /// - Use `toJson` method to convert [UserModel] for update request
  Map<String, dynamic> toJson() => <String, dynamic>{
        'id': id,
        'firstname': firstName,
        'lastname': lastName,
        'username': username,
        'email': email,
        'gender': gender,
      };
}

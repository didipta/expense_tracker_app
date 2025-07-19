import 'package:expense_tracker_app/features/auth/domain/entities/user.dart';
import 'package:expense_tracker_app/features/common/data/models/base_model.dart';

class UserModel implements BaseModel<User>{
  final String fullName;
  final String email;
  final String password;

  UserModel({
    required this.fullName,
    required this.email,
    required this.password,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      fullName: json['fullName'] as String,
      email: json['email'] as String,
      password: json['password'] as String,
    );
  }
  @override
  User toEntity() {
    return User(
      fullName: fullName,
      email: email,
      password: password,
    );
  }

}
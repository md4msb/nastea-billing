import 'package:nastea_billing/core/domain/entities/user_entity.dart';

class UsersModel extends User {
  const UsersModel({
    required super.id,
    required super.phoneNumber,
    required super.name,
    super.email,
    required super.role,
    required super.appAccess,
  });

  //from Doc
  factory UsersModel.fromJson(Map<String, dynamic> json) {
    return UsersModel(
      id: json['id'] ?? '',
      phoneNumber: json['phone_number'] ?? '',
      name: json['name'] ?? '',
      email: json['email'] ?? '',
      role: json['role'] ?? '',
      appAccess: json['app_access'] ?? '',
    );
  }

  //to Doc
  Map<String, dynamic> toDoc() {
    return {
      'id': id,
      'phone_number': phoneNumber,
      'name': name,
      'email': email,
      'role': role,
      'app_access': appAccess,
    };
  }

  factory UsersModel.fromEntity(User user) {
    return UsersModel(
      id: user.id,
      phoneNumber: user.phoneNumber,
      name: user.name,
      email: user.email ?? "",
      role: user.role,
      appAccess: user.appAccess,
    );
  }
}

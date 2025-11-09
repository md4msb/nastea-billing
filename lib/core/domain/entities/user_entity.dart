import 'package:equatable/equatable.dart';

class User extends Equatable {
  final String id;
  final String phoneNumber;
  final String name;
  final String? email;
  final String role;
  final String appAccess;

  const User({
    required this.id,
    required this.phoneNumber,
    required this.name,
    required this.email,
    required this.role,
    required this.appAccess,
  });

  @override
  List<Object?> get props => [id, phoneNumber, name, email, role, appAccess];
}

import 'package:equatable/equatable.dart';

class User extends Equatable {
  final String? id;
  final String? phoneNumber;
  final String? name;
  final String? email;
  final String? role;
  final bool isAuthenticated;

  const User({
    this.id,
    this.phoneNumber,
    this.name,
    this.email,
    this.role,
    this.isAuthenticated = false,
  });

  @override
  List<Object?> get props => [id, phoneNumber, name, email, role, isAuthenticated];
}

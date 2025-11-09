import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:nastea_billing/core/domain/entities/user_entity.dart';

class FirebaseUser extends User {
  const FirebaseUser({
    required super.id,
    required super.phoneNumber,
    required super.name,
    super.email,
    required super.role,
    required super.appAccess,
  });

  //from Doc
  factory FirebaseUser.fromDoc(DocumentSnapshot<Map<String, dynamic>> doc) {
    final data = doc.data();
    return FirebaseUser(
      id: data?['id'] ?? '',
      phoneNumber: data?['phone_number'] ?? '',
      name: data?['name'] ?? '',
      email: data?['email'] ?? '',
      role: data?['role'] ?? '',
      appAccess: data?['app_access'] ?? '',
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

  factory FirebaseUser.fromEntity(User user) {
    return FirebaseUser(
      id: user.id,
      phoneNumber: user.phoneNumber,
      name: user.name,
      email: user.email ?? "",
      role: user.role,
      appAccess: user.appAccess,
    );
  }
}

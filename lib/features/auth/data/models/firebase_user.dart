import '../../domain/entities/user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseUser extends User {
  const FirebaseUser({
    super.id,
    super.phoneNumber,
    super.name,
    super.email,
    super.role,
    super.isAuthenticated,
  });

  //from Doc
  factory FirebaseUser.fromDoc(DocumentSnapshot<Map<String, dynamic>> doc) {
    final data = doc.data();
    return FirebaseUser(
      id: data?['id'] as String? ?? '',
      phoneNumber: data?['phone_number'] as String? ?? '',
      name: data?['name'] as String? ?? '',
      email: data?['email'] as String? ?? '',
      role: data?['role'] as String? ?? '',
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
    };
  }

  factory FirebaseUser.fromEntity(User user) {
    return FirebaseUser(
      id: user.id ?? "",
      phoneNumber: user.phoneNumber ?? "",
      name: user.name ?? "",
      email: user.email ?? "",
      role: user.role ?? '',
    );
  }
}

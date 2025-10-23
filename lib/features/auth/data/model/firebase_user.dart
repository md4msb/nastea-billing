import '../../domain/entities/user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseUser extends User {
  const FirebaseUser({
    required super.id,
    required super.phoneNumber,
    super.name,
    super.email,
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
    );
  }

  //to Doc
  Map<String, dynamic> toDoc() {
    return {
      'id': id,
      'phone_number': phoneNumber,
      'name': name,
      'email': email,
    };
  }

  factory FirebaseUser.fromEntity(User user) {
    return FirebaseUser(
      id: user.id ?? "",
      phoneNumber: user.phoneNumber ?? "",
      name: user.name ?? "",
      email: user.email ?? "",
    );
  }
}

import 'package:cloud_firestore/cloud_firestore.dart';

extension FirebaseFirestoreExtension on FirebaseFirestore {
  static const String _users = 'users';
  DocumentReference<Map<String, dynamic>> userDocument(String? userId) {
    if (userId == null) throw Exception('invalid user ID'); 
    return collection(_users).doc(userId);
  }
}
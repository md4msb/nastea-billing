import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart' hide User;
import 'package:nastea_billing/core/domain/entities/user_entity.dart';
import 'package:nastea_billing/features/users-management/data/model/users_model.dart';

import 'users_datasource.dart';

class FirebaseUsersDatasource implements UsersDataSource {
  final FirebaseFirestore _firestore;
  final FirebaseAuth _auth;

  const FirebaseUsersDatasource({
    required FirebaseAuth auth,
    required FirebaseFirestore firestore,
  }) : _auth = auth,
       _firestore = firestore;

  String? get _userId => _auth.currentUser?.uid;

  CollectionReference<Map<String, dynamic>> get _usersCollection =>
      _firestore.collection('users');

  @override
  Future<List<User>> getAllUsers() async {
    try {
      if (_userId == null) throw Exception('User not authenticated');
      final snapshot = await _usersCollection.get();
      return snapshot.docs
          .map((doc) => UsersModel.fromJson(doc.data()))
          .toList();
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> updateUserRole(String id, String role) {
    // TODO: implement updateUserRole
    throw UnimplementedError();
  }

  @override
  Future<void> deleteUser(String id) {
    // TODO: implement deleteUser
    throw UnimplementedError();
  }
}

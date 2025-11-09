import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:nastea_billing/core/domain/entities/user_entity.dart';

import 'users_datasource.dart';

class FirebaseUsersDatasource implements UsersDataSource {
  final FirebaseFirestore _firestore;

  const FirebaseUsersDatasource({required FirebaseFirestore firestore})
    : _firestore = firestore;

  @override
  Future<List<User>> getAllUsers() {
    // TODO: implement getAllUsers
    throw UnimplementedError();
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

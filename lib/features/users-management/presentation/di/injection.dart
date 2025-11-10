import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:nastea_billing/features/users-management/data/datasources/firebase_users_datasource.dart';
import 'package:nastea_billing/features/users-management/data/repository-impl/users_repo_impl.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../data/datasources/users_datasource.dart';
import '../../domain/repositories/users_repo.dart';

part 'injection.g.dart';

@Riverpod(keepAlive: true)
UsersRepo usersRepo(Ref ref) {
  return UsersRepoImpl(usersDataSource: ref.read(usersDataSourceProvider));
}

@Riverpod(keepAlive: true)
UsersDataSource usersDataSource(Ref ref) {
  return FirebaseUsersDatasource(
    auth: FirebaseAuth.instance,
    firestore: FirebaseFirestore.instance,
  );
}

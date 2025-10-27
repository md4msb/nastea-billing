import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../data/data-source/auth_data_source.dart';
import '../../data/data-source/firebase_auth_data_source.dart';
import '../../data/repo/auth_repo_impl.dart';
import '../../domain/repositories/auth_repo.dart';

part 'injection.g.dart';

@Riverpod(keepAlive: true)
AuthRepo authRepository(Ref ref) {
  return AuthRepoImpl(authDataSource: ref.read(authDataSourceProvider));
}

@Riverpod(keepAlive: true)
AuthDataSource authDataSource(Ref ref) {
  return FirebaseAuthDataSource(
    firebaseAuth: FirebaseAuth.instance,
    firestore: FirebaseFirestore.instance,
  );
}

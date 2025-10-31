import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:nastea_billing/features/items/data/datasources/firebase_items_data_source.dart';
import 'package:nastea_billing/features/items/data/datasources/items_data_source.dart';
import 'package:nastea_billing/features/items/data/repository-impl/items_repo_impl.dart';
import 'package:nastea_billing/features/items/domain/repositories/items_repo.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'injection.g.dart';

@Riverpod(keepAlive: true)
ItemsRepo itemsRepo(Ref ref) {
  return ItemsRepoImpl(itemsDataSource: ref.read(itemsDataSourceProvider));
}

@Riverpod(keepAlive: true)
ItemsDataSource itemsDataSource(Ref ref) {
  return FirebaseItemsDataSource(
    firestore: FirebaseFirestore.instance,
    auth: FirebaseAuth.instance,
  );
}

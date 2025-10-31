import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:nastea_billing/features/items/data/models/item_model.dart';
import 'package:nastea_billing/features/items/domain/entities/item_entity.dart';
import 'items_data_source.dart';

class FirebaseItemsDataSource implements ItemsDataSource {
  final FirebaseFirestore _firestore;
  final FirebaseAuth _auth;

  const FirebaseItemsDataSource({
    required FirebaseFirestore firestore,
    required FirebaseAuth auth,
  }) : _firestore = firestore,
       _auth = auth;

  String? get _userId => _auth.currentUser?.uid;

  CollectionReference<Map<String, dynamic>> get _itemsCollection =>
      _firestore.collection('items');

  @override
  Future<List<ItemModel>> getItemsList() async {
    try {
      if (_userId == null) throw Exception('User not authenticated');
      final snapshot = await _itemsCollection.get();
      return snapshot.docs
          .map((doc) => ItemModel.fromJson(doc.data()))
          .toList();
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> createItem(ItemEntity item) async {
    try {
      if (_userId == null) throw Exception('User not authenticated');
      final itemModel = ItemModel.fromEntity(item);
      await _itemsCollection.doc(itemModel.id).set(itemModel.toJson());
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> updateItem(ItemEntity item) {
    // TODO: implement updateItem
    throw UnimplementedError();
  }

  @override
  Future<void> deleteItem(String id) {
    // TODO: implement deleteItem
    throw UnimplementedError();
  }
}

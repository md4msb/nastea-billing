import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:uuid/uuid.dart';
import '../../models/bill/bill_model.dart';
import '../../../items/data/models/item/item_model.dart';

part 'bills_provider.g.dart';

@Riverpod(keepAlive: true)
class BillNotifier extends _$BillNotifier {
  final uuid = Uuid(); 

  @override
  List<BillModel> build() {
    return [];
  }

  void createBill({
    required String shopName,
    required String location,
    required String contact,
    required String phone,
    required String createdBy,
    required List<Item> items,
    required double totalAmount,
  }) {
    final newBill = BillModel(
      id: uuid.v4(),
      shopName: shopName,
      location: location,
      contact: contact,
      phone: phone,
      createdBy: createdBy,
      createdAt: DateTime.now().toIso8601String(),
      items: items,
      totalAmount: totalAmount,
    );
    state = [...state, newBill];
  } 


}
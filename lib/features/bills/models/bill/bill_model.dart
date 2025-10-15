import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../items/data/models/item/item_model.dart';

part 'bill_model.freezed.dart';
part 'bill_model.g.dart';

@freezed
abstract class BillModel with _$BillModel {
  const factory BillModel({
    required String id,
    required String shopName,
    required String location,
    required String contact,
    required String phone,
    required String createdBy,
    required String createdAt,
    required List<Item> items,
    required double totalAmount,
  }) = _BillModel;

  factory BillModel.fromJson(Map<String, dynamic> json) => _$BillModelFromJson(json);
}
import 'package:json_annotation/json_annotation.dart';
import 'package:orders_presention/core/fuctions/clean_price.dart';
import 'package:orders_presention/core/fuctions/string_date_converter.dart';
import 'package:orders_presention/features/orders/domain/entities/order_entity.dart';

part 'order_model.g.dart';

@JsonSerializable()
class OrderModel extends OrderEntity {
  // @override
  // final String id;
  // @override
  // final bool isActive;
  // @override
  // @CleanPriceConverter()
  // final double price;
  // @override
  // final String company;
  // @override
  // final String buyer;
  // @override
  // final String status;
  // @override
  // @StringDateConverter()
  // final DateTime registered;

  OrderModel({
    required super.id,
    required super.isActive,
    required super.price,
    required super.company,
    required super.buyer,
    required super.status,
    required super.registered,
  });
  factory OrderModel.fromJson(Map<String, dynamic> json) =>
      _$OrderModelFromJson(json);

  Map<String, dynamic> toJson() => _$OrderModelToJson(this);
}

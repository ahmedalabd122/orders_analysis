import 'package:orders_presention/features/orders/data/models/order_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'orders_response_model.g.dart';

@JsonSerializable()
class OrdersResponseModel {
  final List<OrderModel> orders;
  OrdersResponseModel({required this.orders});

  factory OrdersResponseModel.fromJson(Map<String, dynamic> json) =>
      _$OrdersResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$OrdersResponseModelToJson(this);
}

import 'package:orders_presention/core/fuctions/clean_price.dart';
import 'package:orders_presention/core/fuctions/string_date_converter.dart';

class OrderEntity {
  final String id;
  final bool isActive;
  @CleanPriceConverter()
  final double price;
  final String company;
  final String buyer;
  final String status;
  @StringDateConverter()
  final DateTime registered;

  OrderEntity({
    required this.id,
    required this.isActive,
    required this.price,
    required this.company,
    required this.buyer,
    required this.status,
    required this.registered,
  });
}

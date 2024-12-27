import 'package:orders_presention/features/orders/domain/entities/order_entity.dart';



abstract class OrdersRepository {
  Future<List<OrderEntity>> getOrders();
}

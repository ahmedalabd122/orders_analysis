import 'package:injectable/injectable.dart';
import 'package:orders_presention/features/orders/domain/entities/order_entity.dart';
import 'package:orders_presention/features/orders/domain/repositories/orders_repository.dart';

import '../datasources/orders_local_data_source.dart';

@Injectable(as: OrdersRepository)
class OrdersRepositoryImpl implements OrdersRepository {
  final OrdersLocalDataSource localDataSource;

  OrdersRepositoryImpl({required this.localDataSource});

  @override
  Future<List<OrderEntity>> getOrders() async {
    final response = await localDataSource.getOrders();
    return response.orders;
  }
}
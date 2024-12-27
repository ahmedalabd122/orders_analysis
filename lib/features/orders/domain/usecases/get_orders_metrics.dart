import 'package:easy_localization/easy_localization.dart';
import 'package:intl/intl.dart';
import 'package:orders_presention/features/orders/domain/entities/order_entity.dart';
import 'package:orders_presention/main.dart';

import '../repositories/orders_repository.dart';

class GetOrdersMetrics {
  final OrdersRepository repository;
  GetOrdersMetrics({required this.repository});

  Future<Map<String, dynamic>> call() async {
    final List<OrderEntity> orders = await repository.getOrders();

    final totalOrders = orders.length;
    final totalSales = orders.fold(0.0, (sum, order) => sum + order.price);
    final averageSales = totalSales / totalOrders;
    final returnsCount =
        orders.where((order) => order.status == 'RETURNED').length;

    final monthlyOrderCount = <String, int>{};
    orders.sort((a, b) => a.registered.compareTo(b.registered));
    for (var order in orders) {
      final month =
          '${order.registered.year}-${order.registered.month.toString().padLeft(2, '0')}';
      monthlyOrderCount[month] = (monthlyOrderCount[month] ?? 0) + 1;
    }

    return {
      'totalOrders': totalOrders,
      'averageSales': averageSales,
      'returnsCount': returnsCount,
      'monthlyOrderCount': monthlyOrderCount,
    };
  }
}

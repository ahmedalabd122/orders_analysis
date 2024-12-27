import 'dart:convert';
import 'dart:developer';
import 'package:flutter/services.dart';
import 'package:injectable/injectable.dart';
import 'package:orders_presention/features/orders/data/models/orders_response_model.dart';

abstract class OrdersLocalDataSource {
  Future<OrdersResponseModel> getOrders();
}

@Injectable(as: OrdersLocalDataSource)
class OrdersLocalDataSourceImpl implements OrdersLocalDataSource {
  @override
  Future<OrdersResponseModel> getOrders() async {
    try {
      final jsonString = await rootBundle.loadString('assets/orders.json');
      final jsonData = json.decode(jsonString);
      await Future.delayed(const Duration(seconds: 2));
      return OrdersResponseModel.fromJson(
          jsonData['data'] as Map<String, dynamic>);
    } catch (e) {
      log(e.toString());
      throw Exception(e);
    }
  }
}

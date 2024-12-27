part of 'orders_cubit.dart';

abstract class OrdersState extends Equatable {
  const OrdersState();

  @override
  List<Object> get props => [];
}

class OrdersInitial extends OrdersState {}

class OrdersLoading extends OrdersState {}

class OrdersLoaded extends OrdersState {
  final int totalOrders;
  final double averageSales;
  final int returnsCount;
  final Map<String, int> monthlyOrderCount;

  const OrdersLoaded({
    required this.totalOrders,
    required this.averageSales,
    required this.returnsCount,
    required this.monthlyOrderCount,
  });
}

class OrdersError extends OrdersState {
  final String message;

  const OrdersError(this.message);
}

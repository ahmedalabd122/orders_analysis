import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import '../../domain/usecases/get_orders_metrics.dart';

part 'orders_state.dart';

class OrdersCubit extends Cubit<OrdersState> {
  final GetOrdersMetrics getOrdersMetrics;

  OrdersCubit({required this.getOrdersMetrics}) : super(OrdersInitial());

  Future<void> loadOrders() async {
    emit(OrdersLoading());
    try {
      final metrics = await getOrdersMetrics();
      emit(OrdersLoaded(
        totalOrders: metrics['totalOrders'],
        averageSales: metrics['averageSales'],
        returnsCount: metrics['returnsCount'],
        monthlyOrderCount: metrics['monthlyOrderCount'],
      ));
    } catch (e) {
      emit(OrdersError(e.toString()));
    }
  }
}

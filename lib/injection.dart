import 'package:injectable/injectable.dart';
import 'package:get_it/get_it.dart';
import 'package:orders_presention/features/orders/domain/usecases/get_orders_metrics.dart';
import 'package:orders_presention/features/orders/presentation/cubit/orders_cubit.dart';
import 'package:orders_presention/injection.config.dart';

@module
abstract class AppModule {
  // Register blocs
  @injectable
  OrdersCubit get ordersCubit;

  // Register use cases
  @lazySingleton
  GetOrdersMetrics get getOrdersMetrics;
}


final getIT = GetIt.instance;

@InjectableInit()
Future<void> configureDependencies() async => getIT.init();
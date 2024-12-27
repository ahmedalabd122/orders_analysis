// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:orders_presention/features/orders/data/datasources/orders_local_data_source.dart'
    as _i825;
import 'package:orders_presention/features/orders/data/repositories/orders_repository.dart'
    as _i88;
import 'package:orders_presention/features/orders/domain/repositories/orders_repository.dart'
    as _i802;
import 'package:orders_presention/features/orders/domain/usecases/get_orders_metrics.dart'
    as _i952;
import 'package:orders_presention/features/orders/presentation/cubit/orders_cubit.dart'
    as _i606;
import 'package:orders_presention/injection.dart' as _i495;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final appModule = _$AppModule(this);
    gh.factory<_i825.OrdersLocalDataSource>(
        () => _i825.OrdersLocalDataSourceImpl());
    gh.factory<_i802.OrdersRepository>(() => _i88.OrdersRepositoryImpl(
        localDataSource: gh<_i825.OrdersLocalDataSource>()));
    gh.lazySingleton<_i952.GetOrdersMetrics>(() => appModule.getOrdersMetrics);
    gh.factory<_i606.OrdersCubit>(() => appModule.ordersCubit);
    return this;
  }
}

class _$AppModule extends _i495.AppModule {
  _$AppModule(this._getIt);

  final _i174.GetIt _getIt;

  @override
  _i952.GetOrdersMetrics get getOrdersMetrics =>
      _i952.GetOrdersMetrics(repository: _getIt<_i802.OrdersRepository>());

  @override
  _i606.OrdersCubit get ordersCubit =>
      _i606.OrdersCubit(getOrdersMetrics: _getIt<_i952.GetOrdersMetrics>());
}

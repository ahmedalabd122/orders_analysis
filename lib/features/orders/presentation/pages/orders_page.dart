// ignore_for_file: type_literal_in_constant_pattern

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:orders_presention/features/orders/presentation/widgets/data_card_widget.dart';
import '../cubit/orders_cubit.dart';
import '../widgets/graph_widget.dart';

class OrdersPage extends StatelessWidget {
  const OrdersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetIt.instance.get<OrdersCubit>()..loadOrders(),
      child: Scaffold(
        appBar: AppBar(
          title: Text('app_name'.tr()),
          actions: [
            Text('language'.tr()),
            IconButton(
              icon: Icon(Icons.language),
              onPressed: () {
                context.locale == Locale('en')
                    ? context.setLocale(
                        Locale('ar'),
                      )
                    : context.setLocale(
                        Locale('en'),
                      );
              },
            ),
          ],
        ),
        body: BlocBuilder<OrdersCubit, OrdersState>(
          builder: (context, state) {
            switch (state.runtimeType) {
              case OrdersLoading:
                return Center(
                  child: CircularProgressIndicator(),
                );
              case OrdersLoaded:
                final ordersLoadedState = state as OrdersLoaded;
                return Column(
                  spacing: 16,
                  children: [
                    Row(
                      children: [
                        DataCard(
                          value: state.totalOrders.toString(),
                          title: 'total_orders'.tr(),
                        ),
                        DataCard(
                          value: state.returnsCount.toString(),
                          title: 'returns_count'.tr(),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        DataCard(
                          value: "${state.averageSales.toStringAsFixed(2)}\$",
                          title: 'average_sales'.tr(),
                        ),
                        const Expanded(
                          child: SizedBox(),
                        )
                      ],
                    ),
                    Expanded(
                      child: GraphWidget(
                          monthlyOrderCount:
                              ordersLoadedState.monthlyOrderCount),
                    ),
                  ],
                );
              case OrdersError:
                final ordersErrorState = state as OrdersError;
                return Center(
                    child: Text('Error: ${ordersErrorState.message}'));
              default:
                return const Center(child: Text('No Data'));
            }
          },
        ),
      ),
    );
  }
}

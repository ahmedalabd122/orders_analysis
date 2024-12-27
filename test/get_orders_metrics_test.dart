import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:mockito/annotations.dart';
import 'package:orders_presention/features/orders/domain/entities/order_entity.dart';
import 'package:orders_presention/features/orders/domain/repositories/orders_repository.dart';
import 'package:orders_presention/features/orders/domain/usecases/get_orders_metrics.dart';

@GenerateMocks([OrdersRepository])
class MockOrdersRepository extends Mock implements OrdersRepository {
  @override
  Future<List<OrderEntity>> getOrders() {
    return super.noSuchMethod(
      Invocation.method(#getOrders, []),
      returnValue: Future.value(<OrderEntity>[]),
      returnValueForMissingStub: Future.value(<OrderEntity>[]),
    );
  }
}

void main() {
  late MockOrdersRepository mockRepository;
  late GetOrdersMetrics getOrdersMetrics;

  setUp(() {
    mockRepository = MockOrdersRepository();
    getOrdersMetrics = GetOrdersMetrics(repository: mockRepository);
  });

  test('should calculate order metrics correctly', () async {
    // Arrange
    final orders = [
      OrderEntity(
        id: '1',
        price: 100.0,
        status: 'DELIVERED',
        registered: DateTime(2023, 10, 1),
        isActive: true,
        company: 'Ahmed Corp',
        buyer: 'Ahemd Alabd',
      ),
      OrderEntity(
        id: '2',
        price: 200.0,
        status: 'RETURNED',
        registered: DateTime(2023, 10, 2),
        isActive: true,
        company: 'Ahmed Corp',
        buyer: 'Ahemd Alabd',
      ),
      OrderEntity(
        id: '3',
        price: 150.0,
        status: 'DELIVERED',
        registered: DateTime(2023, 11, 1),
        isActive: true,
        company: 'Ahmed Corp',
        buyer: 'Ahemd Alabd',
      ),
    ];

    when(mockRepository.getOrders()).thenAnswer((_) async => orders);

    // Act
    final metrics = await getOrdersMetrics.call();

    // Assert
    expect(metrics['totalOrders'], 3);
    expect(metrics['averageSales'], 150.0);
    expect(metrics['returnsCount'], 1);
    expect(metrics['monthlyOrderCount'], {
      '2023-10': 2,
      '2023-11': 1,
    });
  });
}

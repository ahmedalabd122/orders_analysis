# orders_analysis

A Flutter app to present some orders data

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started:

- [SDK:Flutter (Channel stable, 3.27.1, on macOS 14.4.1 23E224 darwin-arm64, locale en-EG) to run the app](https://docs.flutter.dev/get-started/install)

## Folder Structure

lib/
├── core/
│       ├──functions/
│   features/
│   │
│    Orders/
│    ├── data/
│    │   ├── datasources/
│    │   │   ├── orders_local_data_source.dart
│    │   ├── models/
│    │   │   ├── order_model.dart
│    │   ├── repositories/
│    │       ├── orders_repository_impl.dart
│    ├── domain/
│    │   ├── entities/
│    │   │   ├── order.dart
│    │   ├── repositories/
│    │   │   ├── orders_repository.dart
│    │   ├── usecases/
│    │       ├── get_orders_metrics.dart
│    ├── presentation/
│    │   ├── cubit/
│    │   │   ├── orders_cubit.dart
│    │   │   ├── orders_state.dart
│    │   ├── pages/
│    │   │   ├── orders_page.dart
│    │   ├── widgets/
│    │       ├── data_card_widget.dart
│    │       ├── graph_widget.dart
│
├──injection.dart
├──injection.config.dart
├──main.dart

test/
    ├── get_orders_metrics_test.dart

## Instructions

    - the app tested using Iphone 15 pro max with flutter 3.27.1
    - just upgrade flutter version or use FVM to switch to my version without destroying your machine
    - run and enjoy, you can change the language from the app bar and tha the app theme is depends on your systems theme
    - to run test go to test/get_orders_metrics_test.dart and run the tests
    
// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OrderModel _$OrderModelFromJson(Map<String, dynamic> json) => OrderModel(
      id: json['id'] as String,
      isActive: json['isActive'] as bool,
      price: const CleanPriceConverter().fromJson(json['price'] as String),
      company: json['company'] as String,
      buyer: json['buyer'] as String,
      status: json['status'] as String,
      registered:
          const StringDateConverter().fromJson(json['registered'] as String),
    );

Map<String, dynamic> _$OrderModelToJson(OrderModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'isActive': instance.isActive,
      'price': const CleanPriceConverter().toJson(instance.price),
      'company': instance.company,
      'buyer': instance.buyer,
      'status': instance.status,
      'registered': const StringDateConverter().toJson(instance.registered),
    };

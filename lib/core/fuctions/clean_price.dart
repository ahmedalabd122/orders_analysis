import 'package:json_annotation/json_annotation.dart';

class CleanPriceConverter implements JsonConverter<double, String> {
  const CleanPriceConverter();

  @override
  double fromJson(String json) {
    String cleanPrice = json.replaceAll(RegExp(r'[^0-9.]'), '');
    return double.parse(cleanPrice);
  }

  @override
  String toJson(double object) {
    return '\$$object';
  }
}

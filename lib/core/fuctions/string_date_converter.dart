import 'package:json_annotation/json_annotation.dart';

class StringDateConverter implements JsonConverter<DateTime, String> {
  const StringDateConverter();

  @override
  DateTime fromJson(String json) {
    return DateTime.parse(json.split('T').first);
  }

  @override
  String toJson(DateTime object) {
    return object.toIso8601String();
  }
}

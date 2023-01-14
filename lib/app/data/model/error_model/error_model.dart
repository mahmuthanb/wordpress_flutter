// Package imports:
import 'package:json_annotation/json_annotation.dart';

part 'error_model.g.dart';

@JsonSerializable()
class ErrorModel {
  String? error;
  int? status;
  List<String>? messages;
  String? timestamp;
  int? messageId;

  ErrorModel({
    this.error,
    this.status,
    this.messages,
    this.timestamp,
    this.messageId,
  });

  factory ErrorModel.fromJson(Map<String, dynamic> json) {
    return _$ErrorModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$ErrorModelToJson(this);
}

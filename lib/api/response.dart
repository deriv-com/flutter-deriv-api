import 'dart:convert';
import 'package:json_annotation/json_annotation.dart';

part 'response.g.dart';

/// Super-class of all requests
@JsonSerializable(nullable: false, fieldRename: FieldRename.snake)
class Response {
  /// Initializes
  Response({this.echoReq, this.error, this.msgType, this.reqId});

  /// Creates instance from JSON
  factory Response.fromJson(Map<String, dynamic> json) =>
      _$ResponseFromJson(json);

  /// Echo of the request made.
  Map<String, dynamic> echoReq;

  /// Error
  Map<String, dynamic> error;

  /// Action name of the request made.
  String msgType;

  /// [Optional] Used to map request to response.
  int reqId;

  /// Converts to JSON
  Map<String, dynamic> toJson() => _$ResponseToJson(this);
}

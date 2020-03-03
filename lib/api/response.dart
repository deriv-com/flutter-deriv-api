import 'dart:convert';
import 'package:json_annotation/json_annotation.dart';

part 'response.g.dart';

/// Super-class of all requests
@JsonSerializable(nullable: false, fieldRename: FieldRename.snake)
class Response {
  ///
  Response({this.reqId, this.echoReq, this.msgType, this.error});

  ///
  factory Response.fromJson(Map<String, dynamic> json) =>
      _$ResponseFromJson(json);

  ///
  Map<String, dynamic> toJson() => _$ResponseToJson(this);

  /// [Optional] Used to map request to response.
  int reqId;

  /// Echo of the request made.
  Map<String, dynamic> echoReq;

  /// Action name of the request made.
  String msgType;

  /// Error
  Map<String, dynamic> error;
}

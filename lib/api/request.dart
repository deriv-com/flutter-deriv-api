import 'dart:convert';
import 'package:json_annotation/json_annotation.dart';

part 'request.g.dart';

/// Super-class of all requests
@JsonSerializable(nullable: false, fieldRename: FieldRename.snake)
class Request {
  /// Initializes
  Request({this.passthrough, this.reqId});

  /// Creates instance from JSON
  factory Request.fromJson(Map<String, dynamic> json) =>
      _$RequestFromJson(json);

  /// [Optional] Used to pass data through the websocket, which may be
  /// retrieved via the `echo_req` output field.
  Map<String, dynamic> passthrough;

  /// [Optional] Used to map request to response.
  int reqId;

  /// Converts to JSON
  Map<String, dynamic> toJson() => _$RequestToJson(this);
}

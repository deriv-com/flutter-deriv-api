import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'request.g.dart';

/// Super class of all requests
@JsonSerializable(nullable: false, fieldRename: FieldRename.snake)
class Request extends Equatable {
  /// Initializes
  const Request({
    this.passthrough,
    this.reqId,
  });

  /// Creates an instance from json
  factory Request.fromJson(Map<String, dynamic> json) =>
      _$RequestFromJson(json);

  /// [Optional] Used to pass data through the websocket, which may be
  /// retrieved via the `echo_req` output field.
  final Map<String, dynamic> passthrough;

  /// [Optional] Used to map request to response.
  final int reqId;

  /// Converts to JSON
  Map<String, dynamic> toJson() => _$RequestToJson(this);

  /// Creates a copy of instance with given parameters
  Request copyWith({
    Map<String, dynamic> passthrough,
    int reqId,
  }) =>
      Request(
        passthrough: passthrough ?? this.passthrough,
        reqId: reqId ?? this.reqId,
      );

  /// Override equatable class
  @override
  List<Object> get props => null;
}

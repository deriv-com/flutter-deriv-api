import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'request.g.dart';

/// Super class of all requests
@JsonSerializable(nullable: false, fieldRename: FieldRename.snake)
class Request extends Equatable {
  /// Initializes
  const Request({
    this.reqId,
    this.passthrough,
  });

  /// Creates instance from JSON
  factory Request.fromJson(Map<String, dynamic> json) =>
      _$RequestFromJson(json);

  /// [Optional] Used to map request to response.
  final int reqId;

  /// [Optional] Used to pass data through the websocket, which may be
  /// retrieved via the `echo_req` output field.
  final Map<String, dynamic> passthrough;

  /// Converts to JSON
  Map<String, dynamic> toJson() => _$RequestToJson(this);

  /// Creates copy of instance with given parameters
  Request copyWith({
    int reqId,
    Map<String, dynamic> passthrough,
  }) =>
      Request(
        reqId: reqId ?? this.reqId,
        passthrough: passthrough ?? this.passthrough,
      );

  /// Override equatable class
  @override
  List<Object> get props => null;
}

import 'package:equatable/equatable.dart';

/// Super class of all requests.
class Request extends Equatable {
  /// Initializes.
  const Request({
    this.msgType,
    this.passthrough,
    this.reqId,
  });

  /// Generate an instance from JSON.
  factory Request.fromJson(Map<String, dynamic> json) => Request(
        passthrough: json['passthrough'] as Map<String, dynamic>?,
        reqId: json['req_id'] as int?,
      );

  /// Action name of this request.
  final String? msgType;

  /// [Optional] Used to pass data through the websocket, which may be
  /// retrieved via the `echo_req` output field.
  final Map<String, dynamic>? passthrough;

  /// [Optional] Used to map request to response.
  final int? reqId;

  /// Converts an instance to JSON.
  Map<String, dynamic> toJson() => <String, dynamic>{
        'passthrough': passthrough,
        'req_id': reqId,
      };

  /// Generate a copy of instance with given parameters.
  Request copyWith({
    Map<String, dynamic>? passthrough,
    int? reqId,
  }) =>
      Request(
        passthrough: passthrough ?? this.passthrough,
        reqId: reqId ?? this.reqId,
      );

  /// Override equatable class.
  @override
  List<Object> get props => <Object>[];
}

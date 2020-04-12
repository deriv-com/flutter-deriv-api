/// generated automatically from flutter_deriv_api|lib/api/ticks_send.json
import 'package:json_annotation/json_annotation.dart';

import 'request.dart';

part 'ticks_send.g.dart';

/// JSON conversion for 'ticks_send'
@JsonSerializable(nullable: false, fieldRename: FieldRename.snake)
class TicksRequest extends Request {
  /// Initialize TicksRequest
  TicksRequest({
    this.subscribe,
    this.ticks,
    int reqId,
    Map<String, dynamic> passthrough,
  }) : super(
          reqId: reqId,
          passthrough: passthrough,
        );

  /// Creates instance from JSON
  factory TicksRequest.fromJson(Map<String, dynamic> json) =>
      _$TicksRequestFromJson(json);

  // Properties
  /// [Optional] If set to 1, will send updates whenever a new tick is received.
  final int subscribe;

  /// The short symbol name or array of symbols (obtained from `active_symbols` call).
  final String ticks;

  /// Converts to JSON
  @override
  Map<String, dynamic> toJson() => _$TicksRequestToJson(this);

  /// Creates copy of instance with given parameters
  @override
  TicksRequest copyWith({
    int subscribe,
    String ticks,
    int reqId,
    Map<String, dynamic> passthrough,
  }) =>
      TicksRequest(
        subscribe: subscribe ?? this.subscribe,
        ticks: ticks ?? this.ticks,
        reqId: reqId ?? this.reqId,
        passthrough: passthrough ?? this.passthrough,
      );
}

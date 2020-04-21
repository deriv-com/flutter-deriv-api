/// generated automatically from flutter_deriv_api|lib/basic_api/generated/ticks_send.json
import 'package:json_annotation/json_annotation.dart';

import '../request.dart';

part 'ticks_send.g.dart';

/// JSON conversion for 'ticks_send'
@JsonSerializable(nullable: false, fieldRename: FieldRename.snake)
class TicksRequest extends Request {
  /// Initialize TicksRequest
  const TicksRequest({
    this.subscribe,
    this.ticks,
    Map<String, dynamic> passthrough,
    int reqId,
  }) : super(
          passthrough: passthrough,
          reqId: reqId,
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
    Map<String, dynamic> passthrough,
    int reqId,
  }) =>
      TicksRequest(
        subscribe: subscribe ?? this.subscribe,
        ticks: ticks ?? this.ticks,
        passthrough: passthrough ?? this.passthrough,
        reqId: reqId ?? this.reqId,
      );

  /// Override equatable class
  @override
  List<Object> get props => <Object>[ticks];
}

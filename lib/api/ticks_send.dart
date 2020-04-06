/// Autogenerated from flutter_deriv_api|lib/api/ticks_send.json
import 'dart:async';
import 'dart:convert';
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
    Map<String, dynamic> passthrough,
    int reqId,
  }) : super(
          msgType: 'ticks',
          passthrough: passthrough,
          reqId: reqId,
        );

  /// Creates instance from JSON
  factory TicksRequest.fromJson(Map<String, dynamic> json) =>
      _$TicksRequestFromJson(json);

  // Properties
  /// [Optional] If set to 1, will send updates whenever a new tick is received.
  int subscribe;

  /// The short symbol name or array of symbols (obtained from active_symbols call).
  String ticks;

  /// Converts to JSON
  @override
  Map<String, dynamic> toJson() => _$TicksRequestToJson(this);
}

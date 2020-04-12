/// generated automatically from flutter_deriv_api|lib/api/cancel_receive.json
import 'package:json_annotation/json_annotation.dart';

import 'response.dart';

part 'cancel_receive.g.dart';

/// JSON conversion for 'cancel_receive'
@JsonSerializable(nullable: false, fieldRename: FieldRename.snake)
class CancelResponse extends Response {
  /// Initialize CancelResponse
  const CancelResponse({
    this.cancel,
    int reqId,
    String msgType,
    Map<String, dynamic> echoReq,
    Map<String, dynamic> error,
  }) : super(
          reqId: reqId,
          msgType: msgType,
          echoReq: echoReq,
          error: error,
        );

  /// Creates instance from JSON
  factory CancelResponse.fromJson(Map<String, dynamic> json) =>
      _$CancelResponseFromJson(json);

  // Properties
  /// Receipt for the transaction
  final Map<String, dynamic> cancel;

  /// Converts to JSON
  @override
  Map<String, dynamic> toJson() => _$CancelResponseToJson(this);

  /// Creates copy of instance with given parameters
  @override
  CancelResponse copyWith({
    Map<String, dynamic> cancel,
    int reqId,
    String msgType,
    Map<String, dynamic> echoReq,
    Map<String, dynamic> error,
  }) =>
      CancelResponse(
        cancel: cancel ?? this.cancel,
        reqId: reqId ?? this.reqId,
        msgType: msgType ?? this.msgType,
        echoReq: echoReq ?? this.echoReq,
        error: error ?? this.error,
      );

  /// Override equatable class
  @override
  List<Object> get props => null;
}

/// Generated automatically from flutter_deriv_api|lib/basic_api/generated/cancel_receive.json
import 'package:json_annotation/json_annotation.dart';

import '../response.dart';

part 'cancel_receive.g.dart';

/// JSON conversion for 'cancel_receive'
@JsonSerializable(nullable: true, fieldRename: FieldRename.snake)
class CancelResponse extends Response {
  /// Initialize CancelResponse
  const CancelResponse({
    this.cancel,
    Map<String, dynamic> echoReq,
    Map<String, dynamic> error,
    String msgType,
    int reqId,
  }) : super(
          echoReq: echoReq,
          error: error,
          msgType: msgType,
          reqId: reqId,
        );

  /// Creates an instance from JSON
  factory CancelResponse.fromJson(Map<String, dynamic> json) =>
      _$CancelResponseFromJson(json);

  /// Receipt for the transaction
  final Map<String, dynamic> cancel;

  /// Converts an instance to JSON
  @override
  Map<String, dynamic> toJson() => _$CancelResponseToJson(this);

  /// Creates a copy of instance with given parameters
  @override
  CancelResponse copyWith({
    Map<String, dynamic> cancel,
    Map<String, dynamic> echoReq,
    Map<String, dynamic> error,
    String msgType,
    int reqId,
  }) =>
      CancelResponse(
        cancel: cancel ?? this.cancel,
        echoReq: echoReq ?? this.echoReq,
        error: error ?? this.error,
        msgType: msgType ?? this.msgType,
        reqId: reqId ?? this.reqId,
      );

  /// Override equatable class
  @override
  List<Object> get props => null;
}

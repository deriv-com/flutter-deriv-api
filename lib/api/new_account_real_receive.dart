/// generated automatically from flutter_deriv_api|lib/api/new_account_real_receive.json
import 'package:json_annotation/json_annotation.dart';

import 'response.dart';

part 'new_account_real_receive.g.dart';

/// JSON conversion for 'new_account_real_receive'
@JsonSerializable(nullable: false, fieldRename: FieldRename.snake)
class NewAccountRealResponse extends Response {
  /// Initialize NewAccountRealResponse
  NewAccountRealResponse({
    this.newAccountReal,
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
  factory NewAccountRealResponse.fromJson(Map<String, dynamic> json) =>
      _$NewAccountRealResponseFromJson(json);

  // Properties
  /// New real money account details
  final Map<String, dynamic> newAccountReal;

  /// Converts to JSON
  @override
  Map<String, dynamic> toJson() => _$NewAccountRealResponseToJson(this);

  /// Creates copy of instance with given parameters
  @override
  NewAccountRealResponse copyWith({
    Map<String, dynamic> newAccountReal,
    int reqId,
    String msgType,
    Map<String, dynamic> echoReq,
    Map<String, dynamic> error,
  }) =>
      NewAccountRealResponse(
        newAccountReal: newAccountReal ?? this.newAccountReal,
        reqId: reqId ?? this.reqId,
        msgType: msgType ?? this.msgType,
        echoReq: echoReq ?? this.echoReq,
        error: error ?? this.error,
      );
}

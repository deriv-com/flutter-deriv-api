/// generated automatically from flutter_deriv_api|lib/basic_api/generated/new_account_real_receive.json
import 'package:json_annotation/json_annotation.dart';

import '../response.dart';

part 'new_account_real_receive.g.dart';

/// JSON conversion for 'new_account_real_receive'
@JsonSerializable(nullable: false, fieldRename: FieldRename.snake)
class NewAccountRealResponse extends Response {
  /// Initialize NewAccountRealResponse
  const NewAccountRealResponse({
    this.newAccountReal,
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

  /// Creates an instance from json
  factory NewAccountRealResponse.fromJson(Map<String, dynamic> json) =>
      _$NewAccountRealResponseFromJson(json);

  // Properties
  /// New real money account details
  final Map<String, dynamic> newAccountReal;

  /// Converts an instance to json
  @override
  Map<String, dynamic> toJson() => _$NewAccountRealResponseToJson(this);

  /// Creates a copy of instance with given parameters
  @override
  NewAccountRealResponse copyWith({
    Map<String, dynamic> newAccountReal,
    Map<String, dynamic> echoReq,
    Map<String, dynamic> error,
    String msgType,
    int reqId,
  }) =>
      NewAccountRealResponse(
        newAccountReal: newAccountReal ?? this.newAccountReal,
        echoReq: echoReq ?? this.echoReq,
        error: error ?? this.error,
        msgType: msgType ?? this.msgType,
        reqId: reqId ?? this.reqId,
      );

  /// Override equatable class
  @override
  List<Object> get props => null;
}

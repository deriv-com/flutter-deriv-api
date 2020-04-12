/// generated automatically from flutter_deriv_api|lib/api/new_account_maltainvest_receive.json
import 'package:json_annotation/json_annotation.dart';

import 'response.dart';

part 'new_account_maltainvest_receive.g.dart';

/// JSON conversion for 'new_account_maltainvest_receive'
@JsonSerializable(nullable: false, fieldRename: FieldRename.snake)
class NewAccountMaltainvestResponse extends Response {
  /// Initialize NewAccountMaltainvestResponse
  const NewAccountMaltainvestResponse({
    this.newAccountMaltainvest,
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
  factory NewAccountMaltainvestResponse.fromJson(Map<String, dynamic> json) =>
      _$NewAccountMaltainvestResponseFromJson(json);

  // Properties
  /// New `maltainvest` account details
  final Map<String, dynamic> newAccountMaltainvest;

  /// Converts to JSON
  @override
  Map<String, dynamic> toJson() => _$NewAccountMaltainvestResponseToJson(this);

  /// Creates copy of instance with given parameters
  @override
  NewAccountMaltainvestResponse copyWith({
    Map<String, dynamic> newAccountMaltainvest,
    int reqId,
    String msgType,
    Map<String, dynamic> echoReq,
    Map<String, dynamic> error,
  }) =>
      NewAccountMaltainvestResponse(
        newAccountMaltainvest:
            newAccountMaltainvest ?? this.newAccountMaltainvest,
        reqId: reqId ?? this.reqId,
        msgType: msgType ?? this.msgType,
        echoReq: echoReq ?? this.echoReq,
        error: error ?? this.error,
      );

  /// Override equatable class
  @override
  List<Object> get props => <Object>[];
}

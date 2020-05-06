/// generated automatically from flutter_deriv_api|lib/basic_api/generated/new_account_maltainvest_receive.json
import 'package:json_annotation/json_annotation.dart';

import '../response.dart';

part 'new_account_maltainvest_receive.g.dart';

/// JSON conversion for 'new_account_maltainvest_receive'
@JsonSerializable(nullable: false, fieldRename: FieldRename.snake)
class NewAccountMaltainvestResponse extends Response {
  /// Initialize NewAccountMaltainvestResponse
  const NewAccountMaltainvestResponse({
    this.newAccountMaltainvest,
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
  factory NewAccountMaltainvestResponse.fromJson(Map<String, dynamic> json) =>
      _$NewAccountMaltainvestResponseFromJson(json);

  // Properties
  /// New `maltainvest` account details
  final Map<String, dynamic> newAccountMaltainvest;

  /// Converts an instance to JSON
  @override
  Map<String, dynamic> toJson() => _$NewAccountMaltainvestResponseToJson(this);

  /// Creates a copy of instance with given parameters
  @override
  NewAccountMaltainvestResponse copyWith({
    Map<String, dynamic> newAccountMaltainvest,
    Map<String, dynamic> echoReq,
    Map<String, dynamic> error,
    String msgType,
    int reqId,
  }) =>
      NewAccountMaltainvestResponse(
        newAccountMaltainvest:
            newAccountMaltainvest ?? this.newAccountMaltainvest,
        echoReq: echoReq ?? this.echoReq,
        error: error ?? this.error,
        msgType: msgType ?? this.msgType,
        reqId: reqId ?? this.reqId,
      );

  /// Override equatable class
  @override
  List<Object> get props => null;
}

/// generated automatically from flutter_deriv_api|lib/api/get_account_status_receive.json
import 'package:json_annotation/json_annotation.dart';

import 'response.dart';

part 'get_account_status_receive.g.dart';

/// JSON conversion for 'get_account_status_receive'
@JsonSerializable(nullable: false, fieldRename: FieldRename.snake)
class GetAccountStatusResponse extends Response {
  /// Initialize GetAccountStatusResponse
  const GetAccountStatusResponse({
    this.getAccountStatus,
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

  /// Creates instance from JSON
  factory GetAccountStatusResponse.fromJson(Map<String, dynamic> json) =>
      _$GetAccountStatusResponseFromJson(json);

  // Properties
  /// Account status details
  final Map<String, dynamic> getAccountStatus;

  /// Converts to JSON
  @override
  Map<String, dynamic> toJson() => _$GetAccountStatusResponseToJson(this);

  /// Creates copy of instance with given parameters
  @override
  GetAccountStatusResponse copyWith({
    Map<String, dynamic> getAccountStatus,
    Map<String, dynamic> echoReq,
    Map<String, dynamic> error,
    String msgType,
    int reqId,
  }) =>
      GetAccountStatusResponse(
        getAccountStatus: getAccountStatus ?? this.getAccountStatus,
        echoReq: echoReq ?? this.echoReq,
        error: error ?? this.error,
        msgType: msgType ?? this.msgType,
        reqId: reqId ?? this.reqId,
      );

  /// Override equatable class
  @override
  List<Object> get props => null;
}

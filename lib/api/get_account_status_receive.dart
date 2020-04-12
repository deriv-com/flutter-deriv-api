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
    int reqId,
    String msgType,
    Map<String, dynamic> echoReq,
    Map<String, dynamic> error,
  }) =>
      GetAccountStatusResponse(
        getAccountStatus: getAccountStatus ?? this.getAccountStatus,
        reqId: reqId ?? this.reqId,
        msgType: msgType ?? this.msgType,
        echoReq: echoReq ?? this.echoReq,
        error: error ?? this.error,
      );

  /// Override equatable class
  @override
  List<Object> get props => null;
}

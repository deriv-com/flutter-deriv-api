/// generated automatically from flutter_deriv_api|lib/api/account_statistics_receive.json
import 'package:json_annotation/json_annotation.dart';

import 'response.dart';

part 'account_statistics_receive.g.dart';

/// JSON conversion for 'account_statistics_receive'
@JsonSerializable(nullable: false, fieldRename: FieldRename.snake)
class AccountStatisticsResponse extends Response {
  /// Initialize AccountStatisticsResponse
  const AccountStatisticsResponse({
    this.accountStatistics,
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
  factory AccountStatisticsResponse.fromJson(Map<String, dynamic> json) =>
      _$AccountStatisticsResponseFromJson(json);

  // Properties
  /// Response of account statistics
  final Map<String, dynamic> accountStatistics;

  /// Converts to JSON
  @override
  Map<String, dynamic> toJson() => _$AccountStatisticsResponseToJson(this);

  /// Creates copy of instance with given parameters
  @override
  AccountStatisticsResponse copyWith({
    Map<String, dynamic> accountStatistics,
    Map<String, dynamic> echoReq,
    Map<String, dynamic> error,
    String msgType,
    int reqId,
  }) =>
      AccountStatisticsResponse(
        accountStatistics: accountStatistics ?? this.accountStatistics,
        echoReq: echoReq ?? this.echoReq,
        error: error ?? this.error,
        msgType: msgType ?? this.msgType,
        reqId: reqId ?? this.reqId,
      );

  /// Override equatable class
  @override
  List<Object> get props => null;
}

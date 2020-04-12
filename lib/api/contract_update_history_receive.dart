/// generated automatically from flutter_deriv_api|lib/api/contract_update_history_receive.json
import 'package:json_annotation/json_annotation.dart';

import 'response.dart';

part 'contract_update_history_receive.g.dart';

/// JSON conversion for 'contract_update_history_receive'
@JsonSerializable(nullable: false, fieldRename: FieldRename.snake)
class ContractUpdateHistoryResponse extends Response {
  /// Initialize ContractUpdateHistoryResponse
  ContractUpdateHistoryResponse({
    this.contractUpdateHistory,
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
  factory ContractUpdateHistoryResponse.fromJson(Map<String, dynamic> json) =>
      _$ContractUpdateHistoryResponseFromJson(json);

  // Properties
  /// Contains the historical and the most recent update status of the contract
  final List<String> contractUpdateHistory;

  /// Converts to JSON
  @override
  Map<String, dynamic> toJson() => _$ContractUpdateHistoryResponseToJson(this);

  /// Creates copy of instance with given parameters
  @override
  ContractUpdateHistoryResponse copyWith({
    List<String> contractUpdateHistory,
    int reqId,
    String msgType,
    Map<String, dynamic> echoReq,
    Map<String, dynamic> error,
  }) =>
      ContractUpdateHistoryResponse(
        contractUpdateHistory:
            contractUpdateHistory ?? this.contractUpdateHistory,
        reqId: reqId ?? this.reqId,
        msgType: msgType ?? this.msgType,
        echoReq: echoReq ?? this.echoReq,
        error: error ?? this.error,
      );
}

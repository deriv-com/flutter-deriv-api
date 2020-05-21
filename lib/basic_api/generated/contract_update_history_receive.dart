/// Generated automatically from flutter_deriv_api|lib/basic_api/generated/contract_update_history_receive.json
import 'package:json_annotation/json_annotation.dart';

import '../response.dart';

part 'contract_update_history_receive.g.dart';

/// JSON conversion for 'contract_update_history_receive'
@JsonSerializable(nullable: false, fieldRename: FieldRename.snake)
class ContractUpdateHistoryResponse extends Response {
  /// Initialize ContractUpdateHistoryResponse
  const ContractUpdateHistoryResponse({
    this.contractUpdateHistory,
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
  factory ContractUpdateHistoryResponse.fromJson(Map<String, dynamic> json) =>
      _$ContractUpdateHistoryResponseFromJson(json);

  /// Contains the historical and the most recent update status of the contract
  final List<Map<String, dynamic>> contractUpdateHistory;

  /// Converts an instance to JSON
  @override
  Map<String, dynamic> toJson() => _$ContractUpdateHistoryResponseToJson(this);

  /// Creates a copy of instance with given parameters
  @override
  ContractUpdateHistoryResponse copyWith({
    List<Map<String, dynamic>> contractUpdateHistory,
    Map<String, dynamic> echoReq,
    Map<String, dynamic> error,
    String msgType,
    int reqId,
  }) =>
      ContractUpdateHistoryResponse(
        contractUpdateHistory:
            contractUpdateHistory ?? this.contractUpdateHistory,
        echoReq: echoReq ?? this.echoReq,
        error: error ?? this.error,
        msgType: msgType ?? this.msgType,
        reqId: reqId ?? this.reqId,
      );

  /// Override equatable class
  @override
  List<Object> get props => null;
}

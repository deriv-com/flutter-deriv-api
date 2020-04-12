/// generated automatically from flutter_deriv_api|lib/api/contract_update_history_send.json
import 'package:json_annotation/json_annotation.dart';

import 'request.dart';

part 'contract_update_history_send.g.dart';

/// JSON conversion for 'contract_update_history_send'
@JsonSerializable(nullable: false, fieldRename: FieldRename.snake)
class ContractUpdateHistoryRequest extends Request {
  /// Initialize ContractUpdateHistoryRequest
  const ContractUpdateHistoryRequest({
    this.contractId,
    this.contractUpdateHistory = 1,
    int reqId,
    Map<String, dynamic> passthrough,
  }) : super(
          reqId: reqId,
          passthrough: passthrough,
        );

  /// Creates instance from JSON
  factory ContractUpdateHistoryRequest.fromJson(Map<String, dynamic> json) =>
      _$ContractUpdateHistoryRequestFromJson(json);

  // Properties
  /// Internal unique contract identifier.
  final int contractId;

  /// Must be `1`
  final int contractUpdateHistory;

  /// Converts to JSON
  @override
  Map<String, dynamic> toJson() => _$ContractUpdateHistoryRequestToJson(this);

  /// Creates copy of instance with given parameters
  @override
  ContractUpdateHistoryRequest copyWith({
    int contractId,
    int contractUpdateHistory,
    int reqId,
    Map<String, dynamic> passthrough,
  }) =>
      ContractUpdateHistoryRequest(
        contractId: contractId ?? this.contractId,
        contractUpdateHistory:
            contractUpdateHistory ?? this.contractUpdateHistory,
        reqId: reqId ?? this.reqId,
        passthrough: passthrough ?? this.passthrough,
      );

  /// Override equatable class
  @override
  List<Object> get props => null;
}

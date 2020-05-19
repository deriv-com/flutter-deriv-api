/// generated automatically from flutter_deriv_api|lib/basic_api/generated/contract_update_history_send.json
import 'package:json_annotation/json_annotation.dart';

import '../request.dart';

part 'contract_update_history_send.g.dart';

/// JSON conversion for 'contract_update_history_send'
@JsonSerializable(nullable: true, fieldRename: FieldRename.snake)
class ContractUpdateHistoryRequest extends Request {
  /// Initialize ContractUpdateHistoryRequest
  const ContractUpdateHistoryRequest({
    this.contractId,
    this.contractUpdateHistory = 1,
    Map<String, dynamic> passthrough,
    int reqId,
  }) : super(
          msgType: 'contract_update_history',
          passthrough: passthrough,
          reqId: reqId,
        );

  /// Creates an instance from JSON
  factory ContractUpdateHistoryRequest.fromJson(Map<String, dynamic> json) =>
      _$ContractUpdateHistoryRequestFromJson(json);

  // Properties
  /// Internal unique contract identifier.
  final int contractId;

  /// Must be `1`
  final int contractUpdateHistory;

  /// Converts an instance to JSON
  @override
  Map<String, dynamic> toJson() => _$ContractUpdateHistoryRequestToJson(this);

  /// Creates a copy of instance with given parameters
  @override
  ContractUpdateHistoryRequest copyWith({
    int contractId,
    int contractUpdateHistory,
    Map<String, dynamic> passthrough,
    int reqId,
  }) =>
      ContractUpdateHistoryRequest(
        contractId: contractId ?? this.contractId,
        contractUpdateHistory:
            contractUpdateHistory ?? this.contractUpdateHistory,
        passthrough: passthrough ?? this.passthrough,
        reqId: reqId ?? this.reqId,
      );

  /// Override equatable class
  @override
  List<Object> get props => null;
}

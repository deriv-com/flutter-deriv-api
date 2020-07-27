/// Generated automatically from flutter_deriv_api|lib/basic_api/generated/contract_update_history_send.json
import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';

import '../request.dart';

part 'contract_update_history_send.g.dart';

/// JSON conversion for 'contract_update_history_send'
@JsonSerializable(nullable: true, fieldRename: FieldRename.snake)
class ContractUpdateHistoryRequest extends Request {
  /// Initialize ContractUpdateHistoryRequest
  const ContractUpdateHistoryRequest({
    @required this.contractId,
    this.contractUpdateHistory = 1,
    this.limit,
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

  /// Internal unique contract identifier.
  final int contractId;

  /// Must be `1`
  final int contractUpdateHistory;

  /// [Optional] Maximum number of historical updates to receive.
  final num limit;

  /// Converts an instance to JSON
  @override
  Map<String, dynamic> toJson() => _$ContractUpdateHistoryRequestToJson(this);

  /// Creates a copy of instance with given parameters
  @override
  ContractUpdateHistoryRequest copyWith({
    int contractId,
    int contractUpdateHistory,
    num limit,
    Map<String, dynamic> passthrough,
    int reqId,
  }) =>
      ContractUpdateHistoryRequest(
        contractId: contractId ?? this.contractId,
        contractUpdateHistory:
            contractUpdateHistory ?? this.contractUpdateHistory,
        limit: limit ?? this.limit,
        passthrough: passthrough ?? this.passthrough,
        reqId: reqId ?? this.reqId,
      );

  /// Override equatable class
  @override
  List<Object> get props => null;
}

/// generated automatically from flutter_deriv_api|lib/api/contract_update_send.json
import 'package:json_annotation/json_annotation.dart';

import 'request.dart';

part 'contract_update_send.g.dart';

/// JSON conversion for 'contract_update_send'
@JsonSerializable(nullable: false, fieldRename: FieldRename.snake)
class ContractUpdateRequest extends Request {
  /// Initialize ContractUpdateRequest
  const ContractUpdateRequest({
    this.contractId,
    this.contractUpdate = 1,
    this.limitOrder,
    int reqId,
    Map<String, dynamic> passthrough,
  }) : super(
          reqId: reqId,
          passthrough: passthrough,
        );

  /// Creates instance from JSON
  factory ContractUpdateRequest.fromJson(Map<String, dynamic> json) =>
      _$ContractUpdateRequestFromJson(json);

  // Properties
  /// Internal unique contract identifier.
  final int contractId;

  /// Must be `1`
  final int contractUpdate;

  /// Specify limit order to update.
  final Map<String, dynamic> limitOrder;

  /// Converts to JSON
  @override
  Map<String, dynamic> toJson() => _$ContractUpdateRequestToJson(this);

  /// Creates copy of instance with given parameters
  @override
  ContractUpdateRequest copyWith({
    int contractId,
    int contractUpdate,
    Map<String, dynamic> limitOrder,
    int reqId,
    Map<String, dynamic> passthrough,
  }) =>
      ContractUpdateRequest(
        contractId: contractId ?? this.contractId,
        contractUpdate: contractUpdate ?? this.contractUpdate,
        limitOrder: limitOrder ?? this.limitOrder,
        reqId: reqId ?? this.reqId,
        passthrough: passthrough ?? this.passthrough,
      );

  /// Override equatable class
  @override
  List<Object> get props => <Object>[];
}

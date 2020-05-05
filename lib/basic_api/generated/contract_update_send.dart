/// generated automatically from flutter_deriv_api|lib/basic_api/generated/contract_update_send.json
import 'package:json_annotation/json_annotation.dart';

import '../request.dart';

part 'contract_update_send.g.dart';

/// JSON conversion for 'contract_update_send'
@JsonSerializable(nullable: false, fieldRename: FieldRename.snake)
class ContractUpdateRequest extends Request {
  /// Initialize ContractUpdateRequest
  const ContractUpdateRequest({
    this.contractId,
    this.contractUpdate = 1,
    this.limitOrder,
    Map<String, dynamic> passthrough,
    int reqId,
  }) : super(
          msgType: 'contract_update',
          passthrough: passthrough,
          reqId: reqId,
        );

  /// Creates an instance from json
  factory ContractUpdateRequest.fromJson(Map<String, dynamic> json) =>
      _$ContractUpdateRequestFromJson(json);

  // Properties
  /// Internal unique contract identifier.
  final int contractId;

  /// Must be `1`
  final int contractUpdate;

  /// Specify limit order to update.
  final Map<String, dynamic> limitOrder;

  /// Converts an instance to json
  @override
  Map<String, dynamic> toJson() => _$ContractUpdateRequestToJson(this);

  /// Creates a copy of instance with given parameters
  @override
  ContractUpdateRequest copyWith({
    int contractId,
    int contractUpdate,
    Map<String, dynamic> limitOrder,
    Map<String, dynamic> passthrough,
    int reqId,
  }) =>
      ContractUpdateRequest(
        contractId: contractId ?? this.contractId,
        contractUpdate: contractUpdate ?? this.contractUpdate,
        limitOrder: limitOrder ?? this.limitOrder,
        passthrough: passthrough ?? this.passthrough,
        reqId: reqId ?? this.reqId,
      );

  /// Override equatable class
  @override
  List<Object> get props => null;
}

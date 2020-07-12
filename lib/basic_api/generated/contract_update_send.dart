/// Generated automatically from flutter_deriv_api|lib/basic_api/generated/contract_update_send.json

import 'package:meta/meta.dart';

import '../request.dart';

/// ContractUpdateRequest class
class ContractUpdateRequest extends Request {
  /// Initialize ContractUpdateRequest
  const ContractUpdateRequest({
    @required this.contractId,
    this.contractUpdate = 1,
    @required this.limitOrder,
    Map<String, dynamic> passthrough,
    int reqId,
  }) : super(
          msgType: 'contract_update',
          passthrough: passthrough,
          reqId: reqId,
        );

  /// Creates an instance from JSON
  factory ContractUpdateRequest.fromJson(Map<String, dynamic> json) =>
      ContractUpdateRequest(
        // ignore: avoid_as
        contractId: json['contract_id'] as int,
        // ignore: avoid_as
        contractUpdate: json['contract_update'] as int,
        // ignore: avoid_as
        limitOrder: json['limit_order'] as Map<String, dynamic>,
        // ignore: avoid_as
        passthrough: json['passthrough'] as Map<String, dynamic>,
        // ignore: avoid_as
        reqId: json['req_id'] as int,
      );

  /// Internal unique contract identifier.
  final int contractId;

  /// Must be `1`
  final int contractUpdate;

  /// Specify limit order to update.
  final Map<String, dynamic> limitOrder;

  /// Converts an instance to JSON
  @override
  Map<String, dynamic> toJson() => <String, dynamic>{
        'contract_id': contractId,
        'contract_update': contractUpdate,
        'limit_order': limitOrder,
        'passthrough': passthrough,
        'req_id': reqId,
      };

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

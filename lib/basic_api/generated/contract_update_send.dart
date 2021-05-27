/// Generated automatically from flutter_deriv_api|lib/basic_api/generated/contract_update_send.json
// ignore_for_file: avoid_as
import 'package:meta/meta.dart';
import '../request.dart';

/// Contract update request class
class ContractUpdateRequest extends Request {
  /// Initialize ContractUpdateRequest
  const ContractUpdateRequest({
    @required this.contractId,
    this.contractUpdate = true,
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
        contractId: json['contract_id'] as int,
        contractUpdate: json['contract_update'] == null
            ? null
            : json['contract_update'] == 1,
        limitOrder: json['limit_order'] as Map<String, dynamic>,
        passthrough: json['passthrough'] as Map<String, dynamic>,
        reqId: json['req_id'] as int,
      );

  /// Internal unique contract identifier.
  final int contractId;

  /// Must be `true`
  final bool contractUpdate;

  /// Specify limit order to update.
  final Map<String, dynamic> limitOrder;

  /// Converts this instance to JSON
  @override
  Map<String, dynamic> toJson() => <String, dynamic>{
        'contract_id': contractId,
        'contract_update': contractUpdate == null
            ? null
            : contractUpdate
                ? 1
                : 0,
        'limit_order': limitOrder,
        'passthrough': passthrough,
        'req_id': reqId,
      };

  /// Creates a copy of instance with given parameters
  @override
  ContractUpdateRequest copyWith({
    int contractId,
    bool contractUpdate,
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

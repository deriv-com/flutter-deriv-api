/// Generated automatically from flutter_deriv_api|lib/basic_api/generated/contract_update_send.json.

// ignore_for_file: always_put_required_named_parameters_first

import '../request.dart';

/// Contract update request class.
class ContractUpdateRequest extends Request {
  /// Initialize ContractUpdateRequest.
  const ContractUpdateRequest({
    required this.contractId,
    this.contractUpdate = true,
    required this.limitOrder,
    this.loginid,
    super.msgType = 'contract_update',
    super.passthrough,
    super.reqId,
  });

  /// Creates an instance from JSON.
  factory ContractUpdateRequest.fromJson(Map<String, dynamic> json) =>
      ContractUpdateRequest(
        contractId: json['contract_id'] as int?,
        contractUpdate: json['contract_update'] == null
            ? null
            : json['contract_update'] == 1,
        limitOrder: json['limit_order'] as Map<String, dynamic>?,
        loginid: json['loginid'] as String?,
        passthrough: json['passthrough'] as Map<String, dynamic>?,
        reqId: json['req_id'] as int?,
      );

  /// Internal unique contract identifier.
  final int? contractId;

  /// Must be `true`
  final bool? contractUpdate;

  /// Specify limit order to update.
  final Map<String, dynamic>? limitOrder;

  /// [Optional] The login id of the user. If left unspecified, it defaults to the initial authorized token's login id.
  final String? loginid;

  /// Converts this instance to JSON
  @override
  Map<String, dynamic> toJson() => <String, dynamic>{
        'contract_id': contractId,
        'contract_update': contractUpdate == null
            ? null
            : contractUpdate!
                ? 1
                : 0,
        'limit_order': limitOrder,
        'loginid': loginid,
        'passthrough': passthrough,
        'req_id': reqId,
      };

  /// Creates a copy of instance with given parameters
  @override
  ContractUpdateRequest copyWith({
    int? contractId,
    bool? contractUpdate,
    Map<String, dynamic>? limitOrder,
    String? loginid,
    Map<String, dynamic>? passthrough,
    int? reqId,
  }) =>
      ContractUpdateRequest(
        contractId: contractId ?? this.contractId,
        contractUpdate: contractUpdate ?? this.contractUpdate,
        limitOrder: limitOrder ?? this.limitOrder,
        loginid: loginid ?? this.loginid,
        passthrough: passthrough ?? this.passthrough,
        reqId: reqId ?? this.reqId,
      );

  /// Override equatable class.
  @override
  List<Object?> get props => <Object?>[];
}

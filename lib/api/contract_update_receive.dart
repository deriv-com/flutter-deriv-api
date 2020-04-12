/// generated automatically from flutter_deriv_api|lib/api/contract_update_receive.json
import 'package:json_annotation/json_annotation.dart';

import 'response.dart';

part 'contract_update_receive.g.dart';

/// JSON conversion for 'contract_update_receive'
@JsonSerializable(nullable: false, fieldRename: FieldRename.snake)
class ContractUpdateResponse extends Response {
  /// Initialize ContractUpdateResponse
  ContractUpdateResponse({
    this.contractUpdate,
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
  factory ContractUpdateResponse.fromJson(Map<String, dynamic> json) =>
      _$ContractUpdateResponseFromJson(json);

  // Properties
  /// Contains the update status of the request
  final Map<String, dynamic> contractUpdate;

  /// Converts to JSON
  @override
  Map<String, dynamic> toJson() => _$ContractUpdateResponseToJson(this);

  /// Creates copy of instance with given parameters
  @override
  ContractUpdateResponse copyWith({
    Map<String, dynamic> contractUpdate,
    int reqId,
    String msgType,
    Map<String, dynamic> echoReq,
    Map<String, dynamic> error,
  }) =>
      ContractUpdateResponse(
        contractUpdate: contractUpdate ?? this.contractUpdate,
        reqId: reqId ?? this.reqId,
        msgType: msgType ?? this.msgType,
        echoReq: echoReq ?? this.echoReq,
        error: error ?? this.error,
      );
}

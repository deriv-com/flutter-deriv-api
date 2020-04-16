/// generated automatically from flutter_deriv_api|lib/api/contract_update_receive.json
import 'package:json_annotation/json_annotation.dart';

import 'response.dart';

part 'contract_update_receive.g.dart';

/// JSON conversion for 'contract_update_receive'
@JsonSerializable(nullable: false, fieldRename: FieldRename.snake)
class ContractUpdateResponse extends Response {
  /// Initialize ContractUpdateResponse
  const ContractUpdateResponse({
    this.contractUpdate,
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
    Map<String, dynamic> echoReq,
    Map<String, dynamic> error,
    String msgType,
    int reqId,
  }) =>
      ContractUpdateResponse(
        contractUpdate: contractUpdate ?? this.contractUpdate,
        echoReq: echoReq ?? this.echoReq,
        error: error ?? this.error,
        msgType: msgType ?? this.msgType,
        reqId: reqId ?? this.reqId,
      );

  /// Override equatable class
  @override
  List<Object> get props => null;
}

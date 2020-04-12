/// generated automatically from flutter_deriv_api|lib/api/contracts_for_receive.json
import 'package:json_annotation/json_annotation.dart';

import 'response.dart';

part 'contracts_for_receive.g.dart';

/// JSON conversion for 'contracts_for_receive'
@JsonSerializable(nullable: false, fieldRename: FieldRename.snake)
class ContractsForResponse extends Response {
  /// Initialize ContractsForResponse
  const ContractsForResponse({
    this.contractsFor,
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
  factory ContractsForResponse.fromJson(Map<String, dynamic> json) =>
      _$ContractsForResponseFromJson(json);

  // Properties
  /// List of available contracts. Note: if the user is authenticated, then only contracts allowed under his account will be returned.
  final Map<String, dynamic> contractsFor;

  /// Converts to JSON
  @override
  Map<String, dynamic> toJson() => _$ContractsForResponseToJson(this);

  /// Creates copy of instance with given parameters
  @override
  ContractsForResponse copyWith({
    Map<String, dynamic> contractsFor,
    int reqId,
    String msgType,
    Map<String, dynamic> echoReq,
    Map<String, dynamic> error,
  }) =>
      ContractsForResponse(
        contractsFor: contractsFor ?? this.contractsFor,
        reqId: reqId ?? this.reqId,
        msgType: msgType ?? this.msgType,
        echoReq: echoReq ?? this.echoReq,
        error: error ?? this.error,
      );

  /// Override equatable class
  @override
  List<Object> get props => <Object>[];
}

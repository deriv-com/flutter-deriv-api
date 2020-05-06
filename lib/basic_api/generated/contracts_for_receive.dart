/// generated automatically from flutter_deriv_api|lib/basic_api/generated/contracts_for_receive.json
import 'package:json_annotation/json_annotation.dart';

import '../response.dart';

part 'contracts_for_receive.g.dart';

/// JSON conversion for 'contracts_for_receive'
@JsonSerializable(nullable: false, fieldRename: FieldRename.snake)
class ContractsForResponse extends Response {
  /// Initialize ContractsForResponse
  const ContractsForResponse({
    this.contractsFor,
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

  /// Creates an instance from JSON
  factory ContractsForResponse.fromJson(Map<String, dynamic> json) =>
      _$ContractsForResponseFromJson(json);

  // Properties
  /// List of available contracts. Note: if the user is authenticated, then only contracts allowed under his account will be returned.
  final Map<String, dynamic> contractsFor;

  /// Converts an instance to JSON
  @override
  Map<String, dynamic> toJson() => _$ContractsForResponseToJson(this);

  /// Creates a copy of instance with given parameters
  @override
  ContractsForResponse copyWith({
    Map<String, dynamic> contractsFor,
    Map<String, dynamic> echoReq,
    Map<String, dynamic> error,
    String msgType,
    int reqId,
  }) =>
      ContractsForResponse(
        contractsFor: contractsFor ?? this.contractsFor,
        echoReq: echoReq ?? this.echoReq,
        error: error ?? this.error,
        msgType: msgType ?? this.msgType,
        reqId: reqId ?? this.reqId,
      );

  /// Override equatable class
  @override
  List<Object> get props => null;
}

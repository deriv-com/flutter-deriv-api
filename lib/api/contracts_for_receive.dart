/// Autogenerated from flutter_deriv_api|lib/api/contracts_for_receive.json
import 'dart:async';
import 'dart:convert';
import 'package:json_annotation/json_annotation.dart';
import 'response.dart';

part 'contracts_for_receive.g.dart';

/// JSON conversion for 'contracts_for_receive'
@JsonSerializable(nullable: false, fieldRename: FieldRename.snake)
class ContractsForResponse extends Response {
  /// Initialize ContractsForResponse
  ContractsForResponse(
      {this.contractsFor,
      Map<String, dynamic> echoReq,
      Map<String, dynamic> error,
      String msgType,
      int reqId})
      : super(echoReq: echoReq, error: error, msgType: msgType, reqId: reqId);

  /// Creates instance from JSON
  factory ContractsForResponse.fromJson(Map<String, dynamic> json) =>
      _$ContractsForResponseFromJson(json);

  // Properties
  /// List of available contracts. Note: if the user is authenticated, then only contracts allowed under his account will be returned.
  Map<String, dynamic> contractsFor;

  /// Converts to JSON
  @override
  Map<String, dynamic> toJson() => _$ContractsForResponseToJson(this);
}

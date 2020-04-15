/// generated automatically from flutter_deriv_api|lib/api/new_account_virtual_receive.json
import 'package:json_annotation/json_annotation.dart';

import 'response.dart';

part 'new_account_virtual_receive.g.dart';

/// JSON conversion for 'new_account_virtual_receive'
@JsonSerializable(nullable: false, fieldRename: FieldRename.snake)
class NewAccountVirtualResponse extends Response {
  /// Initialize NewAccountVirtualResponse
  const NewAccountVirtualResponse({
    this.newAccountVirtual,
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
  factory NewAccountVirtualResponse.fromJson(Map<String, dynamic> json) =>
      _$NewAccountVirtualResponseFromJson(json);

  // Properties
  /// New virtual-money account details
  final Map<String, dynamic> newAccountVirtual;

  /// Converts to JSON
  @override
  Map<String, dynamic> toJson() => _$NewAccountVirtualResponseToJson(this);

  /// Creates copy of instance with given parameters
  @override
  NewAccountVirtualResponse copyWith({
    Map<String, dynamic> newAccountVirtual,
    Map<String, dynamic> echoReq,
    Map<String, dynamic> error,
    String msgType,
    int reqId,
  }) =>
      NewAccountVirtualResponse(
        newAccountVirtual: newAccountVirtual ?? this.newAccountVirtual,
        echoReq: echoReq ?? this.echoReq,
        error: error ?? this.error,
        msgType: msgType ?? this.msgType,
        reqId: reqId ?? this.reqId,
      );

  /// Override equatable class
  @override
  List<Object> get props => null;
}

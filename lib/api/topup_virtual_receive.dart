/// generated automatically from flutter_deriv_api|lib/api/topup_virtual_receive.json
import 'package:json_annotation/json_annotation.dart';

import 'response.dart';

part 'topup_virtual_receive.g.dart';

/// JSON conversion for 'topup_virtual_receive'
@JsonSerializable(nullable: false, fieldRename: FieldRename.snake)
class TopupVirtualResponse extends Response {
  /// Initialize TopupVirtualResponse
  const TopupVirtualResponse({
    this.topupVirtual,
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
  factory TopupVirtualResponse.fromJson(Map<String, dynamic> json) =>
      _$TopupVirtualResponseFromJson(json);

  // Properties
  /// The information regarding a successful top up for a virtual money account
  final Map<String, dynamic> topupVirtual;

  /// Converts to JSON
  @override
  Map<String, dynamic> toJson() => _$TopupVirtualResponseToJson(this);

  /// Creates copy of instance with given parameters
  @override
  TopupVirtualResponse copyWith({
    Map<String, dynamic> topupVirtual,
    int reqId,
    String msgType,
    Map<String, dynamic> echoReq,
    Map<String, dynamic> error,
  }) =>
      TopupVirtualResponse(
        topupVirtual: topupVirtual ?? this.topupVirtual,
        reqId: reqId ?? this.reqId,
        msgType: msgType ?? this.msgType,
        echoReq: echoReq ?? this.echoReq,
        error: error ?? this.error,
      );

  /// Override equatable class
  @override
  List<Object> get props => <Object>[];
}

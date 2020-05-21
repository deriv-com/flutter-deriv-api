/// Generated automatically from flutter_deriv_api|lib/basic_api/generated/topup_virtual_receive.json
import 'package:json_annotation/json_annotation.dart';

import '../response.dart';

part 'topup_virtual_receive.g.dart';

/// JSON conversion for 'topup_virtual_receive'
@JsonSerializable(nullable: true, fieldRename: FieldRename.snake)
class TopupVirtualResponse extends Response {
  /// Initialize TopupVirtualResponse
  const TopupVirtualResponse({
    this.topupVirtual,
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
  factory TopupVirtualResponse.fromJson(Map<String, dynamic> json) =>
      _$TopupVirtualResponseFromJson(json);

  /// The information regarding a successful top up for a virtual money account
  final Map<String, dynamic> topupVirtual;

  /// Converts an instance to JSON
  @override
  Map<String, dynamic> toJson() => _$TopupVirtualResponseToJson(this);

  /// Creates a copy of instance with given parameters
  @override
  TopupVirtualResponse copyWith({
    Map<String, dynamic> topupVirtual,
    Map<String, dynamic> echoReq,
    Map<String, dynamic> error,
    String msgType,
    int reqId,
  }) =>
      TopupVirtualResponse(
        topupVirtual: topupVirtual ?? this.topupVirtual,
        echoReq: echoReq ?? this.echoReq,
        error: error ?? this.error,
        msgType: msgType ?? this.msgType,
        reqId: reqId ?? this.reqId,
      );

  /// Override equatable class
  @override
  List<Object> get props => null;
}

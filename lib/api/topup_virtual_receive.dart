/// generated automatically from flutter_deriv_api|lib/api/topup_virtual_receive.json
import 'package:json_annotation/json_annotation.dart';

import 'response.dart';

part 'topup_virtual_receive.g.dart';

/// JSON conversion for 'topup_virtual_receive'
@JsonSerializable(nullable: false, fieldRename: FieldRename.snake)
class TopupVirtualResponse extends Response {
  /// Initialize TopupVirtualResponse
  TopupVirtualResponse({
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

  /// Creates instance from JSON
  factory TopupVirtualResponse.fromJson(Map<String, dynamic> json) =>
      _$TopupVirtualResponseFromJson(json);

  // Properties
  /// The information regarding a successful top up for a virtual money account
  final Map<String, dynamic> topupVirtual;

  /// Converts to JSON
  @override
  Map<String, dynamic> toJson() => _$TopupVirtualResponseToJson(this);
}

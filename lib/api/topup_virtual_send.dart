/// generated automatically from flutter_deriv_api|lib/api/topup_virtual_send.json
import 'package:json_annotation/json_annotation.dart';

import 'request.dart';

part 'topup_virtual_send.g.dart';

/// JSON conversion for 'topup_virtual_send'
@JsonSerializable(nullable: false, fieldRename: FieldRename.snake)
class TopupVirtualRequest extends Request {
  /// Initialize TopupVirtualRequest
  TopupVirtualRequest({
    this.topupVirtual = 1,
    Map<String, dynamic> passthrough,
    int reqId,
  }) : super(
          passthrough: passthrough,
          reqId: reqId,
        );

  /// Creates instance from JSON
  factory TopupVirtualRequest.fromJson(Map<String, dynamic> json) =>
      _$TopupVirtualRequestFromJson(json);

  // Properties
  /// Must be `1`
  final int topupVirtual;

  /// Converts to JSON
  @override
  Map<String, dynamic> toJson() => _$TopupVirtualRequestToJson(this);
}

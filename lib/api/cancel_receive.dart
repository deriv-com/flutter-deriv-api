/// generated automatically from flutter_deriv_api|lib/api/cancel_receive.json
import 'package:json_annotation/json_annotation.dart';

import 'response.dart';

part 'cancel_receive.g.dart';

/// JSON conversion for 'cancel_receive'
@JsonSerializable(nullable: false, fieldRename: FieldRename.snake)
class CancelResponse extends Response {
  /// Initialize CancelResponse
  CancelResponse({
    this.cancel,
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
  factory CancelResponse.fromJson(Map<String, dynamic> json) =>
      _$CancelResponseFromJson(json);

  // Properties
  /// Receipt for the transaction
  final Map<String, dynamic> cancel;

  /// Converts to JSON
  @override
  Map<String, dynamic> toJson() => _$CancelResponseToJson(this);
}

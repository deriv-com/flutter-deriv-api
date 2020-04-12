/// generated automatically from flutter_deriv_api|lib/api/cancel_send.json
import 'package:json_annotation/json_annotation.dart';

import 'request.dart';

part 'cancel_send.g.dart';

/// JSON conversion for 'cancel_send'
@JsonSerializable(nullable: false, fieldRename: FieldRename.snake)
class CancelRequest extends Request {
  /// Initialize CancelRequest
  CancelRequest({
    this.cancel = 1,
    Map<String, dynamic> passthrough,
    int reqId,
  }) : super(
          passthrough: passthrough,
          reqId: reqId,
        );

  /// Creates instance from JSON
  factory CancelRequest.fromJson(Map<String, dynamic> json) =>
      _$CancelRequestFromJson(json);

  // Properties
  /// Value should be the `contract_id` which received from the `portfolio` call.
  final int cancel;

  /// Converts to JSON
  @override
  Map<String, dynamic> toJson() => _$CancelRequestToJson(this);
}

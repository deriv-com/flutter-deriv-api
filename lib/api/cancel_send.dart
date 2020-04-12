/// generated automatically from flutter_deriv_api|lib/api/cancel_send.json
import 'package:json_annotation/json_annotation.dart';

import 'request.dart';

part 'cancel_send.g.dart';

/// JSON conversion for 'cancel_send'
@JsonSerializable(nullable: false, fieldRename: FieldRename.snake)
class CancelRequest extends Request {
  /// Initialize CancelRequest
  const CancelRequest({
    this.cancel = 1,
    int reqId,
    Map<String, dynamic> passthrough,
  }) : super(
          reqId: reqId,
          passthrough: passthrough,
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

  /// Creates copy of instance with given parameters
  @override
  CancelRequest copyWith({
    int cancel,
    int reqId,
    Map<String, dynamic> passthrough,
  }) =>
      CancelRequest(
        cancel: cancel ?? this.cancel,
        reqId: reqId ?? this.reqId,
        passthrough: passthrough ?? this.passthrough,
      );

  /// Override equatable class
  @override
  List<Object> get props => <Object>[];
}

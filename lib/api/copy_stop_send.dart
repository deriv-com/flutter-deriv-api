/// generated automatically from flutter_deriv_api|lib/api/copy_stop_send.json
import 'package:json_annotation/json_annotation.dart';

import 'request.dart';

part 'copy_stop_send.g.dart';

/// JSON conversion for 'copy_stop_send'
@JsonSerializable(nullable: false, fieldRename: FieldRename.snake)
class CopyStopRequest extends Request {
  /// Initialize CopyStopRequest
  CopyStopRequest({
    this.copyStop,
    int reqId,
    Map<String, dynamic> passthrough,
  }) : super(
          reqId: reqId,
          passthrough: passthrough,
        );

  /// Creates instance from JSON
  factory CopyStopRequest.fromJson(Map<String, dynamic> json) =>
      _$CopyStopRequestFromJson(json);

  // Properties
  /// API tokens identifying the accounts which needs not to be copied
  final String copyStop;

  /// Converts to JSON
  @override
  Map<String, dynamic> toJson() => _$CopyStopRequestToJson(this);

  /// Creates copy of instance with given parameters
  @override
  CopyStopRequest copyWith({
    String copyStop,
    int reqId,
    Map<String, dynamic> passthrough,
  }) =>
      CopyStopRequest(
        copyStop: copyStop ?? this.copyStop,
        reqId: reqId ?? this.reqId,
        passthrough: passthrough ?? this.passthrough,
      );
}

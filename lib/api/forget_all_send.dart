/// generated automatically from flutter_deriv_api|lib/api/forget_all_send.json
import 'package:json_annotation/json_annotation.dart';

import 'request.dart';

part 'forget_all_send.g.dart';

/// JSON conversion for 'forget_all_send'
@JsonSerializable(nullable: false, fieldRename: FieldRename.snake)
class ForgetAllRequest extends Request {
  /// Initialize ForgetAllRequest
  const ForgetAllRequest({
    this.forgetAll,
    int reqId,
    Map<String, dynamic> passthrough,
  }) : super(
          reqId: reqId,
          passthrough: passthrough,
        );

  /// Creates instance from JSON
  factory ForgetAllRequest.fromJson(Map<String, dynamic> json) =>
      _$ForgetAllRequestFromJson(json);

  // Properties
  /// Cancel all streams by type. The value can be either a single type e.g. `"ticks"`, or an array of multiple types e.g. `["candles", "ticks"]`.
  final String forgetAll;

  /// Converts to JSON
  @override
  Map<String, dynamic> toJson() => _$ForgetAllRequestToJson(this);

  /// Creates copy of instance with given parameters
  @override
  ForgetAllRequest copyWith({
    String forgetAll,
    int reqId,
    Map<String, dynamic> passthrough,
  }) =>
      ForgetAllRequest(
        forgetAll: forgetAll ?? this.forgetAll,
        reqId: reqId ?? this.reqId,
        passthrough: passthrough ?? this.passthrough,
      );

  /// Override equatable class
  @override
  List<Object> get props => null;
}

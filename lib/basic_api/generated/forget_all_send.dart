/// Generated automatically from flutter_deriv_api|lib/basic_api/generated/forget_all_send.json
import 'package:json_annotation/json_annotation.dart';

import '../request.dart';

part 'forget_all_send.g.dart';

/// JSON conversion for 'forget_all_send'
@JsonSerializable(nullable: true, fieldRename: FieldRename.snake)
class ForgetAllRequest extends Request {
  /// Initialize ForgetAllRequest
  const ForgetAllRequest({
    this.forgetAll,
    Map<String, dynamic> passthrough,
    int reqId,
  }) : super(
          msgType: 'forget_all',
          passthrough: passthrough,
          reqId: reqId,
        );

  /// Creates an instance from JSON
  factory ForgetAllRequest.fromJson(Map<String, dynamic> json) =>
      _$ForgetAllRequestFromJson(json);

  /// Cancel all streams by type. The value can be either a single type e.g. `"ticks"`, or an array of multiple types e.g. `["candles", "ticks"]`.
  final String forgetAll;

  /// Converts an instance to JSON
  @override
  Map<String, dynamic> toJson() => _$ForgetAllRequestToJson(this);

  /// Creates a copy of instance with given parameters
  @override
  ForgetAllRequest copyWith({
    String forgetAll,
    Map<String, dynamic> passthrough,
    int reqId,
  }) =>
      ForgetAllRequest(
        forgetAll: forgetAll ?? this.forgetAll,
        passthrough: passthrough ?? this.passthrough,
        reqId: reqId ?? this.reqId,
      );

  /// Override equatable class
  @override
  List<Object> get props => null;
}

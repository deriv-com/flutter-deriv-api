/// generated automatically from flutter_deriv_api|lib/api/forget_all_receive.json
import 'package:json_annotation/json_annotation.dart';

import 'response.dart';

part 'forget_all_receive.g.dart';

/// JSON conversion for 'forget_all_receive'
@JsonSerializable(nullable: false, fieldRename: FieldRename.snake)
class ForgetAllResponse extends Response {
  /// Initialize ForgetAllResponse
  const ForgetAllResponse({
    this.forgetAll,
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
  factory ForgetAllResponse.fromJson(Map<String, dynamic> json) =>
      _$ForgetAllResponseFromJson(json);

  // Properties
  /// IDs of the cancelled streams
  final List<String> forgetAll;

  /// Converts to JSON
  @override
  Map<String, dynamic> toJson() => _$ForgetAllResponseToJson(this);

  /// Creates copy of instance with given parameters
  @override
  ForgetAllResponse copyWith({
    List<String> forgetAll,
    int reqId,
    String msgType,
    Map<String, dynamic> echoReq,
    Map<String, dynamic> error,
  }) =>
      ForgetAllResponse(
        forgetAll: forgetAll ?? this.forgetAll,
        reqId: reqId ?? this.reqId,
        msgType: msgType ?? this.msgType,
        echoReq: echoReq ?? this.echoReq,
        error: error ?? this.error,
      );

  /// Override equatable class
  @override
  List<Object> get props => <Object>[];
}

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
    Map<String, dynamic> echoReq,
    Map<String, dynamic> error,
    String msgType,
    int reqId,
  }) =>
      ForgetAllResponse(
        forgetAll: forgetAll ?? this.forgetAll,
        echoReq: echoReq ?? this.echoReq,
        error: error ?? this.error,
        msgType: msgType ?? this.msgType,
        reqId: reqId ?? this.reqId,
      );

  /// Override equatable class
  @override
  List<Object> get props => null;
}

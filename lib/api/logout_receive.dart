/// generated automatically from flutter_deriv_api|lib/api/logout_receive.json
import 'package:json_annotation/json_annotation.dart';

import 'response.dart';

part 'logout_receive.g.dart';

/// JSON conversion for 'logout_receive'
@JsonSerializable(nullable: false, fieldRename: FieldRename.snake)
class LogoutResponse extends Response {
  /// Initialize LogoutResponse
  const LogoutResponse({
    this.logout,
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
  factory LogoutResponse.fromJson(Map<String, dynamic> json) =>
      _$LogoutResponseFromJson(json);

  // Properties
  /// The result of logout request which is 1
  final int logout;

  /// Converts to JSON
  @override
  Map<String, dynamic> toJson() => _$LogoutResponseToJson(this);

  /// Creates copy of instance with given parameters
  @override
  LogoutResponse copyWith({
    int logout,
    int reqId,
    String msgType,
    Map<String, dynamic> echoReq,
    Map<String, dynamic> error,
  }) =>
      LogoutResponse(
        logout: logout ?? this.logout,
        reqId: reqId ?? this.reqId,
        msgType: msgType ?? this.msgType,
        echoReq: echoReq ?? this.echoReq,
        error: error ?? this.error,
      );

  /// Override equatable class
  @override
  List<Object> get props => <Object>[];
}

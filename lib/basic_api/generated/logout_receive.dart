/// generated automatically from flutter_deriv_api|lib/basic_api/generated/logout_receive.json
import 'package:json_annotation/json_annotation.dart';

import '../response.dart';

part 'logout_receive.g.dart';

/// JSON conversion for 'logout_receive'
@JsonSerializable(nullable: false, fieldRename: FieldRename.snake)
class LogoutResponse extends Response {
  /// Initialize LogoutResponse
  const LogoutResponse({
    this.logout,
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

  /// Creates an instance from json
  factory LogoutResponse.fromJson(Map<String, dynamic> json) =>
      _$LogoutResponseFromJson(json);

  // Properties
  /// The result of logout request which is 1
  final int logout;

  /// Converts an instance to json
  @override
  Map<String, dynamic> toJson() => _$LogoutResponseToJson(this);

  /// Creates a copy of instance with given parameters
  @override
  LogoutResponse copyWith({
    int logout,
    Map<String, dynamic> echoReq,
    Map<String, dynamic> error,
    String msgType,
    int reqId,
  }) =>
      LogoutResponse(
        logout: logout ?? this.logout,
        echoReq: echoReq ?? this.echoReq,
        error: error ?? this.error,
        msgType: msgType ?? this.msgType,
        reqId: reqId ?? this.reqId,
      );

  /// Override equatable class
  @override
  List<Object> get props => null;
}

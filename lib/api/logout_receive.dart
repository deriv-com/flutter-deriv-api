/// generated automatically from flutter_deriv_api|lib/api/logout_receive.json
import 'package:json_annotation/json_annotation.dart';

import 'response.dart';

part 'logout_receive.g.dart';

/// JSON conversion for 'logout_receive'
@JsonSerializable(nullable: false, fieldRename: FieldRename.snake)
class LogoutResponse extends Response {
  /// Initialize LogoutResponse
  LogoutResponse({
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

  /// Creates instance from JSON
  factory LogoutResponse.fromJson(Map<String, dynamic> json) =>
      _$LogoutResponseFromJson(json);

  // Properties
  /// The result of logout request which is 1
  final int logout;

  /// Converts to JSON
  @override
  Map<String, dynamic> toJson() => _$LogoutResponseToJson(this);
}

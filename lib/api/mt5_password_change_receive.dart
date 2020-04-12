/// generated automatically from flutter_deriv_api|lib/api/mt5_password_change_receive.json
import 'package:json_annotation/json_annotation.dart';

import 'response.dart';

part 'mt5_password_change_receive.g.dart';

/// JSON conversion for 'mt5_password_change_receive'
@JsonSerializable(nullable: false, fieldRename: FieldRename.snake)
class Mt5PasswordChangeResponse extends Response {
  /// Initialize Mt5PasswordChangeResponse
  Mt5PasswordChangeResponse({
    this.mt5PasswordChange,
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
  factory Mt5PasswordChangeResponse.fromJson(Map<String, dynamic> json) =>
      _$Mt5PasswordChangeResponseFromJson(json);

  // Properties
  /// `1` on success
  final int mt5PasswordChange;

  /// Converts to JSON
  @override
  Map<String, dynamic> toJson() => _$Mt5PasswordChangeResponseToJson(this);
}

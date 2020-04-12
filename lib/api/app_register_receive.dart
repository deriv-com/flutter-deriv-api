/// generated automatically from flutter_deriv_api|lib/api/app_register_receive.json
import 'package:json_annotation/json_annotation.dart';

import 'response.dart';

part 'app_register_receive.g.dart';

/// JSON conversion for 'app_register_receive'
@JsonSerializable(nullable: false, fieldRename: FieldRename.snake)
class AppRegisterResponse extends Response {
  /// Initialize AppRegisterResponse
  AppRegisterResponse({
    this.appRegister,
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
  factory AppRegisterResponse.fromJson(Map<String, dynamic> json) =>
      _$AppRegisterResponseFromJson(json);

  // Properties
  /// The information of the created application.
  final Map<String, dynamic> appRegister;

  /// Converts to JSON
  @override
  Map<String, dynamic> toJson() => _$AppRegisterResponseToJson(this);
}

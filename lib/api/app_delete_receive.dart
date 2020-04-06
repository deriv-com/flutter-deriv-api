/// Autogenerated from flutter_deriv_api|lib/api/app_delete_receive.json
import 'dart:async';
import 'dart:convert';
import 'package:json_annotation/json_annotation.dart';
import 'response.dart';

part 'app_delete_receive.g.dart';

/// JSON conversion for 'app_delete_receive'
@JsonSerializable(nullable: false, fieldRename: FieldRename.snake)
class AppDeleteResponse extends Response {
  /// Initialize AppDeleteResponse
  AppDeleteResponse({
    this.appDelete,
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
  factory AppDeleteResponse.fromJson(Map<String, dynamic> json) =>
      _$AppDeleteResponseFromJson(json);

  // Properties
  /// 1 on success
  int appDelete;

  /// Converts to JSON
  @override
  Map<String, dynamic> toJson() => _$AppDeleteResponseToJson(this);
}

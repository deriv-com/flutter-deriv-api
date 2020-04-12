/// generated automatically from flutter_deriv_api|lib/api/app_list_receive.json
import 'package:json_annotation/json_annotation.dart';

import 'response.dart';

part 'app_list_receive.g.dart';

/// JSON conversion for 'app_list_receive'
@JsonSerializable(nullable: false, fieldRename: FieldRename.snake)
class AppListResponse extends Response {
  /// Initialize AppListResponse
  AppListResponse({
    this.appList,
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
  factory AppListResponse.fromJson(Map<String, dynamic> json) =>
      _$AppListResponseFromJson(json);

  // Properties
  /// List of created applications for the authorized account.
  final List<Map<String, dynamic>> appList;

  /// Converts to JSON
  @override
  Map<String, dynamic> toJson() => _$AppListResponseToJson(this);

  /// Creates copy of instance with given parameters
  @override
  AppListResponse copyWith({
    List<Map<String, dynamic>> appList,
    int reqId,
    String msgType,
    Map<String, dynamic> echoReq,
    Map<String, dynamic> error,
  }) =>
      AppListResponse(
        appList: appList ?? this.appList,
        reqId: reqId ?? this.reqId,
        msgType: msgType ?? this.msgType,
        echoReq: echoReq ?? this.echoReq,
        error: error ?? this.error,
      );
}

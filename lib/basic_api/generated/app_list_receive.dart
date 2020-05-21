/// Generated automatically from flutter_deriv_api|lib/basic_api/generated/app_list_receive.json
import 'package:json_annotation/json_annotation.dart';

import '../response.dart';

part 'app_list_receive.g.dart';

/// JSON conversion for 'app_list_receive'
@JsonSerializable(nullable: false, fieldRename: FieldRename.snake)
class AppListResponse extends Response {
  /// Initialize AppListResponse
  const AppListResponse({
    this.appList,
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

  /// Creates an instance from JSON
  factory AppListResponse.fromJson(Map<String, dynamic> json) =>
      _$AppListResponseFromJson(json);

  /// List of created applications for the authorized account.
  final List<Map<String, dynamic>> appList;

  /// Converts an instance to JSON
  @override
  Map<String, dynamic> toJson() => _$AppListResponseToJson(this);

  /// Creates a copy of instance with given parameters
  @override
  AppListResponse copyWith({
    List<Map<String, dynamic>> appList,
    Map<String, dynamic> echoReq,
    Map<String, dynamic> error,
    String msgType,
    int reqId,
  }) =>
      AppListResponse(
        appList: appList ?? this.appList,
        echoReq: echoReq ?? this.echoReq,
        error: error ?? this.error,
        msgType: msgType ?? this.msgType,
        reqId: reqId ?? this.reqId,
      );

  /// Override equatable class
  @override
  List<Object> get props => null;
}

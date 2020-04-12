/// generated automatically from flutter_deriv_api|lib/api/app_delete_receive.json
import 'package:json_annotation/json_annotation.dart';

import 'response.dart';

part 'app_delete_receive.g.dart';

/// JSON conversion for 'app_delete_receive'
@JsonSerializable(nullable: false, fieldRename: FieldRename.snake)
class AppDeleteResponse extends Response {
  /// Initialize AppDeleteResponse
  const AppDeleteResponse({
    this.appDelete,
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
  factory AppDeleteResponse.fromJson(Map<String, dynamic> json) =>
      _$AppDeleteResponseFromJson(json);

  // Properties
  /// 1 on success
  final int appDelete;

  /// Converts to JSON
  @override
  Map<String, dynamic> toJson() => _$AppDeleteResponseToJson(this);

  /// Creates copy of instance with given parameters
  @override
  AppDeleteResponse copyWith({
    int appDelete,
    int reqId,
    String msgType,
    Map<String, dynamic> echoReq,
    Map<String, dynamic> error,
  }) =>
      AppDeleteResponse(
        appDelete: appDelete ?? this.appDelete,
        reqId: reqId ?? this.reqId,
        msgType: msgType ?? this.msgType,
        echoReq: echoReq ?? this.echoReq,
        error: error ?? this.error,
      );

  /// Override equatable class
  @override
  List<Object> get props => null;
}

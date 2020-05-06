/// generated automatically from flutter_deriv_api|lib/basic_api/generated/app_delete_receive.json
import 'package:json_annotation/json_annotation.dart';

import '../response.dart';

part 'app_delete_receive.g.dart';

/// JSON conversion for 'app_delete_receive'
@JsonSerializable(nullable: false, fieldRename: FieldRename.snake)
class AppDeleteResponse extends Response {
  /// Initialize AppDeleteResponse
  const AppDeleteResponse({
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

  /// Creates an instance from JSON
  factory AppDeleteResponse.fromJson(Map<String, dynamic> json) =>
      _$AppDeleteResponseFromJson(json);

  // Properties
  /// 1 on success
  final int appDelete;

  /// Converts an instance to JSON
  @override
  Map<String, dynamic> toJson() => _$AppDeleteResponseToJson(this);

  /// Creates a copy of instance with given parameters
  @override
  AppDeleteResponse copyWith({
    int appDelete,
    Map<String, dynamic> echoReq,
    Map<String, dynamic> error,
    String msgType,
    int reqId,
  }) =>
      AppDeleteResponse(
        appDelete: appDelete ?? this.appDelete,
        echoReq: echoReq ?? this.echoReq,
        error: error ?? this.error,
        msgType: msgType ?? this.msgType,
        reqId: reqId ?? this.reqId,
      );

  /// Override equatable class
  @override
  List<Object> get props => null;
}

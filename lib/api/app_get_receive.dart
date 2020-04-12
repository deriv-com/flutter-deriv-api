/// generated automatically from flutter_deriv_api|lib/api/app_get_receive.json
import 'package:json_annotation/json_annotation.dart';

import 'response.dart';

part 'app_get_receive.g.dart';

/// JSON conversion for 'app_get_receive'
@JsonSerializable(nullable: false, fieldRename: FieldRename.snake)
class AppGetResponse extends Response {
  /// Initialize AppGetResponse
  const AppGetResponse({
    this.appGet,
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
  factory AppGetResponse.fromJson(Map<String, dynamic> json) =>
      _$AppGetResponseFromJson(json);

  // Properties
  /// The information of the requested application.
  final Map<String, dynamic> appGet;

  /// Converts to JSON
  @override
  Map<String, dynamic> toJson() => _$AppGetResponseToJson(this);

  /// Creates copy of instance with given parameters
  @override
  AppGetResponse copyWith({
    Map<String, dynamic> appGet,
    int reqId,
    String msgType,
    Map<String, dynamic> echoReq,
    Map<String, dynamic> error,
  }) =>
      AppGetResponse(
        appGet: appGet ?? this.appGet,
        reqId: reqId ?? this.reqId,
        msgType: msgType ?? this.msgType,
        echoReq: echoReq ?? this.echoReq,
        error: error ?? this.error,
      );

  /// Override equatable class
  @override
  List<Object> get props => <Object>[];
}

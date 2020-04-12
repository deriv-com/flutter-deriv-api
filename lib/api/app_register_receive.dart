/// generated automatically from flutter_deriv_api|lib/api/app_register_receive.json
import 'package:json_annotation/json_annotation.dart';

import 'response.dart';

part 'app_register_receive.g.dart';

/// JSON conversion for 'app_register_receive'
@JsonSerializable(nullable: false, fieldRename: FieldRename.snake)
class AppRegisterResponse extends Response {
  /// Initialize AppRegisterResponse
  const AppRegisterResponse({
    this.appRegister,
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
  factory AppRegisterResponse.fromJson(Map<String, dynamic> json) =>
      _$AppRegisterResponseFromJson(json);

  // Properties
  /// The information of the created application.
  final Map<String, dynamic> appRegister;

  /// Converts to JSON
  @override
  Map<String, dynamic> toJson() => _$AppRegisterResponseToJson(this);

  /// Creates copy of instance with given parameters
  @override
  AppRegisterResponse copyWith({
    Map<String, dynamic> appRegister,
    int reqId,
    String msgType,
    Map<String, dynamic> echoReq,
    Map<String, dynamic> error,
  }) =>
      AppRegisterResponse(
        appRegister: appRegister ?? this.appRegister,
        reqId: reqId ?? this.reqId,
        msgType: msgType ?? this.msgType,
        echoReq: echoReq ?? this.echoReq,
        error: error ?? this.error,
      );

  /// Override equatable class
  @override
  List<Object> get props => null;
}

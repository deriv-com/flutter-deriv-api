/// generated automatically from flutter_deriv_api|lib/api/app_markup_details_receive.json
import 'package:json_annotation/json_annotation.dart';

import 'response.dart';

part 'app_markup_details_receive.g.dart';

/// JSON conversion for 'app_markup_details_receive'
@JsonSerializable(nullable: false, fieldRename: FieldRename.snake)
class AppMarkupDetailsResponse extends Response {
  /// Initialize AppMarkupDetailsResponse
  const AppMarkupDetailsResponse({
    this.appMarkupDetails,
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
  factory AppMarkupDetailsResponse.fromJson(Map<String, dynamic> json) =>
      _$AppMarkupDetailsResponseFromJson(json);

  // Properties
  /// App Markup transaction details
  final Map<String, dynamic> appMarkupDetails;

  /// Converts to JSON
  @override
  Map<String, dynamic> toJson() => _$AppMarkupDetailsResponseToJson(this);

  /// Creates copy of instance with given parameters
  @override
  AppMarkupDetailsResponse copyWith({
    Map<String, dynamic> appMarkupDetails,
    int reqId,
    String msgType,
    Map<String, dynamic> echoReq,
    Map<String, dynamic> error,
  }) =>
      AppMarkupDetailsResponse(
        appMarkupDetails: appMarkupDetails ?? this.appMarkupDetails,
        reqId: reqId ?? this.reqId,
        msgType: msgType ?? this.msgType,
        echoReq: echoReq ?? this.echoReq,
        error: error ?? this.error,
      );

  /// Override equatable class
  @override
  List<Object> get props => <Object>[];
}

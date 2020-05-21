/// Generated automatically from flutter_deriv_api|lib/basic_api/generated/app_markup_details_receive.json
import 'package:json_annotation/json_annotation.dart';

import '../response.dart';

part 'app_markup_details_receive.g.dart';

/// JSON conversion for 'app_markup_details_receive'
@JsonSerializable(nullable: false, fieldRename: FieldRename.snake)
class AppMarkupDetailsResponse extends Response {
  /// Initialize AppMarkupDetailsResponse
  const AppMarkupDetailsResponse({
    this.appMarkupDetails,
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
  factory AppMarkupDetailsResponse.fromJson(Map<String, dynamic> json) =>
      _$AppMarkupDetailsResponseFromJson(json);

  /// App Markup transaction details
  final Map<String, dynamic> appMarkupDetails;

  /// Converts an instance to JSON
  @override
  Map<String, dynamic> toJson() => _$AppMarkupDetailsResponseToJson(this);

  /// Creates a copy of instance with given parameters
  @override
  AppMarkupDetailsResponse copyWith({
    Map<String, dynamic> appMarkupDetails,
    Map<String, dynamic> echoReq,
    Map<String, dynamic> error,
    String msgType,
    int reqId,
  }) =>
      AppMarkupDetailsResponse(
        appMarkupDetails: appMarkupDetails ?? this.appMarkupDetails,
        echoReq: echoReq ?? this.echoReq,
        error: error ?? this.error,
        msgType: msgType ?? this.msgType,
        reqId: reqId ?? this.reqId,
      );

  /// Override equatable class
  @override
  List<Object> get props => null;
}

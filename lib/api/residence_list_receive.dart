/// generated automatically from flutter_deriv_api|lib/api/residence_list_receive.json
import 'package:json_annotation/json_annotation.dart';

import 'response.dart';

part 'residence_list_receive.g.dart';

/// JSON conversion for 'residence_list_receive'
@JsonSerializable(nullable: false, fieldRename: FieldRename.snake)
class ResidenceListResponse extends Response {
  /// Initialize ResidenceListResponse
  const ResidenceListResponse({
    this.residenceList,
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
  factory ResidenceListResponse.fromJson(Map<String, dynamic> json) =>
      _$ResidenceListResponseFromJson(json);

  // Properties
  /// List of countries for account opening
  final List<Map<String, dynamic>> residenceList;

  /// Converts to JSON
  @override
  Map<String, dynamic> toJson() => _$ResidenceListResponseToJson(this);

  /// Creates copy of instance with given parameters
  @override
  ResidenceListResponse copyWith({
    List<Map<String, dynamic>> residenceList,
    int reqId,
    String msgType,
    Map<String, dynamic> echoReq,
    Map<String, dynamic> error,
  }) =>
      ResidenceListResponse(
        residenceList: residenceList ?? this.residenceList,
        reqId: reqId ?? this.reqId,
        msgType: msgType ?? this.msgType,
        echoReq: echoReq ?? this.echoReq,
        error: error ?? this.error,
      );

  /// Override equatable class
  @override
  List<Object> get props => <Object>[];
}

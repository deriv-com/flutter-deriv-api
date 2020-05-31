/// Generated automatically from flutter_deriv_api|lib/basic_api/generated/residence_list_receive.json
import 'package:json_annotation/json_annotation.dart';

import '../response.dart';

part 'residence_list_receive.g.dart';

/// JSON conversion for 'residence_list_receive'
@JsonSerializable(nullable: true, fieldRename: FieldRename.snake)
class ResidenceListResponse extends Response {
  /// Initialize ResidenceListResponse
  const ResidenceListResponse({
    this.residenceList,
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
  factory ResidenceListResponse.fromJson(Map<String, dynamic> json) =>
      _$ResidenceListResponseFromJson(json);

  /// List of countries for account opening
  final List<Map<String, dynamic>> residenceList;

  /// Converts an instance to JSON
  @override
  Map<String, dynamic> toJson() => _$ResidenceListResponseToJson(this);

  /// Creates a copy of instance with given parameters
  @override
  ResidenceListResponse copyWith({
    List<Map<String, dynamic>> residenceList,
    Map<String, dynamic> echoReq,
    Map<String, dynamic> error,
    String msgType,
    int reqId,
  }) =>
      ResidenceListResponse(
        residenceList: residenceList ?? this.residenceList,
        echoReq: echoReq ?? this.echoReq,
        error: error ?? this.error,
        msgType: msgType ?? this.msgType,
        reqId: reqId ?? this.reqId,
      );

  /// Override equatable class
  @override
  List<Object> get props => null;
}

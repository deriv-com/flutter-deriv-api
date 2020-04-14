/// generated automatically from flutter_deriv_api|lib/api/residence_list_send.json
import 'package:json_annotation/json_annotation.dart';

import 'request.dart';

part 'residence_list_send.g.dart';

/// JSON conversion for 'residence_list_send'
@JsonSerializable(nullable: false, fieldRename: FieldRename.snake)
class ResidenceListRequest extends Request {
  /// Initialize ResidenceListRequest
  const ResidenceListRequest({
    this.residenceList = 1,
    Map<String, dynamic> passthrough,
    int reqId,
  }) : super(
          passthrough: passthrough,
          reqId: reqId,
        );

  /// Creates instance from JSON
  factory ResidenceListRequest.fromJson(Map<String, dynamic> json) =>
      _$ResidenceListRequestFromJson(json);

  // Properties
  /// Must be `1`
  final int residenceList;

  /// Converts to JSON
  @override
  Map<String, dynamic> toJson() => _$ResidenceListRequestToJson(this);

  /// Creates copy of instance with given parameters
  @override
  ResidenceListRequest copyWith({
    int residenceList,
    Map<String, dynamic> passthrough,
    int reqId,
  }) =>
      ResidenceListRequest(
        residenceList: residenceList ?? this.residenceList,
        passthrough: passthrough ?? this.passthrough,
        reqId: reqId ?? this.reqId,
      );

  /// Override equatable class
  @override
  List<Object> get props => null;
}

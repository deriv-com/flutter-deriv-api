/// Generated automatically from flutter_deriv_api|lib/basic_api/generated/residence_list_send.json.

// ignore_for_file: always_put_required_named_parameters_first

import '../request.dart';

/// Residence list request class.
class ResidenceListRequest extends Request {
  /// Initialize ResidenceListRequest.
  const ResidenceListRequest({
    this.query,
    this.residenceList = true,
    super.msgType = 'residence_list',
    super.passthrough,
    super.reqId,
  });

  /// Creates an instance from JSON.
  factory ResidenceListRequest.fromJson(Map<String, dynamic> json) =>
      ResidenceListRequest(
        query: (json['query'] as List<dynamic>?)
            ?.map<String>((dynamic item) => item as String)
            .toList(),
        residenceList:
            json['residence_list'] == null ? null : json['residence_list'] == 1,
        passthrough: json['passthrough'] as Map<String, dynamic>?,
        reqId: json['req_id'] as int?,
      );

  /// [Optional] Specific keys from the response that you want. If not passed, it will return all the keys.
  final List<String>? query;

  /// Must be `true`
  final bool? residenceList;

  /// Converts this instance to JSON
  @override
  Map<String, dynamic> toJson() => <String, dynamic>{
        'query': query,
        'residence_list': residenceList == null
            ? null
            : residenceList!
                ? 1
                : 0,
        'passthrough': passthrough,
        'req_id': reqId,
      };

  /// Creates a copy of instance with given parameters
  @override
  ResidenceListRequest copyWith({
    List<String>? query,
    bool? residenceList,
    Map<String, dynamic>? passthrough,
    int? reqId,
  }) =>
      ResidenceListRequest(
        query: query ?? this.query,
        residenceList: residenceList ?? this.residenceList,
        passthrough: passthrough ?? this.passthrough,
        reqId: reqId ?? this.reqId,
      );

  /// Override equatable class.
  @override
  List<Object?> get props => <Object?>[];
}

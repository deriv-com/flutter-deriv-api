/// Generated automatically from flutter_deriv_api|lib/basic_api/generated/tin_validations_send.json.

// ignore_for_file: always_put_required_named_parameters_first

import '../request.dart';

/// Tin validations request class.
class TinValidationsRequest extends Request {
  /// Initialize TinValidationsRequest.
  const TinValidationsRequest({
    required this.taxResidence,
    this.tinValidations = true,
    super.msgType = 'tin_validations',
    super.passthrough,
    super.reqId,
  });

  /// Creates an instance from JSON.
  factory TinValidationsRequest.fromJson(Map<String, dynamic> json) =>
      TinValidationsRequest(
        taxResidence: json['tax_residence'] as String?,
        tinValidations: json['tin_validations'] == null
            ? null
            : json['tin_validations'] == 1,
        passthrough: json['passthrough'] as Map<String, dynamic>?,
        reqId: json['req_id'] as int?,
      );

  /// The tax residence selected by the client.
  final String? taxResidence;

  /// Must be `true`
  final bool? tinValidations;

  /// Converts this instance to JSON
  @override
  Map<String, dynamic> toJson() => <String, dynamic>{
        'tax_residence': taxResidence,
        'tin_validations': tinValidations == null
            ? null
            : tinValidations!
                ? 1
                : 0,
        'passthrough': passthrough,
        'req_id': reqId,
      };

  /// Creates a copy of instance with given parameters
  @override
  TinValidationsRequest copyWith({
    String? taxResidence,
    bool? tinValidations,
    Map<String, dynamic>? passthrough,
    int? reqId,
  }) =>
      TinValidationsRequest(
        taxResidence: taxResidence ?? this.taxResidence,
        tinValidations: tinValidations ?? this.tinValidations,
        passthrough: passthrough ?? this.passthrough,
        reqId: reqId ?? this.reqId,
      );

  /// Override equatable class.
  @override
  List<Object?> get props => <Object?>[];
}

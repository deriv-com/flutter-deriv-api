/// Generated automatically from flutter_deriv_api|lib/basic_api/generated/unsubscribe_email_send.json.

// ignore_for_file: always_put_required_named_parameters_first

import '../request.dart';

/// Unsubscribe email request class.
class UnsubscribeEmailRequest extends Request {
  /// Initialize UnsubscribeEmailRequest.
  const UnsubscribeEmailRequest({
    required this.binaryUserId,
    required this.checksum,
    this.unsubscribeEmail = true,
    super.msgType = 'unsubscribe_email',
    super.passthrough,
    super.reqId,
  });

  /// Creates an instance from JSON.
  factory UnsubscribeEmailRequest.fromJson(Map<String, dynamic> json) =>
      UnsubscribeEmailRequest(
        binaryUserId: json['binary_user_id'] as num?,
        checksum: json['checksum'] as String?,
        unsubscribeEmail: json['unsubscribe_email'] == null
            ? null
            : json['unsubscribe_email'] == 1,
        passthrough: json['passthrough'] as Map<String, dynamic>?,
        reqId: json['req_id'] as int?,
      );

  /// Customer User ID.
  final num? binaryUserId;

  /// The generated checksum for the customer.
  final String? checksum;

  /// Must be `true`
  final bool? unsubscribeEmail;

  /// Converts this instance to JSON
  @override
  Map<String, dynamic> toJson() => <String, dynamic>{
        'binary_user_id': binaryUserId,
        'checksum': checksum,
        'unsubscribe_email': unsubscribeEmail == null
            ? null
            : unsubscribeEmail!
                ? 1
                : 0,
        'passthrough': passthrough,
        'req_id': reqId,
      };

  /// Creates a copy of instance with given parameters
  @override
  UnsubscribeEmailRequest copyWith({
    num? binaryUserId,
    String? checksum,
    bool? unsubscribeEmail,
    Map<String, dynamic>? passthrough,
    int? reqId,
  }) =>
      UnsubscribeEmailRequest(
        binaryUserId: binaryUserId ?? this.binaryUserId,
        checksum: checksum ?? this.checksum,
        unsubscribeEmail: unsubscribeEmail ?? this.unsubscribeEmail,
        passthrough: passthrough ?? this.passthrough,
        reqId: reqId ?? this.reqId,
      );

  /// Override equatable class.
  @override
  List<Object?> get props => <Object?>[];
}

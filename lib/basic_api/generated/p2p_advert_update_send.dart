/// Generated automatically from flutter_deriv_api|lib/basic_api/generated/p2p_advert_update_send.json.

import '../request.dart';

/// P2p advert update request class.
class P2pAdvertUpdateRequest extends Request {
  /// Initialize P2pAdvertUpdateRequest.
  const P2pAdvertUpdateRequest({
    this.delete,
    required this.id,
    this.isActive,
    this.p2pAdvertUpdate = true,
    Map<String, dynamic>? passthrough,
    int? reqId,
  }) : super(
          msgType: 'p2p_advert_update',
          passthrough: passthrough,
          reqId: reqId,
        );

  /// Creates an instance from JSON.
  factory P2pAdvertUpdateRequest.fromJson(Map<String, dynamic> json) =>
      P2pAdvertUpdateRequest(
        delete: json['delete'] == null ? null : json['delete'] == 1,
        id: json['id'] as String?,
        isActive: json['is_active'] == null ? null : json['is_active'] == 1,
        p2pAdvertUpdate: json['p2p_advert_update'] == null
            ? null
            : json['p2p_advert_update'] == 1,
        passthrough: json['passthrough'] as Map<String, dynamic>?,
        reqId: json['req_id'] as int?,
      );

  /// [Optional] If set to `true`, permanently deletes the advert.
  final bool? delete;

  /// The unique identifier for this advert.
  final String? id;

  /// [Optional] Activate or deactivate the advert.
  final bool? isActive;

  /// Must be `true`
  final bool? p2pAdvertUpdate;

  /// Converts this instance to JSON
  @override
  Map<String, dynamic> toJson() => <String, dynamic>{
        'delete': delete == null
            ? null
            : delete!
                ? 1
                : 0,
        'id': id,
        'is_active': isActive == null
            ? null
            : isActive!
                ? 1
                : 0,
        'p2p_advert_update': p2pAdvertUpdate == null
            ? null
            : p2pAdvertUpdate!
                ? 1
                : 0,
        'passthrough': passthrough,
        'req_id': reqId,
      };

  /// Creates a copy of instance with given parameters
  @override
  P2pAdvertUpdateRequest copyWith({
    bool? delete,
    String? id,
    bool? isActive,
    bool? p2pAdvertUpdate,
    Map<String, dynamic>? passthrough,
    int? reqId,
  }) =>
      P2pAdvertUpdateRequest(
        delete: delete ?? this.delete,
        id: id ?? this.id,
        isActive: isActive ?? this.isActive,
        p2pAdvertUpdate: p2pAdvertUpdate ?? this.p2pAdvertUpdate,
        passthrough: passthrough ?? this.passthrough,
        reqId: reqId ?? this.reqId,
      );

  /// Override equatable class.
  @override
  List<Object> get props => <Object>[];
}

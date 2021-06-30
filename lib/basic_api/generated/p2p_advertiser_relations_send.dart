/// Generated automatically from flutter_deriv_api|lib/basic_api/generated/p2p_advertiser_relations_send.json.

// ignore_for_file: always_put_required_named_parameters_first

import '../request.dart';

/// P2p advertiser relations request class.
class P2pAdvertiserRelationsRequest extends Request {
  /// Initialize P2pAdvertiserRelationsRequest.
  const P2pAdvertiserRelationsRequest({
    required this.addBlocked,
    required this.addFavourites,
    this.p2pAdvertiserRelations = true,
    required this.removeBlocked,
    required this.removeFavourites,
    Map<String, dynamic>? passthrough,
    int? reqId,
  }) : super(
          msgType: 'p2p_advertiser_relations',
          passthrough: passthrough,
          reqId: reqId,
        );

  /// Creates an instance from JSON.
  factory P2pAdvertiserRelationsRequest.fromJson(Map<String, dynamic> json) =>
      P2pAdvertiserRelationsRequest(
        addBlocked: (json['add_blocked'] as List<dynamic>?)
            ?.map<num>((dynamic item) => item as num)
            .toList(),
        addFavourites: (json['add_favourites'] as List<dynamic>?)
            ?.map<num>((dynamic item) => item as num)
            .toList(),
        p2pAdvertiserRelations: json['p2p_advertiser_relations'] == null
            ? null
            : json['p2p_advertiser_relations'] == 1,
        removeBlocked: (json['remove_blocked'] as List<dynamic>?)
            ?.map<num>((dynamic item) => item as num)
            .toList(),
        removeFavourites: (json['remove_favourites'] as List<dynamic>?)
            ?.map<num>((dynamic item) => item as num)
            .toList(),
        passthrough: json['passthrough'] as Map<String, dynamic>?,
        reqId: json['req_id'] as int?,
      );

  /// IDs of advertisers to block.
  final List<num>? addBlocked;

  /// IDs of advertisers to add as favourites.
  final List<num>? addFavourites;

  /// Must be `true`
  final bool? p2pAdvertiserRelations;

  /// IDs of advertisers to remove from blocked.
  final List<num>? removeBlocked;

  /// IDs of advertisers to remove from favourites.
  final List<num>? removeFavourites;

  /// Converts this instance to JSON
  @override
  Map<String, dynamic> toJson() => <String, dynamic>{
        'add_blocked': addBlocked,
        'add_favourites': addFavourites,
        'p2p_advertiser_relations': p2pAdvertiserRelations == null
            ? null
            : p2pAdvertiserRelations!
                ? 1
                : 0,
        'remove_blocked': removeBlocked,
        'remove_favourites': removeFavourites,
        'passthrough': passthrough,
        'req_id': reqId,
      };

  /// Creates a copy of instance with given parameters
  @override
  P2pAdvertiserRelationsRequest copyWith({
    List<num>? addBlocked,
    List<num>? addFavourites,
    bool? p2pAdvertiserRelations,
    List<num>? removeBlocked,
    List<num>? removeFavourites,
    Map<String, dynamic>? passthrough,
    int? reqId,
  }) =>
      P2pAdvertiserRelationsRequest(
        addBlocked: addBlocked ?? this.addBlocked,
        addFavourites: addFavourites ?? this.addFavourites,
        p2pAdvertiserRelations:
            p2pAdvertiserRelations ?? this.p2pAdvertiserRelations,
        removeBlocked: removeBlocked ?? this.removeBlocked,
        removeFavourites: removeFavourites ?? this.removeFavourites,
        passthrough: passthrough ?? this.passthrough,
        reqId: reqId ?? this.reqId,
      );

  /// Override equatable class.
  @override
  List<Object> get props => <Object>[];
}

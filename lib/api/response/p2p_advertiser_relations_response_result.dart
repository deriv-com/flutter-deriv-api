// ignore_for_file: prefer_single_quotes, unnecessary_import, unused_import

import 'package:equatable/equatable.dart';


import 'package:flutter_deriv_api/api/exceptions/exceptions.dart';
import 'package:flutter_deriv_api/basic_api/generated/p2p_advertiser_relations_receive.dart';
import 'package:flutter_deriv_api/basic_api/generated/p2p_advertiser_relations_send.dart';

import 'package:flutter_deriv_api/helpers/helpers.dart';
import 'package:flutter_deriv_api/services/connection/api_manager/base_api.dart';
import 'package:flutter_deriv_api/services/dependency_injector/injector.dart';

/// P2p advertiser relations response model class.
abstract class P2pAdvertiserRelationsResponseModel {
  /// Initializes P2p advertiser relations response model class .
  const P2pAdvertiserRelationsResponseModel({
    this.p2pAdvertiserRelations,
  });

  /// P2P advertiser relations information.
  final P2pAdvertiserRelations? p2pAdvertiserRelations;
}

/// P2p advertiser relations response class.
class P2pAdvertiserRelationsResponse
    extends P2pAdvertiserRelationsResponseModel {
  /// Initializes P2p advertiser relations response class.
  const P2pAdvertiserRelationsResponse({
    P2pAdvertiserRelations? p2pAdvertiserRelations,
  }) : super(
          p2pAdvertiserRelations: p2pAdvertiserRelations,
        );

  /// Creates an instance from JSON.
  factory P2pAdvertiserRelationsResponse.fromJson(
    dynamic p2pAdvertiserRelationsJson,
  ) =>
      P2pAdvertiserRelationsResponse(
        p2pAdvertiserRelations: p2pAdvertiserRelationsJson == null
            ? null
            : P2pAdvertiserRelations.fromJson(p2pAdvertiserRelationsJson),
      );

  /// Converts an instance to JSON.
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    if (p2pAdvertiserRelations != null) {
      resultMap['p2p_advertiser_relations'] = p2pAdvertiserRelations!.toJson();
    }

    return resultMap;
  }

  static final BaseAPI _api = Injector.getInjector().get<BaseAPI>()!;

  /// Updates and returns favourite and blocked advertisers of the current user.
  Future<P2pAdvertiserRelationsResponse> fetch(
    P2pAdvertiserRelationsRequest request,
  ) async {
    final P2pAdvertiserRelationsReceive response = await fetchRaw(request);

    return P2pAdvertiserRelationsResponse.fromJson(
        response.p2pAdvertiserRelations);
  }

  /// Updates and returns favourite and blocked advertisers of the current user.
  Future<P2pAdvertiserRelationsReceive> fetchRaw(
    P2pAdvertiserRelationsRequest request,
  ) async {
    final P2pAdvertiserRelationsReceive response =
        await _api.call(request: request);

    checkException(
      response: response,
      exceptionCreator: ({BaseExceptionModel? baseExceptionModel}) =>
          P2PAdvertiserException(baseExceptionModel: baseExceptionModel),
    );

    return response;
  }

  /// Creates a copy of instance with given parameters.
  P2pAdvertiserRelationsResponse copyWith({
    P2pAdvertiserRelations? p2pAdvertiserRelations,
  }) =>
      P2pAdvertiserRelationsResponse(
        p2pAdvertiserRelations:
            p2pAdvertiserRelations ?? this.p2pAdvertiserRelations,
      );
}
/// P2p advertiser relations model class.
abstract class P2pAdvertiserRelationsModel {
  /// Initializes P2p advertiser relations model class .
  const P2pAdvertiserRelationsModel({
    required this.favouriteAdvertisers,
    required this.blockedAdvertisers,
  });

  /// Favourite advertisers of the current user.
  final List<FavouriteAdvertisersItem> favouriteAdvertisers;

  /// List of advertisers blocked by the current user.
  final List<BlockedAdvertisersItem> blockedAdvertisers;
}

/// P2p advertiser relations class.
class P2pAdvertiserRelations extends P2pAdvertiserRelationsModel {
  /// Initializes P2p advertiser relations class.
  const P2pAdvertiserRelations({
    required List<BlockedAdvertisersItem> blockedAdvertisers,
    required List<FavouriteAdvertisersItem> favouriteAdvertisers,
  }) : super(
          blockedAdvertisers: blockedAdvertisers,
          favouriteAdvertisers: favouriteAdvertisers,
        );

  /// Creates an instance from JSON.
  factory P2pAdvertiserRelations.fromJson(Map<String, dynamic> json) =>
      P2pAdvertiserRelations(
        blockedAdvertisers: List<BlockedAdvertisersItem>.from(
          json['blocked_advertisers'].map(
            (dynamic item) => BlockedAdvertisersItem.fromJson(item),
          ),
        ),
        favouriteAdvertisers: List<FavouriteAdvertisersItem>.from(
          json['favourite_advertisers'].map(
            (dynamic item) => FavouriteAdvertisersItem.fromJson(item),
          ),
        ),
      );

  /// Converts an instance to JSON.
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    resultMap['blocked_advertisers'] = blockedAdvertisers
        .map<dynamic>(
          (BlockedAdvertisersItem item) => item.toJson(),
        )
        .toList();

    resultMap['favourite_advertisers'] = favouriteAdvertisers
        .map<dynamic>(
          (FavouriteAdvertisersItem item) => item.toJson(),
        )
        .toList();

    return resultMap;
  }

  /// Creates a copy of instance with given parameters.
  P2pAdvertiserRelations copyWith({
    List<BlockedAdvertisersItem>? blockedAdvertisers,
    List<FavouriteAdvertisersItem>? favouriteAdvertisers,
  }) =>
      P2pAdvertiserRelations(
        blockedAdvertisers: blockedAdvertisers ?? this.blockedAdvertisers,
        favouriteAdvertisers: favouriteAdvertisers ?? this.favouriteAdvertisers,
      );
}
/// Blocked advertisers item model class.
abstract class BlockedAdvertisersItemModel {
  /// Initializes Blocked advertisers item model class .
  const BlockedAdvertisersItemModel({
    this.createdTime,
    this.id,
    this.name,
  });

  /// The epoch time that the advertiser was blocked.
  final DateTime? createdTime;

  /// Advertiser unique identifer.
  final String? id;

  /// Advertiser displayed name.
  final String? name;
}

/// Blocked advertisers item class.
class BlockedAdvertisersItem extends BlockedAdvertisersItemModel {
  /// Initializes Blocked advertisers item class.
  const BlockedAdvertisersItem({
    DateTime? createdTime,
    String? id,
    String? name,
  }) : super(
          createdTime: createdTime,
          id: id,
          name: name,
        );

  /// Creates an instance from JSON.
  factory BlockedAdvertisersItem.fromJson(Map<String, dynamic> json) =>
      BlockedAdvertisersItem(
        createdTime: getDateTime(json['created_time']),
        id: json['id'],
        name: json['name'],
      );

  /// Converts an instance to JSON.
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    resultMap['created_time'] = getSecondsSinceEpochDateTime(createdTime);
    resultMap['id'] = id;
    resultMap['name'] = name;

    return resultMap;
  }

  /// Creates a copy of instance with given parameters.
  BlockedAdvertisersItem copyWith({
    DateTime? createdTime,
    String? id,
    String? name,
  }) =>
      BlockedAdvertisersItem(
        createdTime: createdTime ?? this.createdTime,
        id: id ?? this.id,
        name: name ?? this.name,
      );
}
/// Favourite advertisers item model class.
abstract class FavouriteAdvertisersItemModel {
  /// Initializes Favourite advertisers item model class .
  const FavouriteAdvertisersItemModel({
    this.createdTime,
    this.id,
    this.name,
  });

  /// The epoch time that the advertiser was set as favourite.
  final DateTime? createdTime;

  /// Advertiser unique identifer.
  final String? id;

  /// Advertiser displayed name.
  final String? name;
}

/// Favourite advertisers item class.
class FavouriteAdvertisersItem extends FavouriteAdvertisersItemModel {
  /// Initializes Favourite advertisers item class.
  const FavouriteAdvertisersItem({
    DateTime? createdTime,
    String? id,
    String? name,
  }) : super(
          createdTime: createdTime,
          id: id,
          name: name,
        );

  /// Creates an instance from JSON.
  factory FavouriteAdvertisersItem.fromJson(Map<String, dynamic> json) =>
      FavouriteAdvertisersItem(
        createdTime: getDateTime(json['created_time']),
        id: json['id'],
        name: json['name'],
      );

  /// Converts an instance to JSON.
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    resultMap['created_time'] = getSecondsSinceEpochDateTime(createdTime);
    resultMap['id'] = id;
    resultMap['name'] = name;

    return resultMap;
  }

  /// Creates a copy of instance with given parameters.
  FavouriteAdvertisersItem copyWith({
    DateTime? createdTime,
    String? id,
    String? name,
  }) =>
      FavouriteAdvertisersItem(
        createdTime: createdTime ?? this.createdTime,
        id: id ?? this.id,
        name: name ?? this.name,
      );
}

import 'package:flutter_deriv_api/models/advertiser.dart';
import 'package:flutter_deriv_api/abstraction_classes/advert.dart';
import 'package:flutter_deriv_api/connection/connection_websocket.dart';

/// Account abstraction class
class Advertiser extends AdvertiserModel {
  /// Class constructor
  Advertiser({
    BinaryAPI api,
    String id,
    String name,
    String clientLoginId,
    bool isApproved,
    bool isListed,
    int createdTime,
  }) : super(
          api: api,
          id: id,
          name: name,
          clientLoginId: clientLoginId,
          isApproved: isApproved,
          isListed: isListed,
          createdTime: createdTime,
        );

  /// Extract class from a map object
  factory Advertiser.fromMap(Map<String, dynamic> advertiser) => Advertiser(
        id: advertiser['id'],
        name: advertiser['name'],
        clientLoginId: advertiser['client_loginid'],
        isListed: advertiser['is_listed'] == 1,
        isApproved: advertiser['is_approved'] == 1,
        createdTime: advertiser['created_time'],
      );

  /// Advert abstraction
  Advert _advert;

  /// Get advert
  Advert get advert => _advert = _advert ?? Advert(api: api);

  /// Update desired class fields
  Advertiser copyWith({bool isListed, String name}) => Advertiser(
        id: id,
        name: name ?? this.name,
        isApproved: isApproved,
        isListed: isListed ?? this.isListed,
        createdTime: createdTime,
      );

  /// Convert object to a map
  Map<String, dynamic> toMap() => <String, dynamic>{
        'name': name,
        'is_listed': isListed ? 1 : 0,
      };

  /// Get advertiser information
  Future<Advertiser> getInformation() async {
    final Map<String, dynamic> response = await api.p2pAgentInfo();

    if (response.containsKey('error')) {
      throw Exception(response['error']['message']);
    } else {
      return Advertiser.fromMap(response['p2p_advertiser_info']);
    }
  }

  /// Update advertizer information
  Future<Advertiser> update() async {
    final Map<String, dynamic> response = await api.p2pAgentUpdate(toMap());

    if (response.containsKey('error')) {
      throw Exception(response['error']['message']);
    } else {
      return Advertiser.fromMap(response['p2p_advertiser_update']);
    }
  }

  /// Get advertiser adverts
  Future<List<Advert>> getAdverts({
    bool isSell,
    int start,
    int count,
  }) async {
    Map<String, dynamic> response;
    List<Advert> adverts = <Advert>[];

    response = await api.p2pAdvertiserAdverts(limit: count, offset: start);

    if (response.containsKey('error')) {
      throw Exception(response['error']['message']);
    } else {
      response['p2p_advertiser_adverts']['list'].forEach(
        (Map<String, dynamic> response) => adverts.add(
          Advert.fromMap(response),
        ),
      );

      adverts = adverts.where((Advert advert) => advert.isActive).toList();
    }

    return adverts;
  }
}

import 'package:flutter_deriv_api/models/base.dart';
import 'package:flutter_deriv_api/connection/connection_websocket.dart';

/// A class for keeping advertiser information
class AdvertiserModel extends BaseModel {
  /// Class constructor
  AdvertiserModel({
    BinaryAPI api,
    this.id,
    this.name,
    this.clientLoginId,
    this.isApproved,
    this.isListed,
    this.createdTime,
  }) : super(api: api);

  /// The advertiser's identification number
  final String id;

  /// The advertiser's displayed name
  final String name;

  /// The login id of the advertiser
  final String clientLoginId;

  /// The approval status of the advertiser
  final bool isApproved;

  /// Indicates if the advertiser's active adverts are listed
  final bool isListed;

  /// The epoch time that the client became an advertiser
  final int createdTime;
}

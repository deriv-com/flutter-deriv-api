/// A class for keeping advertiser information
class Advertiser {
  /// Class constructor
  Advertiser({
    this.id,
    this.name,
    this.clientLoginId,
    this.isApproved,
    this.isListed,
    this.createdTime,
  });

  /// Extract class information from a map object
  Advertiser.fromMap(Map<String, dynamic> advertiser)
      : id = advertiser['id'],
        name = advertiser['name'],
        clientLoginId = advertiser['client_loginid'],
        isListed = advertiser['is_listed'] == 1,
        isApproved = advertiser['is_approved'] == 1,
        createdTime = advertiser['created_time'];

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

  @override
  String toString() => 'Agent { id: $id (${clientLoginId}) }';
}

/// Advertiser information class
class Advertiser {
  /// Initializes
  Advertiser(
      {this.id,
      this.clientLoginId,
      this.createdTime,
      this.name,
      this.isListed,
      this.isApproved});

  /// Initializes from JSON
  Advertiser.fromJson(Map<String, dynamic> advertiser)
      : id = advertiser['id'],
        clientLoginId = advertiser['client_loginid'],
        createdTime = advertiser['created_time'],
        name = advertiser['name'],
        isListed = advertiser['is_listed'] == 1,
        isApproved = advertiser['is_approved'] == 1;

  /// LoginId of client this advertiser info belong to
  final String clientLoginId;

  /// The epoch time that the client became an advertiser.
  final int createdTime;

  /// The advertiser's identification number.
  final String id;

  /// The approval status of the advertiser.
  final bool isApproved;

  /// Indicates if the advertiser's active adverts are listed. When `0`, adverts won't be listed regardless of they are active or not.
  final bool isListed;

  /// The advertiser's displayed name.
  final String name;

  /// Clone with different params
  Advertiser copyWith({bool isListed, String name}) => Advertiser(
        id: id,
        createdTime: createdTime,
        isListed: isListed ?? this.isListed,
        isApproved: isApproved,
        name: name ?? this.name,
      );

  @override
  String toString() => 'Agent { id: $id (${clientLoginId}) }';
}

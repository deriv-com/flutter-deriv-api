class Advertiser {
  final String clientLoginId;
  final int createdTime;
  final String id;
  final bool isApproved;
  final bool isListed;
  final String name;

  Advertiser(
      {this.id,
      this.clientLoginId,
      this.createdTime,
      this.name,
      this.isListed,
      this.isApproved});

  Advertiser.fromMap(Map<String, dynamic> advertiser)
      : id = advertiser['id'],
        clientLoginId = advertiser['client_loginid'],
        createdTime = advertiser['created_time'],
        name = advertiser['name'],
        isListed = advertiser['is_listed'] == 1 ? true : false,
        isApproved = advertiser['is_approved'] == 1 ? true : false;

  Advertiser copyWith({bool isListed, String name}) => Advertiser(
        id: id,
        createdTime: createdTime,
        isListed: isListed ?? this.isListed,
        isApproved: isApproved,
        name: name ?? this.name,
      );

  Map<String, dynamic> toMap() => <String, dynamic>{
        'name': name,
        'is_listed': isListed ? 1 : 0,
      };

  @override
  String toString() => 'Agent { id: $id (${clientLoginId}) }';
}

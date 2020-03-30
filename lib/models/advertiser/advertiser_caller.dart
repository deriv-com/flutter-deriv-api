import 'package:flutter_deriv_api/api/p2p_advertiser_info_receive.dart';
import 'package:flutter_deriv_api/api/response.dart';
import 'package:flutter_deriv_api/models/advertiser/advertiser.dart';
import 'package:flutter_deriv_api/services/api_caller.dart';

///
class AdvertiserCaller with ApiCaller<Advertiser> {
  @override
  Advertiser responseToModel(Response response) {
    if (response.error == null) {
      switch (response.msgType) {
        case 'p2p_advertiser_info':
          final P2pAdvertiserInfoResponse advertiserInfoResponse = response;
          return fromJson(advertiserInfoResponse.p2pAdvertiserInfo);
          break;
      }
    }
    return null;
  }

  ///
  Advertiser fromJson(Map<String, dynamic> map) => Advertiser(
      id: map['id'],
      clientLoginId: map['client_loginid'],
      createdTime: map['created_time'],
      name: map['name'],
      isListed: map['is_listed'] == 1,
      isApproved: map['is_approved'] == 1);
}

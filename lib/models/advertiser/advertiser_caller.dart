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
          return Advertiser.fromJson(advertiserInfoResponse.p2pAdvertiserInfo);
          break;
      }
    }
    return null;
  }
}

import '../../api/p2p_advert_create_receive.dart';
import '../../api/p2p_advert_info_receive.dart';
import '../../api/p2p_advert_update_receive.dart';
import '../../api/response.dart';
import '../../services/api_caller.dart';
import '../advert/advert.dart';

/// ApiCaller to get [Advert] model from API calls
class AdvertCaller with ApiCaller<Advert> {
  @override
  Advert responseToModel(Response response) {
    if (response.error == null) {
      switch (response.msgType) {
        case 'p2p_advert_info':
          final P2pAdvertInfoResponse infoResponse = response;
          return Advert.fromJson(infoResponse.p2pAdvertInfo);
          break;
        case 'p2p_advert_create':
          final P2pAdvertCreateResponse createResponse = response;
          return Advert.fromJson(createResponse.p2pAdvertCreate);
          break;
        case 'p2p_advert_update':
          final P2pAdvertUpdateResponse updateResponse = response;
          return Advert.fromJson(updateResponse.p2pAdvertUpdate);
          break;
      }
    }
    return null;
  }
}

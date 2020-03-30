import 'package:flutter_deriv_api/api/response.dart';
import 'package:flutter_deriv_api/models/advert/advert.dart';
import 'package:flutter_deriv_api/services/api_caller.dart';

///
class AdvertCaller with ApiCaller<Advert> {
  @override
  Advert responseToModel(Response response) => Advert();
}

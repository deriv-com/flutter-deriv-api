import 'dart:async';
import 'package:flutter_deriv_api/helpers.dart';
import 'package:flutter_deriv_api/mock_data/offer_list.dart';
import 'package:intl/intl.dart';

///
class MockServer {
  ///
  factory MockServer.instance() {
    mockOfferList.addAll(offerList);

    if (_instance != null && _instance._streamCtrl.isClosed) {
      _instance._streamCtrl = StreamController<Map<String, dynamic>>();
    }
    return _instance;
  }

  MockServer._privateConstructor();

  ///
  StreamController<Map<String, dynamic>> _streamCtrl =
      StreamController<Map<String, dynamic>>();

  ///
  List<Map<String, dynamic>> orderList = <Map<String, dynamic>>[];

  ///
  static List<Map<String, dynamic>> mockOfferList = <Map<String, dynamic>>[];
  static final MockServer _instance = MockServer._privateConstructor();

  ///
  Stream<Map<String, dynamic>> get stream => _streamCtrl.stream;

  ///
  StreamSink<Map<String, dynamic>> get sink => _streamCtrl.sink;

  ///
  void add(Map<String, dynamic> req) => getData(req);

  ///
  void getData(Map<String, dynamic> req) {
    Map<String, dynamic> response = <String, dynamic>{};
    try {
      if (req.containsKey('p2p_offer_list')) {
        print(req);
        final List<Map<String, dynamic>> offers = mockOfferList
            .where((Map<String, dynamic> o) => o['type'] == req['type'])
            .toList();
        final int maxPerPage = offers.length > (req['limit'] ?? 50)
            ? (req['limit'] ?? 50)
            : offers.length;
        response = <String, dynamic>{
          'msg_type': 'p2p_offer_list',
          'p2p_offer_list': <String, dynamic>{
            'list': offers
                .where((Map<String, dynamic> o) => o['type'] == req['type'])
                .toList()
                .sublist(req['offset'] ?? 0, (req['offset'] ?? 0) + maxPerPage),
          },
        };
      } else if (req.containsKey('p2p_offer_create')) {
        final int currentTime =
            (DateTime.now().toUtc().millisecondsSinceEpoch / 1000).floor();

        final int id = getRandomId();

        final NumberFormat numberFormat = NumberFormat('##0.00');

        final Map<String, dynamic> offer = <String, dynamic>{
          'offer_id': id.toString,
          'account_currency': req['account_currency'],
          'agent_id': '321',
          'agent_name': req['agent_name'],
          'amount': req['amount'].toDouble(),
          'amount_display': numberFormat.format(req['amount']),
          'amount_used': 0.0,
          'amount_used_display': numberFormat.format(0.0),
          'country': 'Itally',
          'created_time': currentTime,
          'description': req['description'],
          'is_active': 1,
          'local_currency': req['local_currency'],
          'max_order_amount': req['max_amount'],
          'max_order_amount_display':
              numberFormat.format(req['max_order_amount']),
          'payment_method': 'offer-method',
          'min_order_amount': req['min_amount'],
          'min_order_amount_display':
              numberFormat.format(req['min_order_amount']),
          'price': req['price'].toDouble(),
          'price_display': numberFormat.format(req['price']),
          'rate': req['rate'].toDouble(),
          'rate_display': numberFormat.format(req['rate']),
          'type': req['type'],
        };

        mockOfferList.add(offer);

        response = <String, dynamic>{
          'msg_type': 'p2p_offer_create',
          'p2p_offer_create': mockOfferList.last,
        };
      } else if (req.containsKey('time')) {
        response = <String, dynamic>{
          'msg_type': 'time',
          'time':
              (DateTime.now().toUtc().millisecondsSinceEpoch / 1000).floor(),
        };
      } else if (req.containsKey('p2p_order_create')) {
        final int currentTime =
            (DateTime.now().toUtc().millisecondsSinceEpoch / 1000).floor();

        final Map<String, dynamic> offer = Map<String, dynamic>.from(
            mockOfferList.firstWhere((Map<String, dynamic> o) =>
                o['offer_id'] == req['offer_id'].toString()));
        final Map<String, dynamic> order = <String, dynamic>{
          'account_currency': offer['account_currency'],
          'agent_id': offer['agent_id'],
          'agent_name': offer['agent_name'],
          'amount': double.parse(req['amount'].toString()),
          'amount_display': req['amount'].toString(),
          'created_time': currentTime,
          'expiry_time': currentTime + 7200,
          'local_currency': offer['local_currency'],
          'offer_id': offer['offer_id'].toString(),
          'order_description': offer['description'],
          'order_id': (req['offer_id'] + 1000).toString(),
          'price': offer['price'],
          'price_display': offer['price_display'],
          'rate': offer['rate'],
          'rate_display': offer['rate_display'],
          'status': 'pending',
          'type': offer['type'],
        };
        orderList.add(order);

        response = <String, dynamic>{
          'msg_type': 'p2p_order_create',
          'p2p_order_create': orderList.last,
        };
      } else if (req.containsKey('p2p_order_info')) {
        final Map<String, dynamic> order = orderList.firstWhere(
            (Map<String, dynamic> o) =>
                o['order_id'] == req['order_id'].toString());

        response = <String, dynamic>{
          'msg_type': 'p2p_order_info',
          'p2p_order_info': order,
        };
      } else if (req.containsKey('p2p_order_list')) {
        response = <String, dynamic>{
          'msg_type': 'p2p_order_list',
          'p2p_order_list': <String, dynamic>{
            'list': orderList.sublist(
                req['offset'] ?? 0,
                (req['offset'] ?? 0) +
                    (req['limit'] ??
                        (orderList.length >= 50 ? 50 : orderList.length))),
          },
        };
      } else if (req.containsKey('p2p_order_confirm')) {
        final Map<String, dynamic> order = orderList.firstWhere(
            (Map<String, dynamic> o) =>
                o['order_id'] == req['order_id'].toString());
        order['client_confirmed'] = 1;
        order['status'] = 'client-confirmed';

        response = <String, dynamic>{
          'msg_type': 'p2p_order_confirm',
          'p2p_order_confirm': <String, dynamic>{
            'order_id': order['order_id'],
            'status':
                order['status'] == 'pending' ? 'client-confirmed' : 'completed',
          },
        };
      } else if (req.containsKey('p2p_order_cancel')) {
        final Map<String, dynamic> order = orderList.firstWhere(
            (Map<String, dynamic> o) =>
                o['order_id'] == req['order_id'].toString());
        order['status'] = 'cancelled';

        response = <String, dynamic>{
          'msg_type': 'p2p_order_cancel',
          'p2p_order_cancel': <String, dynamic>{
            'order_id': order['order_id'],
            'status': order['status'],
          }
        };
      }
    } on Exception catch (e, stackTrace) {
      print(e);
      print(stackTrace);

      response = <String, dynamic>{
        'error': <String, dynamic>{
          'code': 'failed_to_cancel',
          'message': e,
        },
      };
    }

    response['echo_req'] = req;
    response['req_id'] = req['req_id'];
    _streamCtrl.add(response);
  }

  ///
  int getRandomId() {
    int id = RandomGenerator.generateRandomInt(min: 1000, max: 2000);
    List<Map<String, dynamic>> offer =
        mockOfferList.where((Map<String, dynamic> o) => o['id'] == id).toList();

    while (offer.isNotEmpty) {
      id = RandomGenerator.generateRandomInt(min: 1000, max: 2000);
      offer = mockOfferList
          .where((Map<String, dynamic> o) => o['id'] == id)
          .toList();
    }
    return id;
  }

  ///
  Future<void> closeStream() async {
    await _streamCtrl.close();
  }
}

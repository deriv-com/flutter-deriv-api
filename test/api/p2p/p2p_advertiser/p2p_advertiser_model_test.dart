import 'dart:convert';
import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_deriv_api/api/p2p/p2p_advertiser/p2p_advertiser.dart';
import 'package:flutter_deriv_api/api/models/subscription_model.dart';
import 'package:flutter_deriv_api/utils/helpers.dart';

import 'p2p_advertiser_model_mock_data.dart';

void main() {
  test('p2p advertiser JSON parsing', () {
    final Map<String, dynamic> mapData = jsonDecode(p2pAdvertiserModelMockData);
    final P2PAdvertiser p2pAdvertiser =
        P2PAdvertiser.fromJson(mapData['advertiser']);
    final SubscriptionModel subscription =
        SubscriptionModel.fromJson(mapData['subscription']);

    expect(p2pAdvertiser.chatToken, 'chat_token_652346562349223');
    expect(p2pAdvertiser.chatUserId, 'p2p_user_CR_3_1587613550');
    expect(p2pAdvertiser.contactInfo, 'contact details template');
    expect(p2pAdvertiser.createdTime, getDateTime(1587613551));
    expect(p2pAdvertiser.defaultAdvertDescription, 'instructions template');
    expect(p2pAdvertiser.id, '3');
    expect(p2pAdvertiser.isApproved, true);
    expect(p2pAdvertiser.isListed, false);
    expect(p2pAdvertiser.name, 'advertiser CR90000019');
    expect(p2pAdvertiser.paymentInfo, 'payment instructions template');

    expect(subscription?.id, 'cd28a29d-6100-d530-9c5b-4e39bc2aa0a7');
  });
}

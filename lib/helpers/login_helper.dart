import 'dart:convert';
import 'package:crypto/crypto.dart';

/// This function solves login challenge sent by server.
String solveLoginChallenge(String challenge) {
  final List<int> encodedAppToken = utf8.encode('deriv-go-token');
  final List<int> encodedChallenge = utf8.encode(challenge);

  final Hmac hmacSHA256 = Hmac(sha256, encodedAppToken);
  final Digest digest = hmacSHA256.convert(encodedChallenge);

  return digest.toString();
}

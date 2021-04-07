// AUTO-GENERATED - DO NOT MODIFY BY HAND
// Auto generated from 1st step of the flutter_deriv_api code generation process
// uses collected `msg_type`s from the 1st step to create a helper
// function that maps the `msg_type`s to equivalent Response objects

import '../response.dart';

/// A function that create a sub-type of [Response] based on
/// [responseMap]'s 'msg_type'
Response getGeneratedResponse(Map<String, dynamic> responseMap) {
  switch (responseMap['msg_type']) {
    default:
      return Response.fromJson(responseMap);
  }
}

import 'package:bloc/bloc.dart';

import 'package:flutter_deriv_api/api/login/login.dart';
import 'package:flutter_deriv_api/services/connection/api_manager/connection_information.dart';
import 'package:flutter_deriv_api/services/connection/http_client/http_client.dart';
import 'package:flutter_deriv_api/helpers/login_helper.dart';
import 'package:flutter_deriv_api/api/exceptions/api_base_exception.dart';

part 'login_state.dart';

/// This class handles the business logic related to in-app login.
class LoginCubit extends Cubit<LoginState> {
  /// Initializes the cubit with an initial state of `LoginInitialState`
  LoginCubit({required this.connectionInformation})
      : super(const LoginInitialState());

  /// Contains essential information for connecting to server, including `appID` and `endPoint`.
  final ConnectionInformation connectionInformation;

  final HttpClient _httpClient = HttpClient();

  /// Performs basic in-app login using `email` and `password`.
  Future<void> doSystemLogin({
    required String email,
    required String password,
  }) async {
    emit(const LoginLoadingState());
    try {
      final AppAuthorizationChallengeResponse challenge =
          await _getAppAuthorizationChallenge();

      final String solution = solveLoginChallenge(
          challenge: challenge.challenge, appToken: 'DerivToken01');

      final AppAuthorizationResponse authInfo =
          await _authorizeApp(solution: solution, expire: challenge.expire);

      final LoginResponse response = await _doLogin(
        email: email,
        password: password,
        type: 'system',
        token: authInfo.token,
      );

      emit(UserAuthorizedState(response));
    } on APIBaseException catch (e) {
      emit(LoginErrorState(e.message ?? 'An error occurred'));
    } on Exception catch (e) {
      emit(LoginErrorState(e.toString()));
    }
  }

  Future<LoginResponse> _doLogin({
    required String email,
    required String password,
    required String type,
    required String token,
  }) async {
    const String path = '/oauth2/api/v1/login';

    final Map<String, dynamic> jsonResponse = await _httpClient.post(
      url: 'https://qa48.deriv.dev$path',
      jsonBody: LoginRequest(
        type: type,
        email: email,
        password: password,
        appId: int.parse(connectionInformation.appId),
      ).toJson(),
      headers: <String, String>{'Authorization': 'Bearer $token'},
    );
    return LoginResponse.fromJson(jsonResponse);
  }

  Future<AppAuthorizationResponse> _authorizeApp({
    required String solution,
    required int expire,
  }) async {
    const String path = '/oauth2/api/v1/authorize';

    final Map<String, dynamic> jsonResponse = await _httpClient.post(
      // url: 'https://${connectionInformation.endpoint}$path',
      url: 'https://qa48.deriv.dev$path',
      jsonBody: AppAuthorizationRequest(
        solution: solution,
        expire: expire,
        appId: int.parse(connectionInformation.appId),
      ).toJson(),
    );
    return AppAuthorizationResponse.fromJson(jsonResponse);
  }

  Future<AppAuthorizationChallengeResponse>
      _getAppAuthorizationChallenge() async {
    const String path = '/oauth2/api/v1/verify';

    final Map<String, dynamic> jsonResponse = await _httpClient.post(
      url: 'https://qa48.deriv.dev$path',
      jsonBody: AppAuthorizationChallengeRequest(
        appId: int.parse(connectionInformation.appId),
      ).toJson(),
    );
    return AppAuthorizationChallengeResponse.fromJson(jsonResponse);
  }
}

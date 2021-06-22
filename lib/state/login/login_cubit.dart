import 'package:bloc/bloc.dart';

import 'package:flutter_deriv_api/api/login/login.dart';
import 'package:flutter_deriv_api/services/connection/api_manager/connection_information.dart';
import 'package:flutter_deriv_api/services/connection/http_client/http_client.dart';
import 'package:flutter_deriv_api/helpers/login_helper.dart';

part 'login_state.dart';

/// This class handles the business logic related to in-app login.
class LoginCubit extends Cubit<LoginState> {
  /// Initializes the cubit with an initial state of `LoginInitialState`
  LoginCubit({required this.connectionInformation})
      : super(const LoginInitialState());

  /// Contains essential information for connecting to server, including `appID` and `endPoint`.
  final ConnectionInformation connectionInformation;

  final HttpClient _httpClient = HttpClient();

  ///
  Future<void> doSystemLogin({
    required String email,
    required String password,
  }) async {
    emit(const LoginLoadingState());
    try {
      final AppAuthorizationChallengeResponse challenge =
          await _getAppAuthorizationChallnege();
      print(challenge.challenge);

      final String solution = solveLoginChallenge(
          challenge: challenge.challenge, appToken: 'DerivToken01');
      final AppAuthorizationResponse authInfo =
          await _authorizeApp(solution: solution, expire: challenge.expire);
      print(authInfo.token);

      emit(AppAuthorizedState(authInfo));

      final LoginResponse response = await _doLogin(
        email: email,
        password: password,
        type: 'system',
      );

      emit(UserAuthorizedState(response));
    } on Exception catch (e) {
      emit(LoginErrorState(e.toString()));
    }
  }

  Future<LoginResponse> _doLogin({
    required String email,
    required String password,
    required String type,
  }) async {
    const String url = 'https://qa48.deriv.dev/oauth2/api/v1/login';

    final Map<String, dynamic> jsonResponse = await _httpClient.post(
      url: url,
      jsonBody: LoginRequest(
        type: type,
        email: email,
        password: password,
        appId: int.parse(connectionInformation.appId),
      ).toJson(),
    );
    return LoginResponse.fromJson(jsonResponse);
  }

  Future<AppAuthorizationResponse> _authorizeApp({
    required String solution,
    required int expire,
  }) async {
    const String url = 'https://qa48.deriv.dev/oauth2/api/v1/authorize';

    final Map<String, dynamic> jsonResponse = await _httpClient.post(
      url: url,
      jsonBody: AppAuthorizationRequest(
        solution: solution,
        expire: expire,
        appId: int.parse(connectionInformation.appId),
      ).toJson(),
    );
    return AppAuthorizationResponse.fromJson(jsonResponse);
  }

  Future<AppAuthorizationChallengeResponse>
      _getAppAuthorizationChallnege() async {
    // TODO(Mohammad): change url to respect _connectionInformation.endpoint.
    const String url = 'https://qa48.deriv.dev/oauth2/api/v1/verify';

    final Map<String, dynamic> jsonResponse = await _httpClient.post(
      url: url,
      jsonBody: AppAuthorizationChallengeRequest(
        appId: int.parse(connectionInformation.appId),
      ).toJson(),
    );
    return AppAuthorizationChallengeResponse.fromJson(jsonResponse);
  }
}

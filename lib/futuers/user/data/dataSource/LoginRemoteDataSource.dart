import 'dart:convert';
import 'package:http/http.dart' as http;

class LoginRemoteDataSource {
  final http.Client client;
  LoginRemoteDataSource(this.client);

  Future<http.Response> postLogin({
    required String userId,
    required String password,
    required int languageNo,
  }) {
    final url = Uri.parse(
      'http://mdev.yemensoft.net:8087/OnyxDeliveryService/Service.svc/CheckDeliveryLogin',
    );

    final body = {
      "Value": {
        "P_LANG_NO": languageNo.toString(),
        "P_DLVRY_NO": userId,
        "P_PSSWRD": password,
      }
    };

    return client.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(body),
    );
  }
}

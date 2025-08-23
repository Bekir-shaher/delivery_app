import 'package:delivery_app/core/data/endponts.dart';
import 'package:http/http.dart' as http;

class Loginremotedatasource {
  Future postLogin({
    required String userId,
    required String password,
    required String languageNo,
  }) async {
    final response = await http.post(
      Uri.parse(Endponts.baseUrl),
      body: {
        "P_DLVRY_NO": userId,
        "P_PSSWRD": password,
        "P_LANG_NO": languageNo,
      },
    );
    return response;
  }
}

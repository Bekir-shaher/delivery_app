import 'dart:convert';
import 'package:delivery_app/core/data/endponts.dart';
import 'package:http/http.dart' as http;

class OrdersRemoteDS {
  final http.Client client;
  OrdersRemoteDS(this.client);

  Map<String, String> get _jsonHeaders => const {
    'Content-Type': 'application/json',
  };

  Future<http.Response> getBills({
    required String deliveryNo,
    required int langNo,
  }) {
    final body = {
      "Value": {"P_LANG_NO": "$langNo", "P_DLVRY_NO": deliveryNo},
    };
    return client.post(
      Uri.parse(Endponts.bills),
      headers: _jsonHeaders,
      body: jsonEncode(body),
    );
  }

  Future<http.Response> getStatusTypes({required int langNo}) {
    final body = {
      "Value": {"P_LANG_NO": "$langNo"},
    };
    return client.post(
      Uri.parse(Endponts.statusTypes),
      headers: _jsonHeaders,
      body: jsonEncode(body),
    );
  }

  Future<http.Response> getReturnReasons({required int langNo}) {
    final body = {
      "Value": {"P_LANG_NO": "$langNo"},
    };
    return client.post(
      Uri.parse(Endponts.returnReasons),
      headers: _jsonHeaders,
      body: jsonEncode(body),
    );
  }
}

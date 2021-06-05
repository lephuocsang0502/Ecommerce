import 'dart:convert';

import 'package:app/global.dart';
import 'package:app/models/order.dart';
import 'package:http/http.dart' as http;

class OrderApi {
  OrderResponse _response;
  OrderResponse get response => _response;
  Future<bool> purchase({Order order, String token}) async {
    final request = await http.post(
      "$baseServerUrl/addOrder",
      body: jsonEncode(order.toJson()),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'authorization': "Bearer $token",
      },
    );
    print(request.statusCode);
    if (request.statusCode == 201) {
      _response = OrderResponse.fromJson(json.decode(request.body));
      print(_response.code);
      return true;
    } else {
      print(jsonDecode(request.body));
      return false;
    }
  }
}

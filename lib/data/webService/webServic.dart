import 'dart:convert';

import 'package:http/http.dart' as http;

class WebService {
  Future<List<dynamic>?> getAllCoins() async {
    const url = "https://data.binance.com/api/v3/ticker/24hr";
    try {
      http.Response response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        var responseBody = jsonDecode(response.body);
        return responseBody;
      } else {
        print("status code is ${response.statusCode}");
      }
    } catch (e) {
      print(e.toString());
    }
    return null;
  }
}

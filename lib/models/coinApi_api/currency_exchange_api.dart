import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';

class CurrencyExchangeApi{

   static Future<dynamic> getData(http.Client client) async {
    var uri = Uri.parse(
        'http://api.coinlayer.com/live?access_key=${dotenv.env['ACCESS_KEY']}');
    var response = await client.get(uri);

    if (response.statusCode == 200) {
      var json = response.body;
      return jsonDecode(json)['rates'];
    } else {
      throw Exception('error');
    }
  }

  
}
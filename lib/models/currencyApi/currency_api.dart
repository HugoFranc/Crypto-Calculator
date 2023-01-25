import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';


// Coinlayer
class CurrencyApi {
  static Future<dynamic> getData(http.Client client) async {
    var uri = Uri.parse(
        'http://api.coinlayer.com/list?access_key=${dotenv.env['ACCESS_KEY']}');
    var response = await client.get(uri);

    if (response.statusCode == 200) {
      var json = response.body;
      return jsonDecode(json)['crypto'];
    } else {
      throw Exception('error');
    }
  }

 



  static List<String> parseForSymbols(dynamic information){
    var symbolList = <String>[];

    symbolList.add("Currency");
    information.forEach((key, value){
      symbolList.add(key);
    });

    return symbolList;
  }
}

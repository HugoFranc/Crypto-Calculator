import 'package:crypto_app/models/currencyApi/currency_api.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:http/testing.dart';
import 'package:mockito/annotations.dart';



@GenerateMocks([http.Client])
void main() {
  group('getData', () {
    test('should return the proper json', () async {
      const response = '{"success":true,"crypto":{"611":{"symbol":"611","name":"SixEleven","name_full":"SixEleven (611)","max_supply":611000,"icon_url":"https://assets.coinlayer.com/icons/611.png"},"ABC":{"symbol":"ABC","name":"AB-Chain","name_full":"AB-Chain (ABC)","max_supply":210000000,"icon_url":"https://assets.coinlayer.com/icons/ABC.png"},"BTC":{"symbol":"BTC","name":"Bitcoin Test","name_full":"Top Secret Bitcoin","max_supply":9480192,"icon_url":"https://assets.coinlayer.com/icons/ABC.png"}},"fiat":{"AED":"United Arab Emirates Dirham","AFN":"Afghan Afghani","ALL":"Albanian Lek","AMD":"Armenian Dram","ANG":"Netherlands Antillean Guilder","AOA":"Angolan Kwanza"}}';
      final mockHttpClient = MockClient((http.Request request) async {
        return http.Response(response, 200);
      });
      var uri = Uri.parse('http://api.coinlayer.com/list?access_key=01db0a2dacb0d6e29c0a0327c7c08643');

      dynamic currencies = await CurrencyApi.getData(mockHttpClient);

      expect(currencies.runtimeType, '');
    });
  });
}

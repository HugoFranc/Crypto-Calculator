
import 'package:crypto_app/controller/load_page_info.dart';
import 'package:crypto_app/ui/Widgets/currency_listview.dart';
import 'package:flutter/material.dart';

import '../models/currencyApi/currency_api.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  final bool apiRequest;


  HomePage(
      {Key? key,
      required this.apiRequest,})
      : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  LoadPage mainInfo = LoadPage();

  // Without API uncomment the following: 

  /* var apiMockResponse = jsonDecode(
          '{"crypto":{"ABC":{"symbol":"ABC","name":"AB-Chain","name_full":"AB-Chain (ABC)","max_supply":210000000,"icon_url":"https://assets.coinlayer.com/icons/ABC.png"},"ACP":{"symbol":"ACP","name":"Anarchists Prime","name_full":"Anarchists Prime (ACP)","max_supply":53760000,"icon_url":"https://assets.coinlayer.com/icons/ACP.png"},"ACT":{"symbol":"ACT","name":"ACT","name_full":"ACT (ACT)","max_supply":10000000000,"icon_url":"https://assets.coinlayer.com/icons/ACT.png"},"ACT*":{"symbol":"ACT*","name":"Achain","name_full":"Achain (ACT*)","max_supply":1000000000,"icon_url":"https://assets.coinlayer.com/icons/ACT*.png"},"ADA":{"symbol":"ADA","name":"Cardano","name_full":"Cardano (ADA)","max_supply":45000000000,"icon_url":"https://assets.coinlayer.com/icons/ADA.png"},"ADCN":{"symbol":"ADCN","name":"Asiadigicoin","name_full":"Asiadigicoin (ADCN)","max_supply":42000000,"icon_url":"https://assets.coinlayer.com/icons/ADCN.png"},"ADL":{"symbol":"ADL","name":"Adelphoi","name_full":"Adelphoi (ADL)","max_supply":100000000,"icon_url":"https://assets.coinlayer.com/icons/ADL.png"},"ADX":{"symbol":"ADX","name":"AdEx","name_full":"AdEx (ADX)","max_supply":100000000,"icon_url":"https://assets.coinlayer.com/icons/ADX.png"},"ADZ":{"symbol":"ADZ","name":"Adzcoin","name_full":"Adzcoin (ADZ)","max_supply":84000000,"icon_url":"https://assets.coinlayer.com/icons/ADZ.png"},"AE":{"symbol":"AE","name":"Aeternity","name_full":"Aeternity (AE)","max_supply":273685831,"icon_url":"https://assets.coinlayer.com/icons/AE.png"},"AGI":{"symbol":"AGI","name":"SingularityNET","name_full":"SingularityNET (AGI)","max_supply":1000000000,"icon_url":"https://assets.coinlayer.com/icons/AGI.png"},"AIB":{"symbol":"AIB","name":"AdvancedInternetBlock","name_full":"AdvancedInternetBlock (AIB)","max_supply":314159265359,"icon_url":"https://assets.coinlayer.com/icons/AIB.png"},"AIDOC":{"symbol":"AIDOC","name":"AI Doctor","name_full":"AI Doctor (AIDOC)","max_supply":777775241,"icon_url":"https://assets.coinlayer.com/icons/AIDOC.png"},"AION":{"symbol":"AION","name":"Aion","name_full":"Aion (AION)","max_supply":465934586.66,"icon_url":"https://assets.coinlayer.com/icons/AION.png"},"AIR":{"symbol":"AIR","name":"AirToken","name_full":"AirToken (AIR)","max_supply":1491492558,"icon_url":"https://assets.coinlayer.com/icons/AIR.png"},"ALT":{"symbol":"ALT","name":"ALTcoin","name_full":"ALTcoin (ALT)","max_supply":134063,"icon_url":"https://assets.coinlayer.com/icons/ALT.png"},"AMB":{"symbol":"AMB","name":"Ambrosus","name_full":"Ambrosus (AMB)","max_supply":361477438,"icon_url":"https://assets.coinlayer.com/icons/AMB.png"},"AMM":{"symbol":"AMM","name":"MicroMoney","name_full":"MicroMoney (AMM)","max_supply":17532943.47918,"icon_url":"https://assets.coinlayer.com/icons/AMM.png"},"ANT":{"symbol":"ANT","name":"Aragon","name_full":"Aragon (ANT)","max_supply":39609524,"icon_url":"https://assets.coinlayer.com/icons/ANT.png"},"APC":{"symbol":"APC","name":"AlpaCoin","name_full":"AlpaCoin (APC)","max_supply":"N/A","icon_url":"https://assets.coinlayer.com/icons/APC.png"},"APPC":{"symbol":"APPC","name":"AppCoins","name_full":"AppCoins (APPC)","max_supply":246203093,"icon_url":"https://assets.coinlayer.com/icons/APPC.png"},"ARC":{"symbol":"ARC","name":"ArcticCoin","name_full":"ArcticCoin (ARC)","max_supply":60000000,"icon_url":"https://assets.coinlayer.com/icons/ARC.png"},"ARCT":{"symbol":"ARCT","name":"ArbitrageCT","name_full":"ArbitrageCT (ARCT)","max_supply":152029112,"icon_url":"https://assets.coinlayer.com/icons/ARCT.png"},"ARDR":{"symbol":"ARDR","name":"Ardor","name_full":"Ardor (ARDR)","max_supply":1000000000,"icon_url":"https://assets.coinlayer.com/icons/ARDR.png"},"ARK":{"symbol":"ARK","name":"ARK","name_full":"ARK (ARK)","max_supply":125000000,"icon_url":"https://assets.coinlayer.com/icons/ARK.png"},"ARN":{"symbol":"ARN","name":"Aeron","name_full":"Aeron (ARN)","max_supply":100000000,"icon_url":"https://assets.coinlayer.com/icons/ARN.png"},"ASAFE2":{"symbol":"ASAFE2","name":"Allsafe","name_full":"Allsafe (ASAFE2)","max_supply":15000000,"icon_url":"https://assets.coinlayer.com/icons/ASAFE2.png"},"AST":{"symbol":"AST","name":"AirSwap","name_full":"AirSwap (AST)","max_supply":500000000,"icon_url":"https://assets.coinlayer.com/icons/AST.png"},"ATB":{"symbol":"ATB","name":"ATB coin","name_full":"ATB coin (ATB)","max_supply":"N/A","icon_url":"https://assets.coinlayer.com/icons/ATB.png"}}}')[
      'crypto'];
  */

  late Future<dynamic> information;
  late List listLog;


  @override

  void initState() {
    super.initState();
    
    // Without API comment the followin: 
    information = CurrencyApi.getData(http.Client());


    // Without API uncomment the following: 

    /*
    mainInfo.setInformation = apiMockResponse;
    mainInfo.setListLogs = apiMockResponse;
    */
  
  }

  Widget build(BuildContext context) {

    return widget.apiRequest
        ? FutureBuilder(
            future: information,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                dynamic info = snapshot.data;
                mainInfo.setListLogs = info;
              
                

                return ListViewOfCurrencies(listLog: mainInfo.getListLogs);
              } else if (snapshot.hasError) {
                return Text(
                  '${snapshot.error}',
                  style: const TextStyle(
                      color: Color(0xFFFFFFFF),
                      fontFamily: 'Open Sans',
                      fontSize: 24),
                );
              }

              return const CircularProgressIndicator();
            },
          )
        : 
          ListViewOfCurrencies(listLog: mainInfo.getListLogs);
  }
}

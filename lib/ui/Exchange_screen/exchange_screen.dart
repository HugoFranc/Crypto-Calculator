
import 'package:crypto_app/controller/load_exchange_info.dart';
import 'package:crypto_app/models/coinApi_api/currency_exchange.dart';
import 'package:crypto_app/models/coinApi_api/currency_exchange_api.dart';
import 'package:crypto_app/ui/Widgets/appbar_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;

class ExchangeScreen extends StatefulWidget {
  const ExchangeScreen({Key? key}) : super(key: key);

  @override
  State<ExchangeScreen> createState() => _ExchangeScreenState();
}

class _ExchangeScreenState extends State<ExchangeScreen> {
  TextEditingController textController = TextEditingController();
  String dropDownValueOne = "Currency";

  // true = first dropDown false = second dropDown
  bool dropDownSelector = true;

  // visible widget control

  bool visibleControl = false;

  var resultOfExchange;

  LoadExchange exchangeInfo = LoadExchange();
  CurrencyExchange exchange = CurrencyExchange();

  late Future<dynamic> exchangeInformation;

  @override
  void initState() {
    super.initState();

    exchangeInformation = CurrencyExchangeApi.getData(http.Client());
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF242934),
      appBar: AppBar(
        title: const AppBarTittle(
          name: "Current Exchange",
        ),
        backgroundColor: const Color(0xFF242934),
      ),
      body: FutureBuilder(
        future: exchangeInformation,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            dynamic exchangeInformation = snapshot.data;

            exchangeInfo.setExchanges = exchangeInformation;
            exchangeInfo.setSymbols = exchangeInformation;

            return Container(
              margin: const EdgeInsets.all(20),
              child: Column(
                children: [
                  Spacer(),
                  Visibility(
                      visible: visibleControl,
                      child: Text(
                        '\$ ${resultOfExchange}',
                        style:GoogleFonts.openSans(
                          color: Color(0xFFFFFFFF), fontSize: 20)
                      )),
                  Padding(
                    padding: EdgeInsets.only(top: 8),
                    child: Visibility(
                        visible: visibleControl,
                        child: Text(
                            'Exchange from ${exchangeInfo.currencyOne} to ${exchangeInfo.currencyTwo}',
                            style:GoogleFonts.openSans(
                          color: Color(0xFFFFFFFF).withOpacity(.8), fontSize: 16))),
                  ),
                  // ignore: prefer_const_literals_to_create_immutables
                  Spacer(),
                  TextField(
                    style: const TextStyle(color: Color(0xFFFFFFFF)),
                    controller: textController,
                    keyboardType: TextInputType.number,
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                      FilteringTextInputFormatter.digitsOnly,
                    ],
                    decoration: InputDecoration(
                      prefix: Padding(
                          padding: EdgeInsets.only(left: 4, right: 12),
                          child: Text('\$')),
                      prefixStyle: TextStyle(color: Color(0xFFFFFFFF)),
                      labelText: "Amount to exchange \$",
                      labelStyle: TextStyle(color: Color(0xFFFFFFFF)),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Color(0xFFFFFFFF).withOpacity(.4))),
                      border: OutlineInputBorder(),
                    ),
                  ),

                  const Padding(padding: EdgeInsets.only(bottom: 30)),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      // ignore: prefer_const_literals_to_create_immutables
                      children: [
                        DropDownOfCurrencies(
                          dropDownValue: exchangeInfo.currencyOne.isNotEmpty ? exchangeInfo.currencyOne : dropDownValueOne,
                          dropDownSelector: dropDownSelector,
                          exchangeInfo: exchangeInfo,
                        ),
                        Spacer(),
                        Padding(
                          padding: EdgeInsets.only(right: 4),
                          child: DropDownOfCurrencies(
                            dropDownValue: exchangeInfo.currencyTwo.isNotEmpty ? exchangeInfo.currencyTwo : dropDownValueOne,
                            dropDownSelector: !dropDownSelector,
                            exchangeInfo: exchangeInfo,
                          ),
                        )
                      ],
                    ),
                  ),
                  const Spacer(),
                  TextButton(
                      onPressed: () {
                        exchangeInfo.setAmount = textController.text;

                        if (exchangeInfo.getValidExchange) {
                          resultOfExchange = exchange.convertCurrencies(
                              exchangeInfo.currencyOne,
                              exchangeInfo.currencyTwo,
                              exchangeInfo.amount,
                              exchangeInfo);

                          setState(() {
                            visibleControl = true;
                          });
                        } else {
                          setState(() {
                            visibleControl = false;
                          });
                        }
                      },
                      child: const Text(
                        'Calculate',
                        style:
                            TextStyle(color: Color(0xFFFFFFFF), fontSize: 18),
                      )),
                ],
              ),
            );
          } else if (snapshot.hasError) {
            return Text("Snapshot has an error: ${snapshot.hasError}");
          }
          return CircularProgressIndicator();
        },
      ),
    );
  }
}

// ignore: must_be_immutable
class DropDownOfCurrencies extends StatefulWidget {
  String dropDownValue;
  bool dropDownSelector;
  LoadExchange exchangeInfo;

  DropDownOfCurrencies(
      {Key? key,
      required this.dropDownValue,
      required this.dropDownSelector,
      required this.exchangeInfo})
      : super(key: key);

  @override
  State<DropDownOfCurrencies> createState() => _DropDownOfCurrenciesState();
}

class _DropDownOfCurrenciesState extends State<DropDownOfCurrencies> {
  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      menuMaxHeight: 200,
      dropdownColor: const Color(0xFF242934).withOpacity(.8),
      value: widget.dropDownValue,
      items:
          // First dropDown
          widget.exchangeInfo.getSymbols
              .map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          enabled: value != widget.dropDownValue,
          value: value,
          child: Text(
            value,
            style: const TextStyle(color: Color(0xFFFFFFFF)),
          ),
        );
      }).toList(),
      onChanged: (String? newValue) {
        setState(() {
          widget.dropDownValue = newValue!;

          widget.dropDownSelector
              ? widget.exchangeInfo.currencyOne = newValue
              : widget.exchangeInfo.currencyTwo = newValue;
        });
      },
    );
  }
}


import 'package:crypto_app/ui/Widgets/appbar_widget.dart';
import 'package:crypto_app/ui/Widgets/crypto_card_widget.dart';
import 'package:flutter/material.dart';

class ListViewOfCurrencies extends StatefulWidget {
  final List listLog;

  const ListViewOfCurrencies({Key? key, required this.listLog})
      : super(key: key);

  @override
  State<ListViewOfCurrencies> createState() => _ListViewOfCurrenciesdState();
}


class _ListViewOfCurrenciesdState extends State<ListViewOfCurrencies> {
  @override
  Widget build(BuildContext context) {
    var sizeOfScreen = MediaQuery.of(context).size;
    var leftIndentation = sizeOfScreen.width * 0.18;
    var rightIndentation = sizeOfScreen.width * 0.06;

    return Scaffold(
      backgroundColor: const Color(0xFF242934),
            appBar: AppBar(
     
          backgroundColor: const Color(0xFF242934).withOpacity(.7),
          title:  const AppBarTittle(name: "Currencies",),

          
        ),
      body: Padding(
        padding: EdgeInsets.only(top: 20),
        child: ListView.builder(
          
            itemCount: widget.listLog.length - 1,
            itemBuilder: (context, index) {
              return Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 5, bottom: 12),
                    child: CryptoCard(
                        symbol: widget.listLog[index].symbol,
                        name: widget.listLog[index].name_full,
                        url: widget.listLog[index].icon_url,
                        supply: widget.listLog[index].max_supply),
                  ),
           
                ],
              );
            }),
      ),
    );
  }
}
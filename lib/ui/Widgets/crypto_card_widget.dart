import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CryptoCard extends StatefulWidget {
  final String symbol;
  final String name;
  final String url;
  final dynamic supply;

  const CryptoCard(
      {Key? key,
      required this.symbol,
      required this.name,
      required this.url,
      required this.supply})
      : super(key: key);

  @override
  State<CryptoCard> createState() => _CryptoCardState();
}

class _CryptoCardState extends State<CryptoCard> {
  @override
  Widget build(BuildContext context) {
    var sizeOfScreen = MediaQuery.of(context).size;
    var leftIndentation = sizeOfScreen.width * 0.04;
    var rightIndentation = sizeOfScreen.width * 0.04;
    return Container(
      decoration: BoxDecoration(
          color: Color.fromARGB(255, 52, 58, 74), borderRadius: BorderRadius.circular(16)),
      margin: EdgeInsets.only(left: leftIndentation, right: rightIndentation),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 20.0,
              backgroundImage: NetworkImage(widget.url),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 12),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(widget.symbol,
                      style: GoogleFonts.openSans(
                          color: Color(0xFFFFFFFF), fontSize: 16)),
                  Text(widget.name,
                      style: GoogleFonts.openSans(
                          color: Color(0xFFFFFFFF), fontSize: 14)),
                ],
              ),
            ),
            Expanded(
              child: Text('${widget.supply}',
                  textAlign: TextAlign.end,
                  style: GoogleFonts.openSans(
                          color: Color(0xFFFFFFFF), fontSize: 15)),
            ),
          ],
        ),
      ),
    );
  }
}

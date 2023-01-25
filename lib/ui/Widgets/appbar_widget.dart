import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppBarTittle extends StatelessWidget {
  final String name;
   const AppBarTittle({Key? key, required this.name}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var sizeOfScreen = MediaQuery.of(context).size;
    var leftIndentation = sizeOfScreen.width * 0.02;
    var topScreenContainer = sizeOfScreen.height * 0.02;
    return Container(

      padding: EdgeInsets.only(top: topScreenContainer),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(
              left: leftIndentation,
              bottom: 20
            ),
            child:  Align(
              alignment: Alignment.centerLeft,
              child: Text(
                name,
                style: GoogleFonts.openSans(
                          color: Color(0xFFFFFFFF), fontSize: 24),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
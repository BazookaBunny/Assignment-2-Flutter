import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CalculatorButton extends StatelessWidget {
  final String text;
  final double textSize;
  final Function callback;

  const CalculatorButton({
    required this.text,
    required this.textSize,
    required this.callback,
  });

  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10.0),
      child: SizedBox(
        width: 70,
        height: 70,
        child: TextButton(
          style: ButtonStyle(
              backgroundColor:
                  MaterialStateProperty.all<Color>(Colors.blueGrey),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0),
                      side: BorderSide(color: Colors.black54)))),
          child: Text(
            text,
            style: GoogleFonts.rubik(
              textStyle: TextStyle(
                color: Colors.black54,
                fontSize: textSize,
              ),
            ),
          ),
          onPressed: () => callback(text),
        ),
      ),
    );
  }
}

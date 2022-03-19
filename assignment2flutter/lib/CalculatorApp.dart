// Copyright 2018 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:assignment2flutter/widgets/calculator_button.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const CalculatorApp());
}

class CalculatorApp extends StatefulWidget {
  const CalculatorApp({Key? key}) : super(key: key);

  CalculatorAppState createState() => CalculatorAppState();
}

class CalculatorAppState extends State<CalculatorApp> {
  late int fNum;
  late int sNum;
  late String history = '0';
  late String textToDisplay = '0';
  late String res;
  late String operation;

  void btnOnClick(String btnVal) {
    print(btnVal);

    if (btnVal == 'C') {
      textToDisplay = '';
      fNum = 0;
      sNum = 0;
      res = '0';
    } else if (btnVal == 'AC') {
      textToDisplay = '';
      fNum = 0;
      sNum = 0;
      res = '0';
      history = '0';
    } else if (btnVal == '+/-') {
      if (textToDisplay[0] != '-')
        res = '-' + textToDisplay;
      else
        res = textToDisplay.substring(1); //remove first character

    } else if (btnVal == '<') {
      //remove last character of number - back button

      res = textToDisplay.substring(0, textToDisplay.length - 1);
    } else if (btnVal == '+' ||
        btnVal == '-' ||
        btnVal == 'x' ||
        btnVal == '/') {
      fNum = int.parse(textToDisplay);
      res = '';
      operation = btnVal;
    } else if (btnVal == '=') {
      sNum = int.parse(textToDisplay);

      if (operation == '+') {
        res = (fNum + sNum).toString();
        history = fNum.toString() + operation.toString() + sNum.toString();
      }

      if (operation == '-') {
        res = (fNum - sNum).toString();
        history = fNum.toString() + operation.toString() + sNum.toString();
      }

      if (operation == 'x') {
        res = (fNum * sNum).toString();
        history = fNum.toString() + operation.toString() + sNum.toString();
      }

      if (operation == '/') {
        res = (fNum / sNum).toString();
        history = fNum.toString() + operation.toString() + sNum.toString();
      }
    } else {
      res = int.parse(textToDisplay + btnVal).toString();
    }

    setState(() {
      textToDisplay = res;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculator',
      theme: ThemeData(primarySwatch: Colors.blueGrey),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Calculator'),
        ),
        backgroundColor: Colors.white,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                width: 300,
                alignment: Alignment.centerRight,
                child: Padding(
                  padding: EdgeInsets.all(0),
                  child: Text(
                    history,
                    style: GoogleFonts.rubik(
                      textStyle: TextStyle(
                        fontSize: 24,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                width: 350,
                alignment: Alignment.centerRight,
                child: Padding(
                  padding: EdgeInsets.all(25),
                  child: Text(
                    textToDisplay,
                    style: GoogleFonts.rubik(
                      textStyle: TextStyle(
                        fontSize: 48,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CalculatorButton(
                    text: 'AC',
                    textSize: 20,
                    callback: btnOnClick,
                  ),
                  CalculatorButton(
                    text: 'C',
                    textSize: 20,
                    callback: btnOnClick,
                  ),
                  CalculatorButton(
                    text: '<',
                    textSize: 20,
                    callback: btnOnClick,
                  ),
                  CalculatorButton(
                    text: '/',
                    textSize: 20,
                    callback: btnOnClick,
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CalculatorButton(
                    text: '9',
                    textSize: 20,
                    callback: btnOnClick,
                  ),
                  CalculatorButton(
                    text: '8',
                    textSize: 20,
                    callback: btnOnClick,
                  ),
                  CalculatorButton(
                    text: '7',
                    textSize: 20,
                    callback: btnOnClick,
                  ),
                  CalculatorButton(
                    text: 'x',
                    textSize: 20,
                    callback: btnOnClick,
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CalculatorButton(
                    text: '6',
                    textSize: 20,
                    callback: btnOnClick,
                  ),
                  CalculatorButton(
                    text: '5',
                    textSize: 20,
                    callback: btnOnClick,
                  ),
                  CalculatorButton(
                    text: '4',
                    textSize: 20,
                    callback: btnOnClick,
                  ),
                  CalculatorButton(
                    text: '-',
                    textSize: 20,
                    callback: btnOnClick,
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CalculatorButton(
                    text: '3',
                    textSize: 20,
                    callback: btnOnClick,
                  ),
                  CalculatorButton(
                    text: '2',
                    textSize: 20,
                    callback: btnOnClick,
                  ),
                  CalculatorButton(
                    text: '1',
                    textSize: 20,
                    callback: btnOnClick,
                  ),
                  CalculatorButton(
                    text: '+',
                    textSize: 20,
                    callback: btnOnClick,
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CalculatorButton(
                    text: '+/-',
                    textSize: 20,
                    callback: btnOnClick,
                  ),
                  CalculatorButton(
                    text: '0',
                    textSize: 20,
                    callback: btnOnClick,
                  ),
                  CalculatorButton(
                    text: '00',
                    textSize: 20,
                    callback: btnOnClick,
                  ),
                  CalculatorButton(
                    text: '=',
                    textSize: 20,
                    callback: btnOnClick,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

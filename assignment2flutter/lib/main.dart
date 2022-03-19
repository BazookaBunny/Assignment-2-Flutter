import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:assignment2flutter/widgets/calculator_button.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(MaterialApp(
    title: 'Navigation Basics',
    home: MyHomePage(),
  ));
}

class MyHomePage extends StatelessWidget {
  int _counter = 0;
  final myController = TextEditingController();
  final myController1 = TextEditingController();

  void _incrementCounter() {
    /* setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    }); */
    _counter++;
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text("FirstRoute"),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Invoke "debug painting" (press "p" in the console, choose the
          // "Toggle Debug Paint" action from the Flutter Inspector in Android
          // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
          // to see the wireframe for each widget.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
              child: const Text(
                'Login Page',
                style: TextStyle(
                  fontSize: 35,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Courier',
                ),
              ),
            ),
            Container(
              width: 300,
              child: TextField(
                maxLength: 10,
                controller: myController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Email',
                ),
              ),
            ),
            Container(
              width: 300,
              child: TextField(
                obscureText: true,
                maxLength: 10,
                controller: myController1,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Password',
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.green,
                      onPrimary: Colors.white,
                      shadowColor: Colors.greenAccent,
                      elevation: 3,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(32.0)),
                      minimumSize: Size(100, 40), //////// HERE
                    ),
                    onPressed: () {
                      showDialog<void>(
                        context: context,
                        barrierDismissible: false, // user must tap button!
                        builder: (BuildContext context) {
                          String Ura = myController.text;
                          String Ura1 = myController1.text;
                          return AlertDialog(
                            title: Text('Submit'),
                            content: Text(Ura + "\n" + Ura1),
                            actions: <Widget>[
                              TextButton(
                                child: Text('Back'),
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                              ),
                            ],
                          );
                        },
                      );
                    },
                    child: Text('Submit'),
                  ),
                  Padding(
                      padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
                      child: ElevatedButton(
                          child: Text('Reset'),
                          style: ElevatedButton.styleFrom(
                            primary: Colors.green,
                            onPrimary: Colors.white,
                            shadowColor: Colors.greenAccent,
                            elevation: 3,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(32.0)),
                            minimumSize: Size(100, 40), //////// HERE
                          ),
                          onPressed: () {
                            Navigator.pop(context);
                          })),
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => CalculatorApp()),
          );
        },
        tooltip: 'Next Route',
        child: Icon(Icons.navigate_next),
      ),
    );
  }
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

class ThirdRoute extends StatelessWidget {
  int _counter = 0;

  void _incrementCounter() {
    /* setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    }); */
    _counter++;
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text("ThirdRoute"),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Invoke "debug painting" (press "p" in the console, choose the
          // "Toggle Debug Paint" action from the Flutter Inspector in Android
          // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
          // to see the wireframe for each widget.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Column(
              children: <Widget>[
                Text("SecondRoute"),
              ],
            ),
            ElevatedButton(
              child: Text('Back'),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

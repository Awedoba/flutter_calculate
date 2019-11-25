import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
      ),
      home: MyHomePage(title: 'A calculator'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String output = "0";

  String _output = "0";
  double val1 = 0.0;
  double val2 = 0.0;
  String operand = "";

  doTheMaths(String buttonText) {
    if (buttonText == "clear") {
      _output = "0";
      val1 = 0.0;
      val2 = 0.0;
      operand = "";
    } else if (buttonText == "+" ||
        buttonText == "-" ||
        buttonText == "/" ||
        buttonText == "*") {
      val1 = double.parse(output);
      operand = buttonText;
      _output = "0";
    } else if (buttonText == ".") {
      if (_output.contains(".")) {
        print("Blah");
        return;
      } else {
        _output = _output + buttonText;
      }
    } else if (buttonText == "=") {
      val2 = double.parse(output);
      switch (operand) {
        case "+":
          {
            _output = (val1 + val2).toString();
          }
          break;
        case "-":
          {
            _output = (val1 - val2).toString();
          }
          break;
        case "*":
          {
            _output = (val1 * val2).toString();
          }
          break;
        case "/":
          {
            _output = (val1 / val2).toString();
          }
          break;
      }
      val1 = 0.0;
      val2 = 0.0;
      operand = "";
    } else {
      _output = _output + buttonText;
    }
    setState(() {
      output = double.parse(_output).toStringAsFixed(2);
    });
  }

  Widget buttonWidget(String buttonText) {
    return new Expanded(
        child: OutlineButton(
      padding: EdgeInsets.all(24.0),
      child: Text(
        buttonText,
        style: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
      ),
      onPressed: () => doTheMaths(buttonText),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
          centerTitle: true,
        ),
        body: Column(
          children: <Widget>[
            Container(
              alignment: Alignment.centerRight,
              padding: EdgeInsets.symmetric(
                vertical: 24,
                horizontal: 12,
              ),
              child: new Text(
                '$output',
                style: TextStyle(
                  fontSize: 40.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Expanded(child: new Divider()),
            Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    buttonWidget("9"),
                    buttonWidget('8'),
                    buttonWidget('7'),
                    buttonWidget('-'),
                  ],
                ),
                Row(
                  children: <Widget>[
                    buttonWidget('6'),
                    buttonWidget('5'),
                    buttonWidget('4'),
                    buttonWidget('+'),
                  ],
                ),
                Row(
                  children: <Widget>[
                    buttonWidget('3'),
                    buttonWidget('2'),
                    buttonWidget('1'),
                    buttonWidget('*'),
                  ],
                ),
                Row(
                  children: <Widget>[
                    buttonWidget('.'),
                    buttonWidget('0'),
                    buttonWidget('00'),
                    buttonWidget('/'),
                  ],
                ),
                Row(
                  children: <Widget>[
                    buttonWidget('clear'),
                    buttonWidget('='),
                  ],
                ),
              ],
            ),
          ],
        ));
  }
}

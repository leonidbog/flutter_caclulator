import 'package:flutter/material.dart';
import 'package:flutter_caclulator/CalculatorController.dart';

void main() {
  runApp(CalculatorApp());
}

class CalculatorApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MVC Calculator',
      home: Calculator(),
    );
  }
}

class Calculator extends StatefulWidget {
  @override
  _CalculatorState createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  final controller = CalculatorController();

  Widget buildButton(String buttonText) {
    return Expanded(
      child: OutlinedButton(
        child: Text(
          buttonText,
          style: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        onPressed: () {
          setState(() {
            controller.buttonPressed(buttonText);
          });
        },
        style: OutlinedButton.styleFrom(
          padding: EdgeInsets.all(24.0),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('MVC Calculator'),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            Expanded(
              child: Container(
                padding: EdgeInsets.all(20.0),
                alignment: Alignment.bottomRight,
                child: Text(
                  controller.output,
                  style: TextStyle(fontSize: 48.0, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Row(
              children: <Widget>[
                buildButton('7'),
                buildButton('8'),
                buildButton('9'),
                buildButton('/'),
              ],
            ),
            Row(
              children: <Widget>[
                buildButton('4'),
                buildButton('5'),
                buildButton('6'),
                buildButton('*'),
              ],
            ),
            Row(
              children: <Widget>[
                buildButton('1'),
                buildButton('2'),
                buildButton('3'),
                buildButton('-'),
              ],
            ),
            Row(
              children: <Widget>[
                buildButton('.'),
                buildButton('0'),
                buildButton('00'),
                buildButton('+'),
              ],
            ),
            Row(
              children: <Widget>[
                buildButton('CLEAR'),
                buildButton('='),
              ],
            ),
          ],
        ),
      ),
    );
  }
}



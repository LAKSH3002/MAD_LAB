import 'package:flutter/material.dart';

void main() {
  runApp(CalculatorApp());
}

class CalculatorApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculator',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Calculator(),
    );
  }
}

class Calculator extends StatefulWidget {
  @override
  _CalculatorState createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  String _output = "0";
  String _outputHistory = "";

  void _onButtonPressed(String buttonText) {
    setState(() {
      if (buttonText == "C") {
        _output = "0";
        _outputHistory = "";
        return;
      } else if (buttonText == "⌫") {
        _output = _output.substring(0, _output.length - 1);
        if (_output.isEmpty) _output = "0";
        return;
      } else if (buttonText == "=") {
        _outputHistory += _output + " = ";
        _output = _calculate(_output);
        return;
      } else if (buttonText == ".") {
        if (!_output.contains(".")) {
          _output += buttonText;
        }
        return;
      } else if (_output == "0") {
        _output = buttonText;
        return;
      }
      _output += buttonText;
    });
  }

  String _calculate(String str) {
    // Use your own calculation logic here
    try {
      // You can use a math library or write your own parsing and evaluation logic
      // For simplicity, I'll just use eval from the 'dart:math' library
      return eval(str).toString();
    } catch (e) {
      return "Error";
    }
  }

  Widget _buildButton(String buttonText) {
    return Expanded(
      child: RaisedButton(
        onPressed: () => _onButtonPressed(buttonText),
        child: Text(
          buttonText,
          style: TextStyle(fontSize: 24.0),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Calculator"),
      ),
      body: Column(
        children: <Widget>[
          Container(
            alignment: Alignment.centerRight,
            padding: EdgeInsets.symmetric(vertical: 24.0, horizontal: 12.0),
            child: Text(
              _outputHistory,
              style: TextStyle(fontSize: 20.0),
            ),
          ),
          Container(
            alignment: Alignment.centerRight,
            padding: EdgeInsets.symmetric(vertical: 24.0, horizontal: 12.0),
            child: Text(
              _output,
              style: TextStyle(fontSize: 48.0),
            ),
          ),
          Expanded(
            child: Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    _buildButton("7"),
                    _buildButton("8"),
                    _buildButton("9"),
                    _buildButton("/"),
                  ],
                ),
                Row(
                  children: <Widget>[
                    _buildButton("4"),
                    _buildButton("5"),
                    _buildButton("6"),
                    _buildButton("*"),
                  ],
                ),
                Row(
                  children: <Widget>[
                    _buildButton("1"),
                    _buildButton("2"),
                    _buildButton("3"),
                    _buildButton("-"),
                  ],
                ),
                Row(
                  children: <Widget>[
                    _buildButton("0"),
                    _buildButton("."),
                    _buildButton("C"),
                    _buildButton("+"),
                  ],
                ),
                Row(
                  children: <Widget>[
                    _buildButton("⌫"),
                    _buildButton("="),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

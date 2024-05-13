import 'package:flutter/material.dart';
import 'distance_converter.dart';

class ConverterPage extends StatefulWidget {
  @override
  _ConverterPageState createState() => _ConverterPageState();
}

class _ConverterPageState extends State<ConverterPage> {
  final _controller = TextEditingController();
  String _result = '';

  void _convertKmToMiles() {
    double km = double.tryParse(_controller.text) ?? 0;
    double miles = DistanceConverter.kmToMiles(km);
    setState(() {
      _result = '${km.toStringAsFixed(2)} km is ${miles.toStringAsFixed(2)} miles';
    });
  }

  void _convertMilesToKm() {
    double miles = double.tryParse(_controller.text) ?? 0;
    double km = DistanceConverter.milesToKm(miles);
    setState(() {
      _result = '${miles.toStringAsFixed(2)} miles is ${km.toStringAsFixed(2)} km';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Distance converter'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              controller: _controller,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                hintText: 'Input a number',
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _convertKmToMiles,
              child: Text('Convert from km to miles'),
            ),
            ElevatedButton(
              onPressed: _convertMilesToKm,
              child: Text('Convert from miles to km'),
            ),
            SizedBox(height: 20),
            Text(_result, style: TextStyle(fontSize: 18)),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Go back'),
            ),
          ],
        ),
      ),
    );
  }
}

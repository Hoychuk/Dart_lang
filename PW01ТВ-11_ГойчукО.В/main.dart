import 'package:flutter/material.dart';

void main() {
  runApp(FuelCalculatorApp());
}

class FuelCalculatorApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fuel Calculator',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: FuelCalculatorScreen(),
    );
  }
}

class FuelCalculatorScreen extends StatefulWidget {
  @override
  _FuelCalculatorScreenState createState() => _FuelCalculatorScreenState();
}

class _FuelCalculatorScreenState extends State<FuelCalculatorScreen> {
  final TextEditingController carbonController = TextEditingController();
  final TextEditingController hydrogenController = TextEditingController();
  final TextEditingController oxygenController = TextEditingController();
  final TextEditingController sulfurController = TextEditingController();
  final TextEditingController nitrogenController = TextEditingController();
  
  double lowerHeatingValue = 0.0;

  void calculateHeatingValue() {
    double C = double.tryParse(carbonController.text) ?? 0.0;
    double H = double.tryParse(hydrogenController.text) ?? 0.0;
    double O = double.tryParse(oxygenController.text) ?? 0.0;
    double S = double.tryParse(sulfurController.text) ?? 0.0;
    double N = double.tryParse(nitrogenController.text) ?? 0.0;

    setState(() {
      lowerHeatingValue = (339*C + 1424*(H - O/8) + 92*S) / 1000; // kJ/g
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Fuel Calculator')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: carbonController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Carbon %'),
            ),
            TextField(
              controller: hydrogenController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Hydrogen %'),
            ),
            TextField(
              controller: oxygenController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Oxygen %'),
            ),
            TextField(
              controller: sulfurController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Sulfur %'),
            ),
            TextField(
              controller: nitrogenController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Nitrogen %'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: calculateHeatingValue,
              child: Text('Calculate'),
            ),
            SizedBox(height: 20),
            Text('Lower Heating Value: ${lowerHeatingValue.toStringAsFixed(2)} kJ/g'),
          ],
        ),
      ),
    );
  }
}

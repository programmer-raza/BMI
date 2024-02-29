import 'package:bmi/bmi_chart_screen.dart';
import 'package:bmi/height_conversion.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// Function to trigger the app build
void main() {
  runApp(const TabBarDemo());
}

// Class to build the app
class TabBarDemo extends StatelessWidget {
  const TabBarDemo({Key? key}) : super(key: key);

  // Build the app
  @override
  Widget build(BuildContext context) {
    // Set system status bar color
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent, // Make status bar transparent
      statusBarIconBrightness:
          Brightness.dark, // Use dark icons for better visibility
    ));

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DefaultTabController(
        length: 3, // Set the number of tabs
        initialIndex: 1, // Set initial tab index to 1 (Home tab)
        child: Scaffold(
          appBar: AppBar(
            title: const Text('BMI Calculator'),
            backgroundColor: Colors.lightBlue, // Set app bar color
            elevation: 0, // Remove app bar shadow
            bottom: const TabBar(
              tabs: [
                Tab(icon: Icon(Icons.calculate)), // Icon for Home
                Tab(icon: Icon(Icons.home_outlined)), // Icon for BMI Calculator
                Tab(
                    icon:
                        Icon(Icons.date_range_outlined)), // Icon for BMI Chart
              ],
            ),
          ),
          body: TabBarView(
            children: [
              BMIHeightConversion(), // Content for Home tab
              BMICalculator(), // Content for BMI Calculator tab
              BMIChartScreen(), // Content for BMI Chart tab
            ],
          ),
        ),
      ),
    );
  }
}

// BMI Calculator Widget
class BMICalculator extends StatefulWidget {
  const BMICalculator({Key? key}) : super(key: key);

  @override
  _BMICalculatorState createState() => _BMICalculatorState();
}

class _BMICalculatorState extends State<BMICalculator> {
  TextEditingController _heightController = TextEditingController();
  TextEditingController _weightController = TextEditingController();
  double _bmiResult = 0.0;
  String _weightStatus = '';

  void _calculateBMI() {
    double height = double.tryParse(_heightController.text) ?? 0.0;
    double weight = double.tryParse(_weightController.text) ?? 0.0;
    if (height > 0 && weight > 0) {
      double heightInMeters = height / 100; // convert height from cm to meters
      double bmi = weight / (heightInMeters * heightInMeters);
      String status = _interpretBMI(bmi);
      setState(() {
        _bmiResult = bmi;
        _weightStatus = status;
      });
    }
  }

  String _interpretBMI(double bmi) {
    if (bmi < 18.5) {
      return 'Underweight';
    } else if (bmi >= 18.5 && bmi < 24.9) {
      return 'Normal weight';
    } else if (bmi >= 25 && bmi < 29.9) {
      return 'Overweight';
    } else {
      return 'Obese';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: _heightController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Height (cm)',
              ),
            ),
            const SizedBox(height: 16.0),
            TextField(
              controller: _weightController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Weight (kg)',
              ),
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: _calculateBMI,
              child: const Text('Calculate BMI'),
            ),
            const SizedBox(height: 16.0),
            Text(
              'BMI: ${_bmiResult.toStringAsFixed(2)}',
              style: TextStyle(fontSize: 20.0),
              textAlign: TextAlign.center,
            ),
            Text(
              'Weight Status: $_weightStatus',
              style: TextStyle(fontSize: 20.0),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}

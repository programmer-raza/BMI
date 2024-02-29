// BMI Chart Screen Widget
import 'package:flutter/material.dart';

class BMIChartScreen extends StatelessWidget {
  const BMIChartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BMI Chart'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'BMI Ranges:',
              style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8.0),
            _buildBMIRange('Underweight', '< 18.5'),
            _buildBMIRange('Normal weight', '18.5 - 24.9'),
            _buildBMIRange('Overweight', '25.0 - 29.9'),
            _buildBMIRange('Obese', '>= 30.0'),
          ],
        ),
      ),
    );
  }

  Widget _buildBMIRange(String weightStatus, String bmiRange) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: Text(
              weightStatus,
              style: TextStyle(fontSize: 20.0),
            ),
          ),
          Expanded(
            flex: 1,
            child: Text(
              bmiRange,
              style: TextStyle(fontSize: 20.0),
              textAlign: TextAlign.right,
            ),
          ),
        ],
      ),
    );
  }
}

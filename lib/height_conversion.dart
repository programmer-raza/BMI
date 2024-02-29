import 'package:flutter/material.dart';

class BMIHeightConversion extends StatefulWidget {
  const BMIHeightConversion({Key? key}) : super(key: key);

  @override
  _BMIHeightConversionState createState() => _BMIHeightConversionState();
}

class _BMIHeightConversionState extends State<BMIHeightConversion> {
  TextEditingController _cmController = TextEditingController();
  TextEditingController _mController = TextEditingController();
  TextEditingController _footController = TextEditingController();
  TextEditingController _meterController = TextEditingController();
  String _convertedHeight = '';

  // Convert height from cm to m
  void _convertCmToM() {
    double cm = double.tryParse(_cmController.text) ?? 0.0;
    double m = cm / 100.0;
    setState(() {
      _convertedHeight = 'Converted Height: $m m';
    });
    _cmController.clear(); // Clear the CM text field
  }

  // Convert height from m to cm
  void _convertMToCm() {
    double m = double.tryParse(_mController.text) ?? 0.0;
    double cm = m * 100.0;
    setState(() {
      _convertedHeight = 'Converted Height: $cm cm';
    });
    _mController.clear(); // Clear the M text field
  }

  // Convert height from foot to meter
  void _convertFootToMeter() {
    double foot = double.tryParse(_footController.text) ?? 0.0;
    double meter = foot / 3.2808; // 1 foot = 0.3048 meters
    setState(() {
      _convertedHeight = 'Converted Height: $meter meters';
    });
    _footController.clear(); // Clear the foot text field
  }

  // Convert height from meter to foot
  void _convertMeterToFoot() {
    double meter = double.tryParse(_meterController.text) ?? 0.0;
    double foot = meter * 3.2808; // 1 meter = 3.2808 feet
    setState(() {
      _convertedHeight = 'Converted Height: $foot feet';
    });
    _meterController.clear(); // Clear the meter text field
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Height Conversion'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              _convertedHeight,
              style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16.0),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _cmController,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      labelText: 'Height (cm)',
                    ),
                  ),
                ),
                const SizedBox(width: 16.0),
                ElevatedButton(
                  onPressed: () {
                    _convertCmToM();
                  },
                  child: const Text('Convert to Meters'),
                ),
              ],
            ),
            const SizedBox(height: 16.0),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _mController,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      labelText: 'Height (m)',
                    ),
                  ),
                ),
                const SizedBox(width: 16.0),
                ElevatedButton(
                  onPressed: () {
                    _convertMToCm();
                  },
                  child: const Text('Convert to Centimeters'),
                ),
              ],
            ),
            const SizedBox(height: 16.0),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _footController,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      labelText: 'Height (foot)',
                    ),
                  ),
                ),
                const SizedBox(width: 16.0),
                ElevatedButton(
                  onPressed: () {
                    _convertFootToMeter();
                  },
                  child: const Text('Convert to Meters'),
                ),
              ],
            ),
            const SizedBox(height: 16.0),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _meterController,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      labelText: 'Height (meter)',
                    ),
                  ),
                ),
                const SizedBox(width: 16.0),
                ElevatedButton(
                  onPressed: () {
                    _convertMeterToFoot();
                  },
                  child: const Text('Convert to Feet'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

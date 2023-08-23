import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController heightController = TextEditingController();
  TextEditingController weightController = TextEditingController();

  double bmiResult = 0.0;
  String formattedNumber = "";
  void calculateBMI() {
    double height = double.tryParse(heightController.text) ?? 0.0;
    double weight = double.tryParse(weightController.text) ?? 0.0;
    bmiResult = weight / ((height / 100) * (height / 100));
    formattedNumber = bmiResult.toStringAsFixed(2);
    setState(() {});
  }

  void resetButton() {
    heightController.clear();
    weightController.clear();
    formattedNumber = "0.0";
    setState(() {});
  }

  Widget EditText(String label, TextEditingController controller) {
    return Container(
      margin: EdgeInsets.all(10),
      child: TextField(
        controller: controller,
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          labelText: label,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Body Mass Index")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            EditText("Berat Badan", weightController),
            EditText("Tinggi Badan", heightController),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: calculateBMI,
                  child: Text("Hitung"),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: resetButton,
                  child: Text("Reset"),
                )
              ],
            ),
            SizedBox(height: 20),
            Text("BMI: $formattedNumber"),
          ],
        ),
      ),
    );
  }
}

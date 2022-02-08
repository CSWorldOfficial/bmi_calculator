import 'package:bmi_calculator/constants.dart';
import 'package:bmi_calculator/screens/screen_home.dart';
import 'package:flutter/material.dart';

class ResultScreen extends StatefulWidget {
  int weight, height;
  String gender;

  @override
  _ResultScreenState createState() => _ResultScreenState();

  ResultScreen({
    required this.weight,
    required this.height,
    required this.gender,
  });
}

class _ResultScreenState extends State<ResultScreen> {
  //BMI = weight (kg) ÷ height2 (m)

  double bmi = 0;

  @override
  void initState() {
    double meters = 0.3048 * widget.height;
    bmi = (widget.weight) / (meters * meters);
    print(bmi);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Result"),
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              Expanded(child: Image.asset("assets/images/result.png")),
              Expanded(
                child: Container(
                  margin: EdgeInsets.all(10),
                  padding: EdgeInsets.all(20),
                  child: Hero(
                    tag: "weight",
                    child: Card(
                      elevation: 20,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Container(
                        margin: EdgeInsets.all(20),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              calculateStatus(bmi),
                              style: textStyleNormal,
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Text(
                              "${bmi.toStringAsPrecision(4)}",
                              style: textStyleLarge,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              ElevatedButton(
                  onPressed: () {
                    Navigator.popUntil(context, (route) => false);
                    openScreen(context, HomeScreen());
                  },
                  child: Text("Recheck")),
            ],
          ),
        ),
      ),
    );
  }

  String calculateStatus(double bmi) {
    /*BMI Rangess
  BMI	Category
  < 16.0	Severely Underweight
  16.0 - 18.4	Underweight
  18.5 - 24.9	Normal
  25.0 - 29.9	Overweight
  30.0 - 34.9	Moderately Obese
  35.0 - 39.9	Severely Obese
  > 40.0	Morbidly Obese*/
    if (bmi >= 40) {
      return "Morbidly Obese";
    } else if (bmi >= 35 && bmi <= 39.9) {
      return "Severely Obese";
    } else if (bmi >= 30.0 && bmi <= 34.9) {
      return "Moderately Obese";
    } else if (bmi >= 25.0 && bmi <= 29.9) {
      return "Overweight";
    } else if (bmi >= 18.5 && bmi <= 24.9) {
      return "Normal";
    } else if (bmi >= 16.0 && bmi <= 18.4) {
      return "Underweight";
    } else {
      return "Severely Underweight";
    }
  }
}

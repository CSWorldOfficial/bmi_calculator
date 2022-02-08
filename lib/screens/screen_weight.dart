import 'package:bmi_calculator/constants.dart';
import 'package:bmi_calculator/screens/screen_result.dart';
import 'package:flutter/material.dart';
import 'package:weight_slider/weight_slider.dart';

class WeightScreen extends StatefulWidget {
  String gender;
  int feet;

  WeightScreen({required this.gender, required this.feet});

  @override
  _WeightScreenState createState() => _WeightScreenState();
}

class _WeightScreenState extends State<WeightScreen> {
  int weight = 30;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Select weight"),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
                flex: 8,
                child: Hero(
                    tag: widget.gender,
                    child: Image.asset("assets/images/${widget.gender}.png"))),
            Expanded(
              flex: 4,
              child: Container(
                margin: EdgeInsets.all(20),
                child: Hero(
                  tag: "weight",
                  child: WeightSlider(
                    weight: weight,
                    minWeight: 30,
                    maxWeight: 120,
                    onChange: (val) {
                      setState(() {
                        weight = val;
                      });
                    },
                    unit: "kg",
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: ElevatedButton(
                  onPressed: () {
                    openScreen(context, ResultScreen(
                      gender: widget.gender,
                      height: widget.feet,
                      weight: weight,
                    ));
                  }, child: Text("Next")),
            ),
          ],
        ),
      ),
    );
  }
}

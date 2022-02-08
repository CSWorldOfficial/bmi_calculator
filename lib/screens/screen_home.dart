import 'package:bmi_calculator/constants.dart';
import 'package:bmi_calculator/screens/screen_height.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              flex: 1,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Select your ",
                    style: textStyleNormal,
                  ),
                  Text(
                    "Gender",
                    style: textStyleBold,
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 4,
              child: GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return HeightScreen("male");
                  }));
                },
                child: Hero(
                  tag: "male",
                  child: Card(
                    elevation: 20,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        SizedBox(height: 10,),
                        Expanded(
                            flex: 1,
                            child: Text(
                              "Male",
                              style: textStyleBold,
                            )),
                        Expanded(
                            flex: 7,
                            child: Container(
                                width: 250,
                                child: Image.asset("assets/images/male.png"))),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 20,),
            Expanded(
              flex: 4,
              child: GestureDetector(
                onTap: () {
                  openScreen(context, HeightScreen("female"));
                },
                child: Hero(
                  tag: "female",
                  child: Card(
                    elevation: 20,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Column(
                      children: [
                        SizedBox(height: 10,),
                        Expanded(
                            flex: 1,
                            child: Text(
                              "Female",
                              style: textStyleBold,
                            )),
                        Expanded(
                            flex: 7,
                            child: Container(
                                width: 250,
                                child: Image.asset("assets/images/female.png"))),
                      ],
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

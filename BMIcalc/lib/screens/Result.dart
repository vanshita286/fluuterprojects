import 'package:bmi_calc/screens/firstPage.dart';
import 'package:flutter/material.dart';

class Result extends StatefulWidget {
  double? bmi;
  String? category;
  Result({this.bmi = 0, this.category = "Normal", super.key});

  @override
  State<Result> createState() => _ResultState();
}

class _ResultState extends State<Result> {
  // TextEditingController textField = TextEditingController();
  getColor() {
    return (widget.category!.toLowerCase() == "normal"
        ? Colors.green
        : Colors.red);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              color: Color.fromARGB(255, 29, 30, 48),
            ),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Calculated BMI: ${(widget.bmi!).toStringAsFixed(1)}",
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                  Text(
                    "${widget.category}",
                    style: TextStyle(
                      color: getColor(),
                      fontSize: 30,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => FirstPage(),
                    ));
              },
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.08,
                color: Colors.pink,
                child: Center(
                  child: const Text(
                    "RE COMPUTE",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    ));
  }
}

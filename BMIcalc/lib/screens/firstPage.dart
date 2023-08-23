import 'package:bmi_calc/screens/Result.dart';
import 'package:bmi_calc/screens/loginPage.dart';
import 'package:flutter/material.dart';

class FirstPage extends StatefulWidget {
  const FirstPage({super.key});

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  double _ht = 180;
  double _wt = 30;
  int _age = 18;
  Color _iconColorWt = Colors.white;
  Color _iconColorAge = Colors.white;

  double _calcBMI(double wt, double ht) {
    return (wt / (ht * ht));
  }

  String _categorise(double bmi) {
    if (bmi >= 25)
      return "Overweight";
    else if (bmi > 18) return "Normal";
    return "UnderWeight";
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color.fromARGB(255, 11, 14, 33),
        appBar: AppBar(
          elevation: 0,
          title: Text("BMI CALCULATOR"),
          centerTitle: true,
          backgroundColor: Color.fromARGB(255, 11, 14, 33),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  color: Color.fromARGB(255, 29, 30, 48),
                  height: MediaQuery.of(context).size.height * 0.2,
                  width: MediaQuery.of(context).size.width * 0.4,
                  child: Column(
                    children: [
                      Icon(
                        Icons.male_sharp,
                        size: 80,
                        color: Colors.white,
                      ),
                      Text(
                        "MALE",
                        style: TextStyle(
                          color: Color.fromARGB(255, 140, 142, 157),
                          fontSize: 15,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  color: Color.fromARGB(255, 29, 30, 48),
                  height: MediaQuery.of(context).size.height * 0.20,
                  width: MediaQuery.of(context).size.width * 0.4,
                  child: Column(
                    children: [
                      Icon(
                        Icons.female_sharp,
                        size: 80,
                        color: Colors.white,
                      ),
                      Text(
                        "FEMALE",
                        style: TextStyle(
                          color: Color.fromARGB(255, 140, 142, 157),
                          fontSize: 15,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.03,
            ),
            Container(
              color: const Color.fromARGB(255, 29, 30, 48),
              width: MediaQuery.of(context).size.width * 0.87,
              height: MediaQuery.of(context).size.width * 0.45,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const Text(
                    "HEIGHT",
                    style: TextStyle(
                      color: Color.fromARGB(255, 140, 142, 157),
                      fontSize: 15,
                    ),
                  ),
                  Text(
                    "${_ht.toStringAsFixed(1)}",
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  // also see TextField()
                  Slider(
                      value: _ht,
                      min: 90,
                      max: 240,
                      inactiveColor: const Color.fromARGB(255, 106, 104, 104),
                      activeColor: Colors.white,
                      thumbColor: Colors.pink,
                      onChanged: (v) {
                        setState(() {
                          _ht = v;
                        });
                      })
                ],
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.03,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  color: const Color.fromARGB(255, 29, 30, 48),
                  height: MediaQuery.of(context).size.height * 0.2,
                  width: MediaQuery.of(context).size.width * 0.4,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      const Text(
                        "WEIGHT",
                        style: TextStyle(
                          color: Color.fromARGB(255, 140, 142, 157),
                          fontSize: 15,
                        ),
                      ),
                      Text(
                        "${_wt.toStringAsFixed(1)}",
                        style: const TextStyle(
                          fontSize: 30,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width * 0.12,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Color.fromARGB(255, 11, 14, 33),
                              boxShadow: [
                                BoxShadow(
                                  color: Color.fromARGB(255, 14, 18, 43),
                                  offset: Offset(3, 3),
                                  blurRadius: 6,
                                )
                              ],
                            ),
                            clipBehavior: Clip.hardEdge,
                            child: IconButton(
                                splashRadius: 10,
                                iconSize:
                                    MediaQuery.of(context).size.width * 0.07,
                                onPressed: () {
                                  if (_wt > 0) {
                                    _wt = double.parse(_wt.toStringAsFixed(1)) -
                                        0.1;
                                    // print("Weight is ${_wt}");
                                    _iconColorWt = _wt >= 0.1
                                        ? Colors.white
                                        : const Color.fromARGB(
                                            255, 140, 142, 157);
                                  }
                                  setState(() {});
                                },
                                icon: Icon(
                                  Icons.remove,
                                  color: _iconColorWt,
                                )),
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.045,
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width * 0.12,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Color.fromARGB(255, 11, 14, 33),
                              boxShadow: [
                                BoxShadow(
                                  color: Color.fromARGB(255, 14, 18, 43),
                                  offset: Offset(3, 3),
                                  blurRadius: 6,
                                )
                              ],
                            ),
                            clipBehavior: Clip.hardEdge,
                            child: IconButton(
                                splashRadius: 10,
                                iconSize:
                                    MediaQuery.of(context).size.width * 0.07,
                                onPressed: () {
                                  _wt += 0.1;
                                  _iconColorWt = Colors.white;
                                  setState(() {});
                                },
                                icon: const Icon(
                                  Icons.add,
                                  color: Colors.white,
                                )),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                Container(
                  color: const Color.fromARGB(255, 29, 30, 48),
                  height: MediaQuery.of(context).size.height * 0.2,
                  width: MediaQuery.of(context).size.width * 0.4,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      const Text(
                        "AGE",
                        style: TextStyle(
                          color: Color.fromARGB(255, 140, 142, 157),
                          fontSize: 15,
                        ),
                      ),
                      Text(
                        "$_age",
                        style: const TextStyle(
                          fontSize: 30,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width * 0.12,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Color.fromARGB(255, 11, 14, 33),
                              boxShadow: [
                                BoxShadow(
                                  color: Color.fromARGB(255, 14, 18, 43),
                                  offset: Offset(3, 3),
                                  blurRadius: 6,
                                )
                              ],
                            ),
                            clipBehavior: Clip.hardEdge,
                            child: IconButton(
                              splashRadius: 10,
                              iconSize:
                                  MediaQuery.of(context).size.width * 0.07,
                              icon: Icon(
                                Icons.remove,
                                color: _iconColorAge,
                              ),
                              onPressed: () {
                                if (_age > 1) {
                                  _age--;
                                  _iconColorAge = _age >= 2
                                      ? Colors.white
                                      : const Color.fromARGB(
                                          255, 140, 142, 157);
                                }

                                setState(() {});
                              },
                            ),
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.045,
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width * 0.12,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Color.fromARGB(255, 11, 14, 33),
                              boxShadow: [
                                BoxShadow(
                                  color: Color.fromARGB(255, 14, 18, 43),
                                  offset: Offset(3, 3),
                                  blurRadius: 6,
                                )
                              ],
                            ),
                            clipBehavior: Clip.hardEdge,
                            child: IconButton(
                              splashRadius: 10,
                              iconSize:
                                  MediaQuery.of(context).size.width * 0.07,
                              onPressed: () {
                                _iconColorAge = Colors.white;
                                _age++;
                                setState(() {});
                              },
                              splashColor: Colors.amber[50],
                              icon: const Icon(
                                Icons.add,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => LoginPage(),
                    ));
              },
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.08,
                color: Colors.pink,
                child: Center(
                  child: const Text(
                    "CALCULATE",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

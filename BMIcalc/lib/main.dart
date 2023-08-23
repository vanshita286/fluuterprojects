import 'package:bmi_calc/screens/firstPage.dart';
import 'package:flutter/material.dart';

void main() => runApp(
      const MaterialApp(
        debugShowCheckedModeBanner: false, //to remove
        home: FirstPage(),
        // routes: {
        //   "/home": (context) => FirstPage(),
        // },
      ),
    );

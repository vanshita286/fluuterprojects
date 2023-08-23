import 'package:flutter/material.dart';
import 'package:ted_app/shared/widgets/Body.dart';
import 'package:ted_app/shared/widgets/NavBar.dart';

class Front extends StatelessWidget {
  const Front({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: navBar(),
      body: body(),
    );
  }
}

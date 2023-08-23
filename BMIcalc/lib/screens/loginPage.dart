import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController textField = TextEditingController();
  List<Widget> v = [
    Text("hjsdhks"),
    Text("hjsdhks"),
    Text("hjsdhks"),
    Text("hjsdhks")
  ];
  Widget cc() {
    v.map((element) {
      return element;
    });

    return Text("THIS IS THE DEFALUT ELEMENT");
    for (int i = 0; i < 10; i++) {
      //forEach
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            // backgroundColor: Colors.red,
            body: Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      color: Colors.red,
      // decoration: const BoxDecoration(
      //   color: Color.fromARGB(255, 29, 30, 48),
      // ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            children: [cc()],
          ),
          TextField(
            controller: textField,

            obscureText: true,
            obscuringCharacter: "*", //by default "."
            keyboardType: TextInputType.number,
            // can be used for provinding suggestions just like google search or yotuube search do
            onChanged: (Shabd) {
              print("TF has Changed : \nEntered Data is: $Shabd");
            },
            decoration: InputDecoration(
              label: Text("Ph. no"),
              hintText: "9999999999",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5),
              ),
              prefixIcon: Icon(Icons.call),
              suffixIcon: Icon(Icons.search_rounded),
            ),

            onEditingComplete: () {
              print("Final Data: ${textField.text}");
            },
          ),
          TextField(
            controller: textField,

            obscureText: true,
            obscuringCharacter: "*", //by default "."
            keyboardType: TextInputType.number,
            // can be used for provinding suggestions just like google search or yotuube search do
            onChanged: (Shabd) {
              print("TF has Changed : \nEntered Data is: $Shabd");
            },
            decoration: InputDecoration(
              label: Text("Ph. no"),
              hintText: "9999999999",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5),
              ),
              prefixIcon: Icon(Icons.call),
              suffixIcon: Icon(Icons.search_rounded),
            ),

            onEditingComplete: () {
              print("Final Data: ${textField.text}");
            },
          ),
          Text(
            "Normal",
            style: GoogleFonts.germaniaOne(
              fontSize: 45,
            ),
          ),
          Text(
            "Normal",
            style: TextStyle(
              fontSize: 45,
            ),
          ),
          Container(
            width: 54,
            height: 54,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Colors.blue,
                  Colors.orange,
                  const Color.fromRGBO(244, 143, 177, 1)
                ],
              ),
            ),
            child: Card(
              elevation: 15,
              shadowColor: Colors.blue,
              child: Center(
                child: Text("Light"),
              ),
            ),
          ),
          SizedBox(
            width: double.infinity,
            height: MediaQuery.of(context).size.height * 0.2,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                const Chip(
                  label: Text("IntelliJ"),
                  avatar: CircleAvatar(
                    child: Text("👑"),
                  ),
                  deleteIcon: Icon(Icons.remove),
                  deleteIconColor: Colors.orange,
                ),
                const Chip(
                  label: Text("IntelliJ"),
                  avatar: CircleAvatar(
                    child: Text("👑"),
                  ),
                  deleteIcon: Icon(Icons.remove),
                  deleteIconColor: Colors.orange,
                ),
                const Chip(
                  label: Text("IntelliJ"),
                  avatar: CircleAvatar(
                    child: Text("👑"),
                  ),
                  deleteIcon: Icon(Icons.remove),
                  deleteIconColor: Colors.orange,
                ),
                const Chip(
                  label: Text("IntelliJ"),
                  avatar: CircleAvatar(
                    child: Text("👑"),
                  ),
                  deleteIcon: Icon(Icons.remove),
                  deleteIconColor: Colors.orange,
                ),
              ],
            ),
          ),
          SizedBox(
            width: double.infinity,
            height: MediaQuery.of(context).size.height * 0.2,
            child: ListView(
              children: [
                ListTile(
                  // tileColor: const Color.fromARGB(255, 19, 138, 23),
                  tileColor: Colors.orange,
                  leading: Icon(Icons.downhill_skiing),
                  title: Text("Let's Skii"),
                  subtitle: Text("Monteraa Falls"),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(66)),
                  // shape: CircleBorder(
                  //   eccentricity: 1,
                  //   side: BorderSide(
                  //     width: 2,
                  //     color: Color.fromARGB(255, 14, 60, 16),
                  //     style: BorderStyle.solid,
                  //   ),
                  // ),
                ),
              ],
            ),
          )
        ],
      ),
    )));
  }
}

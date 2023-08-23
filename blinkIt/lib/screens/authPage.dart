import 'package:flutter/material.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => AuthPageState();
}

class AuthPageState extends State<AuthPage> {
  bool isRegisterShow = false;
  bool isPasswordShow =
      false; // as we only need tis property for this page and will not acces this property out of this page

  // this key will be used to check the state of the form uniquely
  final _formKey = GlobalKey<FormState>();
  TextEditingController _emailCtrl = TextEditingController();
  TextEditingController _passwrdCtrl = TextEditingController();
  TextEditingController _emailCtrlRegister = TextEditingController();
  TextEditingController _passwrdCtrlRegister = TextEditingController();

  String? _validatePswrdLength(String? value) {
    if (value?.length != 8) {
      return "Minimum 8 chars";
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                isRegisterShow ? Text("REGISTER PAGE") : Text("LOGIN PAGE"),
                TextFormField(
                  controller: _emailCtrl,
                  decoration: InputDecoration(
                      hintText: "Email",
                      prefixIcon: Icon(
                        Icons.alternate_email,
                        color: Colors.white,
                      ),
                      suffixIcon: GestureDetector(
                        onTap: () {
                          _emailCtrl.clear();
                        },
                        child: Icon(
                          Icons.clear_rounded,
                          color: Colors.white,
                        ),
                      ),
                      hintStyle: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                      fillColor: Colors.blueAccent,
                      filled: true,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)))),
                  validator: (val) => null,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.01,
                ),
                TextFormField(
                  style: TextStyle(
                    color: Colors.white,
                  ),
                  obscureText: isPasswordShow,
                  obscuringCharacter: "⚫",
                  decoration: InputDecoration(
                      hintText: "Password",
                      prefixIcon: Icon(
                        Icons.lock_outline_sharp,
                        color: Colors.white,
                      ),
                      suffixIcon: GestureDetector(
                        onTap: () {
                          isPasswordShow = !isPasswordShow;
                          setState(() {});
                        },
                        child: isPasswordShow
                            ? Icon(
                                Icons.remove_red_eye_rounded,
                                color: Colors.white,
                              )
                            : Icon(
                                Icons.remove_red_eye_outlined,
                                color: Colors.white,
                              ),
                      ),
                      hintStyle: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                      fillColor: Colors.blueAccent,
                      filled: true,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)))),
                  validator: _validatePswrdLength,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.01,
                ),
                TextButton(
                  onPressed: () {},
                  child: Text("Don't have an account"),
                ),
                OutlinedButton(
                  onPressed: () {
                    _formKey.currentState!.validate();
                  },
                  child: Text("Login Now"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:login_ui/Screens/register/register.dart';
import 'package:login_ui/components/background.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: Background(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.symmetric(horizontal: 30),
              child: Text(
                "Login",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.purpleAccent[200],
                    fontSize: 36),
                textAlign: TextAlign.left,
              ),
            ),
            SizedBox(height: size.height * 0.03),
            Container(
                alignment: Alignment.center,
                margin: EdgeInsets.symmetric(horizontal: 30),
                child: textInput('Username', false)),
            SizedBox(height: size.height * 0.03),
            Container(
                alignment: Alignment.center,
                margin: EdgeInsets.symmetric(horizontal: 30),
                child: textInput('Password', true)),
            SizedBox(height: size.height * 0.05),
            Container(
              alignment: Alignment.center,
              margin: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
              child: RaisedButton(
                onPressed: () {},
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4.0)),
                textColor: Colors.white,
                padding: const EdgeInsets.all(0),
                child: Container(
                  alignment: Alignment.center,
                  height: 50.0,
                  width: size.width * 1,
                  decoration: new BoxDecoration(
                      borderRadius: BorderRadius.circular(4.0),
                      gradient: new LinearGradient(
                          colors: [Colors.purpleAccent, Colors.purpleAccent])),
                  padding: const EdgeInsets.all(0),
                  child: Text(
                    "Login",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                ),
              ),
            ),
            Container(
              alignment: Alignment.center,
              margin: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
              child: GestureDetector(
                onTap: () => {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => RegisterScreen()))
                },
                child: Text(
                  "Don't Have an Account? Sign up",
                  style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF2661FA)),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget textInput(String hint, bool obscure) {
    return TextField(
      obscureText: obscure,
      decoration: InputDecoration(
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.pink.withOpacity(0.3)),
          borderRadius: BorderRadius.circular(10),
        ),
        enabledBorder: UnderlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: Colors.transparent),
        ),
        labelText: hint,
        labelStyle: TextStyle(
          color: Colors.purpleAccent[200],
        ),
        filled: true,
        fillColor: Colors.purpleAccent[100]?.withOpacity(0.3),
      ),
    );
  }
}

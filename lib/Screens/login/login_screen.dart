import 'package:flutter/material.dart';
import 'package:login_ui/models/user.dart';
import 'package:login_ui/Screens/home.dart';
import 'package:login_ui/services/response/login_response.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => new _LoginPageState();
}

enum LoginStatus { notSignIn, signIn }

class _LoginPageState extends State<LoginPage> implements LoginCallBack {
  LoginStatus _loginStatus = LoginStatus.notSignIn;
  late BuildContext _ctx;
  late bool _isLoading = false;
  final formKey = new GlobalKey<FormState>();
  final scaffoldKey = new GlobalKey<ScaffoldState>();

  late String _username, _password;
  late LoginResponse _response;

  _LoginPageState() {
    _response = new LoginResponse(this);
  }

  void _submit() {
    final form = formKey.currentState;

    if (form!.validate()) {
      setState(() {
        _isLoading = true;
        form.save();
        _response.doLogin(_username, _password);
      });
    }
  }

  void _showSnackBar(String text) {
    scaffoldKey.currentState
        ?.showSnackBar(new SnackBar(content: new Text(text)));
  }

  var value;

  getPref() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    setState(() {
      value = preferences.getInt("value");

      _loginStatus = value == 1 ? LoginStatus.signIn : LoginStatus.notSignIn;
    });
  }

  signOut() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    setState(() {
      preferences.setInt("value", 0);
      preferences.commit();
      _loginStatus = LoginStatus.notSignIn;
    });
  }

  @override
  void initState() {
    super.initState();
    getPref();
  }

  @override
  Widget build(BuildContext context) {
    switch (_loginStatus) {
      case LoginStatus.notSignIn:
        _ctx = context;
        var loginButton = new RaisedButton(
          onPressed: _submit,
          child: new Text("Login"),
          color: Colors.green,
        );
        var loginForm = new Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            new Form(
              key: formKey,
              child: new Column(
                children: <Widget>[
                  new Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: new TextFormField(
                      onSaved: (val) => _username = val!,
                      decoration: new InputDecoration(labelText: "Username"),
                    ),
                  ),
                  new Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: new TextFormField(
                      onSaved: (val) => _password = val!,
                      decoration: new InputDecoration(labelText: "Password"),
                      obscureText: true,
                    ),
                  )
                ],
              ),
            ),
            loginButton
          ],
        );

        return new Scaffold(
          appBar: new AppBar(
            title: new Text("Login"),
          ),
          body: new Container(
            child: new Center(
              child: loginForm,
            ),
          ),
        );
        break;
      case LoginStatus.signIn:
        return HomeScreen();
        break;
    }
  }

  savePref(int value, String user, String pass) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    setState(() {
      preferences.setInt("value", value);
      preferences.setString("user", user);
      preferences.setString("pass", pass);
      preferences.commit();
    });
  }

  @override
  void onLoginError(String error) {
    _showSnackBar(error);
    setState(() => _isLoading = false);
  }

  @override
  void onLoginSuccess(User user) async {
    _showSnackBar(user.toString());
    setState(() => _isLoading = false);
    savePref(1, _username, _password);
    Navigator.of(context).pushReplacement(new MaterialPageRoute(
        builder: (BuildContext context) => new HomeScreen()));
  }
}
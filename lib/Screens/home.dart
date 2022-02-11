import 'package:flutter/material.dart';
import 'package:login_ui/Screens/login/login.dart';
import 'menu/penkajianPasien.dart';
import 'package:login_ui/Screens/menu/penkajianPasien.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: PengkajianScreen(),
    );
  } 
}

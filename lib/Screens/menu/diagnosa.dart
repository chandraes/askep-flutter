import 'package:flutter/material.dart';
import 'package:login_ui/components/sidebar.dart';

class DiagnosaScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          title: Text('Diagnosa'),
          backgroundColor: Colors.purple,
        ),
        drawer: SideBar(),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [],
          ),
        ));
  }
}

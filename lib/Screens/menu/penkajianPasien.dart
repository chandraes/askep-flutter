import 'package:flutter/material.dart';
import 'package:login_ui/components/sidebar.dart';


class PengkajianScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          title: Text('Pengkajian'),
          backgroundColor: Colors.purple,
        ),
        drawer: SideBar(),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _button("Data Pengkajian Pasien", onPressed: () {
                print("123123123");
              }),
              _button("Data Pengkajian Pasien Baru", onPressed: () {
                print("312321");
              }),
            ],
          ),
        ));
  }

  Widget _button(String text, {Function? onPressed}) {
    return Column(
      children:[
        ElevatedButton(
        child: Text(
          text,
          style: TextStyle(color: Colors.white),
        ),
        onPressed: () {
          onPressed?.call();
        },
      ),
      ] 
    );
  }
}

import 'package:flutter/material.dart';
import 'package:login_ui/components/sidebar.dart';

class PengkajianScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          title: Text('Pengkajian Pasien'),
          backgroundColor: Colors.purple,
        ),
        drawer: SideBar(),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Silahkan pilih menu berikut: ",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.purple),
              ),
              SizedBox(
                height: size.height * 0.02,
              ),
              _button("Data Pengkajian Pasien", onPressed: () {
                print("123123123");
              }),
              SizedBox(
                height: size.height * 0.02,
              ),
              _button("Data Pengkajian Pasien Baru", onPressed: () {
                print("312321");
              }),
            ],
          ),
        ));
  }

  Widget _button(String text, {Function? onPressed}) {
    return Column(children: [
      ElevatedButton(
        child: Text(
          text,
          style: TextStyle(color: Colors.white),
        ),
        onPressed: () {
          onPressed?.call();
        },
        style: TextButton.styleFrom(
            side: BorderSide(color: Colors.purple, width: 2),
            primary: Colors.purple,
            padding: EdgeInsets.all(13),
            elevation: 5,
            backgroundColor: Colors.purple[400],
            shadowColor: Colors.purpleAccent,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10))),
      ),
    ]);
  }
}

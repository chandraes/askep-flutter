import 'package:flutter/material.dart';
import 'package:login_ui/Screens/menu/diagnosa.dart';
import 'package:login_ui/Screens/menu/penkajianPasien.dart';

class SideBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          DrawerHeader(
            child: Container(
              child: Column(children: [
                Image.asset(
                  'assets/images/logo.png',
                  width: 100,
                ),
                Spacer(),
                Text('ASKEP Unsri',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white)),
              ]),
            ),
            decoration: BoxDecoration(
              color: Colors.purple,
            ),
          ),
          _listTile("Pengkajian Pasien", Icons.summarize, onTapMenu: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => PengkajianScreen()));
          }),
          _listTile("Diagnosa", Icons.sick, onTapMenu: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => DiagnosaScreen()));
          }),
        ],
      ),
    );
  }

  Widget _listTile(String title, IconData icon, {Function? onTapMenu}) {
    return ListTile(
      title: Text(
        title,
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
      ),
      leading: Icon(
        icon,
        color: Colors.purple,
      ),
      onTap: () {
        onTapMenu?.call();
      },
      textColor: Colors.purple,
    );
  }
}

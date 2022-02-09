import 'package:flutter/material.dart';

class Background extends StatelessWidget {
  final Widget child;

  const Background({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Container(
        width: double.infinity,
        height: size.height,
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Container(
                  width: size.width * 0.3,
                  height: size.height * 0.3,
                  child: Image.asset(
                    "assets/images/logo.png",
                    width: size.width * 0.2,
                  ),
                ),
                Container(
                  width: size.width * 0.3,
                  height: size.height * 0.3,
                  child: Image.asset(
                    "assets/images/askep.png",
                    width: size.width * 0.2,
                  ),
                ),
              ],
            ),
          ),
          Container(
            child: child,
          )
        ]),
      ),
    );
  }
}

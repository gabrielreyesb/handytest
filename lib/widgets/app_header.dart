import 'package:flutter/material.dart';

class AppHeader extends StatelessWidget {
  const AppHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        SizedBox(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 40, vertical: 20),
            child: Image(
              image: AssetImage('assets/images/handy_logo1.png'),
              width: 200,
            ),
          ),
        ),
        Divider(
          color: Colors.black,
          thickness: 1,
        ),
        SizedBox(
          height: 15,
        ),
        Padding(
          padding: EdgeInsets.only(left: 10),
          child: Text(
            'Set de pruebas',
            style: TextStyle(
                color: Colors.black, fontSize: 14, fontWeight: FontWeight.bold),
          ),
        ),
        SizedBox(
          height: 15,
        ),
      ],
    );
  }
}

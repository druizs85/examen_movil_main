import 'package:flutter/material.dart';

import '../widgets.dart';

class LoginContainer2 extends StatelessWidget {
  const LoginContainer2({super.key});
  @override
  Widget build(BuildContext context) {
    final sizeScreen = MediaQuery.of(context).size;
    return Container(
      width: double.infinity,
      height: sizeScreen.height * .4,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color.fromRGBO(107, 179, 220, 1),
            Color.fromRGBO(78, 17, 113, 1),
          ],
        ),
      ),
      child: Stack(
        children: [
          Positioned(top: 90, left: 30, child: Buble()),
          Positioned(top: -40, left: -30, child: Buble()),
          Positioned(top: 70, left: -30, child: Buble()),
          Positioned(top: 85, left: 300, child: Buble()),
          Positioned(top: -40, left: 350, child: Buble()),
        ],
      ),
    );
  }
}
